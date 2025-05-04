using Backend_dotnet.Core.Constants;
using Backend_dotnet.Core.Dtos.Auth;
using Backend_dotnet.Core.Dtos.General;
using Backend_dotnet.Core.Entities;
using Backend_dotnet.Core.Interfaces;
using Microsoft.AspNetCore.Identity;
using Microsoft.EntityFrameworkCore;
using Microsoft.IdentityModel.Tokens;
using System.IdentityModel.Tokens.Jwt;
using System.Security.Claims;
using System.Text;


namespace Backend_dotnet.Core.Services



{



    public class AuthService : IAuthService
    {
        #region Constructor & DI
        private readonly UserManager<ApplicationUser> _userManager;
        private readonly RoleManager<IdentityRole> _roleManager;
        private readonly ILogService _logService;
        private readonly IConfiguration _configuration;

        public AuthService(UserManager<ApplicationUser> userManager, RoleManager<IdentityRole> roleManager, ILogService logService, IConfiguration configuration)
        {
            _userManager = userManager;
            _roleManager = roleManager;
            _logService = logService;
            _configuration = configuration;
        }
        #endregion

        #region SeedRolesAsync
        public async Task<GeneralServiceResponseDto> SeedRolesAsync()
        {
            bool isAdminRoleExists = await _roleManager.RoleExistsAsync(StaticUserRoles.ADMIN);
            bool isManagerRoleExists = await _roleManager.RoleExistsAsync(StaticUserRoles.MANAGER);
            bool isUserRoleExists = await _roleManager.RoleExistsAsync(StaticUserRoles.USER);

            if (isAdminRoleExists && isManagerRoleExists && isUserRoleExists)
                return new GeneralServiceResponseDto()
                {
                    IsSucceed = true,
                    StatusCode = 200,
                    Message = "Roles Seeding is Already Done"
                };

            await _roleManager.CreateAsync(new IdentityRole(StaticUserRoles.ADMIN));
            await _roleManager.CreateAsync(new IdentityRole(StaticUserRoles.MANAGER));
            await _roleManager.CreateAsync(new IdentityRole(StaticUserRoles.USER));

            return new GeneralServiceResponseDto()
            {
                IsSucceed = true,
                StatusCode = 201,
                Message = "Roles Seeding Done Successfully"
            };
        }
        #endregion

        #region RegisterAsync
        public async Task<GeneralServiceResponseDto> RegisterAsync(ClaimsPrincipal User, RegisterDto registerDto)
        {

            // Only ADMIN can register new users
            //if (!User.IsInRole(StaticUserRoles.ADMIN))
            //    return new GeneralServiceResponseDto()
            //    {
            //        IsSucceed = false,
            //        StatusCode = 403,
            //        Message = "Only admins can register new users"
            //    };


            var isExistsUser = await _userManager.FindByNameAsync(registerDto.UserName);
            if (isExistsUser is not null)
                return new GeneralServiceResponseDto()
                {
                    IsSucceed = false,
                    StatusCode = 409,
                    Message = "UserName Already Exists"
                };

            ApplicationUser newUser = new ApplicationUser()
            {
                FirstName = registerDto.FirstName,
                LastName = registerDto.LastName,
                Email = registerDto.Email,
                UserName = registerDto.UserName,
                Address = registerDto.Address,
                SecurityStamp = Guid.NewGuid().ToString()
            };

            var createUserResult = await _userManager.CreateAsync(newUser, registerDto.Password);

            if (!createUserResult.Succeeded)
            {
                var errorString = "User Creation failed because: ";
                foreach (var error in createUserResult.Errors)
                {
                    errorString += " # " + error.Description;
                }
                return new GeneralServiceResponseDto()
                {
                    IsSucceed = false,
                    StatusCode = 400,
                    Message = errorString
                };
            }

            // Add a Default USER Role to all users
            await _userManager.AddToRoleAsync(newUser, StaticUserRoles.USER);
            await _logService.SaveNewLog(newUser.UserName, "Registered to Website");

            return new GeneralServiceResponseDto()
            {
                IsSucceed = true,
                StatusCode = 201,
                Message = "User Created Successfully"
            };
        }
        #endregion

        #region LoginAsync
        public async Task<LoginServiceResponseDto?> LoginAsync(LoginDto loginDto)
        {
            // Find user with username
            var user = await _userManager.FindByNameAsync(loginDto.UserName);
            if (user is null)
                return null;

            // check password of user
            var isPasswordCorrect = await _userManager.CheckPasswordAsync(user, loginDto.Password);
            if (!isPasswordCorrect)
                return null;

            // Return Token and userInfo to front-end
            var newToken = await GenerateJWTTokenAsync(user);
            var roles = await _userManager.GetRolesAsync(user);
            var userInfo = GenerateUserInfoObject(user, roles);
            await _logService.SaveNewLog(user.UserName, "New Login");

            return new LoginServiceResponseDto()
            {
                NewToken = newToken,
                UserInfo = userInfo
            };
        }
        #endregion

        #region UpdateRoleAsync
        public async Task<GeneralServiceResponseDto> UpdateRoleAsync(ClaimsPrincipal User, UpdateRoleDto updateRoleDto)
        {

            var user = await _userManager.FindByNameAsync(updateRoleDto.UserName);
            if (user is null)
                return new GeneralServiceResponseDto()
                {
                    IsSucceed = false,
                    StatusCode = 404,
                    Message = "User not found"
                };

            // Only ADMIN can update roles
            if (!User.IsInRole(StaticUserRoles.ADMIN))
                return new GeneralServiceResponseDto()
                {
                    IsSucceed = false,
                    StatusCode = 403,
                    Message = "Only admins can change roles"
                };

            // Get current roles of the target user
            var userRoles = await _userManager.GetRolesAsync(user);

            // Prevent changing another ADMIN's role
            if (userRoles.Contains(StaticUserRoles.ADMIN))
                return new GeneralServiceResponseDto()
                {
                    IsSucceed = false,
                    StatusCode = 403,
                    Message = "Cannot change the role of an admin"
                };

            if (updateRoleDto.NewRole != RoleType.USER && updateRoleDto.NewRole != RoleType.MANAGER && updateRoleDto.NewRole != RoleType.ADMIN)
                return new GeneralServiceResponseDto()
                {
                    IsSucceed = false,
                    StatusCode = 400,
                    Message = "Invalid role. Only USER or MANAGER or ADMIN can be assigned"
                };

            // Update the user's role
            await _userManager.RemoveFromRolesAsync(user, userRoles);
            await _userManager.AddToRoleAsync(user, updateRoleDto.NewRole.ToString());
            await _logService.SaveNewLog(user.UserName, $"Role updated to {updateRoleDto.NewRole}");

            return new GeneralServiceResponseDto()
            {
                IsSucceed = true,
                StatusCode = 200,
                Message = "Role updated successfully"
            };
        }
        #endregion

        #region MeAsync
        public async Task<LoginServiceResponseDto?> MeAsync(MeDto meDto)
        {
            ClaimsPrincipal handler = new JwtSecurityTokenHandler().ValidateToken(meDto.Token, new TokenValidationParameters()
            {
                ValidateIssuer = true,
                ValidateAudience = true,
                ValidIssuer = _configuration["JWT:ValidIssuer"],
                ValidAudience = _configuration["JWT:ValidAudience"],
                IssuerSigningKey = new SymmetricSecurityKey(Encoding.UTF8.GetBytes(_configuration["JWT:Secret"]))
            }, out SecurityToken securityToken);

            string decodedUserName = handler.Claims.First(q => q.Type == ClaimTypes.Name).Value;
            if (decodedUserName is null)
                return null;

            var user = await _userManager.FindByNameAsync(decodedUserName);
            if (user is null)
                return null;

            var newToken = await GenerateJWTTokenAsync(user);
            var roles = await _userManager.GetRolesAsync(user);
            var userInfo = GenerateUserInfoObject(user, roles);
            await _logService.SaveNewLog(user.UserName, "New Token Generated");

            return new LoginServiceResponseDto()
            {
                NewToken = newToken,
                UserInfo = userInfo
            };
        }
        #endregion

        #region GetUsersListAsync
        public async Task<IEnumerable<UserInfoResult>> GetUsersListAsync()
        {
            var users = await _userManager.Users.ToListAsync();

            List<UserInfoResult> userInfoResults = new List<UserInfoResult>();

            foreach (var user in users)
            {
                var roles = await _userManager.GetRolesAsync(user);
                var userInfo = GenerateUserInfoObject(user, roles);
                userInfoResults.Add(userInfo);
            }

            return userInfoResults;
        }
        #endregion

        #region GetUserDetailsByUserNameAsync
        public async Task<UserInfoResult?> GetUserDetailsByUserNameAsync(string userName)
        {
            var user = await _userManager.FindByNameAsync(userName);
            if (user is null)
                return null;

            var roles = await _userManager.GetRolesAsync(user);
            var userInfo = GenerateUserInfoObject(user, roles);
            return userInfo;
        }
        #endregion

        #region GetUsernamesListAsync
        public async Task<IEnumerable<string>> GetUsernamesListAsync()
        {
            var userNames = await _userManager.Users
                .Select(q => q.UserName)
                .ToListAsync();

            return userNames;
        }
        #endregion

        #region GenerateJWTTokenAsync
        private async Task<string> GenerateJWTTokenAsync(ApplicationUser user)
        {
            var userRoles = await _userManager.GetRolesAsync(user);

            var authClaims = new List<Claim>
        {
            new Claim(ClaimTypes.Name, user.UserName),
            new Claim(ClaimTypes.NameIdentifier, user.Id),
            new Claim("FirstName", user.FirstName),
            new Claim("LastName", user.LastName),
        };

            foreach (var userRole in userRoles)
            {
                authClaims.Add(new Claim(ClaimTypes.Role, userRole));
            }

            var authSecret = new SymmetricSecurityKey(Encoding.UTF8.GetBytes(_configuration["JWT:Secret"]));
            var signingCredentials = new SigningCredentials(authSecret, SecurityAlgorithms.HmacSha256);

            var tokenObject = new JwtSecurityToken(
                issuer: _configuration["JWT:ValidIssuer"],
                audience: _configuration["JWT:ValidAudience"],
                notBefore: DateTime.Now,
                expires: DateTime.Now.AddHours(3),
                claims: authClaims,
                signingCredentials: signingCredentials
                );

            string token = new JwtSecurityTokenHandler().WriteToken(tokenObject);
            return token;
        }
        #endregion


        private UserInfoResult GenerateUserInfoObject(ApplicationUser user, IEnumerable<string> Roles)
        {
            // Instead of this, You can use Automapper packages. But i don't want it in this project
            return new UserInfoResult()
            {
                Id = user.Id,
                FirstName = user.FirstName,
                LastName = user.LastName,
                UserName = user.UserName,
                Email = user.Email,
                CreatedAt = user.CreatedAt,
                Roles = Roles
            };
        }

        public async Task<GeneralServiceResponseDto> UpdateCredentialsAsync(ClaimsPrincipal User, UpdateCredentialsDto updateCredentialsDto)
        {

            var response = new GeneralServiceResponseDto
            {
                IsSucceed = false,
                StatusCode = 400,
                Message = ""
            };

            try
            {
                // Get the current user from the ClaimsPrincipal
                var userId = User.FindFirst(ClaimTypes.NameIdentifier)?.Value;
                if (string.IsNullOrEmpty(userId))
                {
                    response.Message = "User identity not found.";
                    return response;
                }

                var currentUser = await _userManager.FindByIdAsync(userId);
                if (currentUser == null)
                {
                    response.Message = "User not found.";
                    return response;
                }

                // Verify the current password
                var isPasswordValid = await _userManager.CheckPasswordAsync(currentUser, updateCredentialsDto.CurrentPassword);
                if (!isPasswordValid)
                {
                    response.Message = "Current password is incorrect.";
                    return response;
                }

                // Update FirstName, LastName, and Address if provided
                if (!string.IsNullOrEmpty(updateCredentialsDto.FirstName))
                    currentUser.FirstName = updateCredentialsDto.FirstName;
                if (!string.IsNullOrEmpty(updateCredentialsDto.LastName))
                    currentUser.LastName = updateCredentialsDto.LastName;
                if (!string.IsNullOrEmpty(updateCredentialsDto.Address))
                    currentUser.Address = updateCredentialsDto.Address;

                // Update Email if provided
                if (!string.IsNullOrEmpty(updateCredentialsDto.Email))
                {
                    var existingUser = await _userManager.FindByEmailAsync(updateCredentialsDto.Email);
                    if (existingUser != null && existingUser.Id != currentUser.Id)
                    {
                        response.Message = "Email is already in use by another user.";
                        return response;
                    }
                    currentUser.Email = updateCredentialsDto.Email;
                    // Optionally reset email confirmation if verification is required
                    // currentUser.EmailConfirmed = false;
                    // await _userManager.GenerateEmailConfirmationTokenAsync(currentUser);
                }

                // Update Password if provided
                if (!string.IsNullOrEmpty(updateCredentialsDto.NewPassword))
                {
                    // Basic password complexity check
                    if (updateCredentialsDto.NewPassword.Length < 8)
                    {
                        response.Message = "New password must be at least 8 characters.";
                        return response;
                    }
                    var passwordChangeResult = await _userManager.ChangePasswordAsync(currentUser, updateCredentialsDto.CurrentPassword, updateCredentialsDto.NewPassword);
                    if (!passwordChangeResult.Succeeded)
                    {
                        response.Message = "Failed to update password. Reasons: ";
                        response.Message += string.Join(" # ", passwordChangeResult.Errors.Select(e => e.Description));
                        return response;
                    }
                    // Note: User will need to log in again since the session isn't refreshed
                }

                // Save changes to the user
                var updateResult = await _userManager.UpdateAsync(currentUser);
                if (!updateResult.Succeeded)
                {
                    response.Message = "Failed to update credentials. Reasons: ";
                    response.Message += string.Join(" # ", updateResult.Errors.Select(e => e.Description));
                    return response;
                }

                // Log the update
                await _logService.SaveNewLog(currentUser.UserName, "Updated credentials");

                response.IsSucceed = true;
                response.StatusCode = 200;
                response.Message = "Credentials updated successfully.";
            }
            catch (Exception ex)
            {
                response.Message = "An error occurred while updating credentials. Details: " + ex.Message;
            }

            return response;
        }
    }
}

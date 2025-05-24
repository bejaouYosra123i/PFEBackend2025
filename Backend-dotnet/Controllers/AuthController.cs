using Backend_dotnet.Core.Constants;
using Backend_dotnet.Core.Dtos.Auth;
using Backend_dotnet.Core.Interfaces;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Backend_dotnet.Core.Dtos;
using Microsoft.AspNetCore.Identity;
using Backend_dotnet.Core.Services;
using System.Security.Claims;
using Backend_dotnet.Core.Entities;

namespace Backend_dotnet.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class AuthController : ControllerBase
    {
        private readonly IAuthService _authService;
        private readonly PrivilegeService _privilegeService;
        private readonly UserManager<ApplicationUser> _userManager;

        public AuthController(IAuthService authService, PrivilegeService privilegeService, UserManager<ApplicationUser> userManager)
        {
            _authService = authService;
            _privilegeService = privilegeService;
            _userManager = userManager;
        }

        // Route -> Seed Roles to DB
        [HttpPost]
        [Route("seed-roles")]
        public async Task<IActionResult> SeedRoles()
        {
            var seedResult = await _authService.SeedRolesAsync();
            return StatusCode(seedResult.StatusCode, seedResult.Message);
        }

        // Route -> Register
        [HttpPost]
        [Route("register")]
        [Authorize]
        public async Task<IActionResult> Register([FromBody] RegisterDto registerDto)
        {
            var currentUserId = User.FindFirst(ClaimTypes.NameIdentifier)?.Value;
            var isAdmin = User.IsInRole(StaticUserRoles.ADMIN);
            var hasManageUsers = await _privilegeService.UserHasPrivilegeAsync(currentUserId, "ManageUsers");
            if (!isAdmin && !hasManageUsers)
                return Forbid();
            var registerResult = await _authService.RegisterAsync(User, registerDto);
            return StatusCode(registerResult.StatusCode, registerResult.Message);
        }

        // Route -> Login
        [HttpPost]
        [Route("login")]
        //we use this ActionResult<LoginServiceResponseDto> instead of this IActionResult 'cause we are sending a token to the front end
        public async Task<ActionResult<LoginServiceResponseDto>> Login([FromBody] LoginDto loginDto)
        {
            var loginResult = await _authService.LoginAsync(loginDto);

            if (loginResult is null)
            {
                return Unauthorized("Your credentials are invalid. Please contact to an Admin");
            }

            return Ok(loginResult);
        }

        // Route -> Update User Role
        // An Admin can change just User to Manager or reverse
        // Manager and User Roles don't have access to this Route
        [HttpPost]
        [Route("update-role")]
        [Authorize]
        public async Task<IActionResult> UpdateRole([FromBody] UpdateRoleDto updateRoleDto)
        {
            var currentUserId = User.FindFirst(ClaimTypes.NameIdentifier)?.Value;
            var isAdmin = User.IsInRole(StaticUserRoles.ADMIN);
            var hasManageUsers = await _privilegeService.UserHasPrivilegeAsync(currentUserId, "ManageUsers");
            if (!isAdmin && !hasManageUsers)
                return Forbid();
            var updateRoleResult = await _authService.UpdateRoleAsync(User, updateRoleDto);
            if (updateRoleResult.IsSucceed)
            {
                return Ok(updateRoleResult.Message);
            }
            else
            {
                return StatusCode(updateRoleResult.StatusCode, updateRoleResult.Message);
            }
        }

        // Route -> getting data of a user from it's JWT
        [HttpPost]
        [Route("me")]
        public async Task<ActionResult<LoginServiceResponseDto>> Me([FromBody] MeDto token)
        {
            try
            {
                var me = await _authService.MeAsync(token);
                if (me is not null)
                {
                    return Ok(me);
                }
                else
                {
                    return Unauthorized("Invalid Token");
                }
            }
            catch (Exception)
            {
                return Unauthorized("Invalid Token");
            }
        }



        [HttpPut]
        [Route("update-credentials")]
        [Authorize]
        public async Task<IActionResult> UpdateCredentials([FromBody] UpdateCredentialsDto updateCredentialsDto)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            var result = await _authService.UpdateCredentialsAsync(User, updateCredentialsDto);

            if (result.IsSucceed)
            {
                return Ok(result.Message);
            }
            else
            {
                return StatusCode(result.StatusCode, result.Message);
            }
        }



        // Route -> List of all users with details
        [HttpGet]
        [Route("users")]
        [Authorize]
        public async Task<ActionResult<IEnumerable<UserInfoResult>>> GetUsersList()
        {
            var currentUserId = User.FindFirst(ClaimTypes.NameIdentifier)?.Value;
            var isAdmin = User.IsInRole(StaticUserRoles.ADMIN);
            var hasManageUsers = await _privilegeService.UserHasPrivilegeAsync(currentUserId, "ManageUsers");
            if (!isAdmin && !hasManageUsers)
                return Forbid();
            var usersList = await _authService.GetUsersListAsync();
            return Ok(usersList);
        }

        // Route -> Get a User by UserName
        [HttpGet]
        [Authorize]
        [Route("users/{userName}")]
        public async Task<ActionResult<UserInfoResult>> GetUserDetailsByUserName([FromRoute] string userName)
        {
            var currentUserId = User.FindFirst(ClaimTypes.NameIdentifier)?.Value;
            var isAdmin = User.IsInRole(StaticUserRoles.ADMIN);
            var hasManageUsers = await _privilegeService.UserHasPrivilegeAsync(currentUserId, "ManageUsers");
            if (!isAdmin && !hasManageUsers)
                return Forbid();

            var user = await _authService.GetUserDetailsByUserNameAsync(userName);
            if (user is not null)
            {
                return Ok(user);
            }
            else
            {
                return NotFound("UserName not found");
            }
        }

        // Route -> Get List of all usernames for send message
        [HttpGet]
        [Route("usernames")]
        public async Task<ActionResult<IEnumerable<string>>> GetUserNamesList()
        {
            var usernames = await _authService.GetUsernamesListAsync();

            return Ok(usernames);
        }

        // Route -> Delete user by id (simple, sans vérification de mot de passe)
        [HttpDelete("users/{id}")]
        [Authorize]
        public async Task<IActionResult> DeleteUser(string id)
        {
            var currentUserId = User.FindFirst(ClaimTypes.NameIdentifier)?.Value;
            var isAdmin = User.IsInRole(StaticUserRoles.ADMIN);
            var hasManageUsers = await _privilegeService.UserHasPrivilegeAsync(currentUserId, "ManageUsers");
            if (!isAdmin && !hasManageUsers)
                return Forbid();
            var result = await _authService.DeleteUserByIdAsync(User, id);
            if (result.IsSucceed)
                return Ok(result.Message);
            return StatusCode(result.StatusCode, result.Message);
        }

        // Route -> Delete user with password verification
        // [HttpPost("users/verify-and-delete")]
        // [Authorize(Roles = StaticUserRoles.ADMIN)]
        // public async Task<IActionResult> VerifyAndDelete([FromBody] DeleteUserDto dto)
        // {
        //     var result = await _authService.VerifyAndDeleteAsync(User, dto);
        //     if (result.IsSucceed)
        //         return Ok(result.Message);
        //     return StatusCode(result.StatusCode, result.Message);
        // }

        // Route -> Get List of all admin usernames
        [HttpGet]
        [Route("admin-usernames")]
        [AllowAnonymous]
        public async Task<ActionResult<IEnumerable<string>>> GetAdminUserNamesList()
        {
            var admins = await _userManager.GetUsersInRoleAsync("ADMIN");
            var usernames = admins.Select(u => u.UserName).ToList();
            return Ok(usernames);
        }

        // Route -> Reset password for a user (admin only)
        [HttpPost]
        [Route("reset-password")]
        [Authorize(Roles = StaticUserRoles.ADMIN)]
        public async Task<IActionResult> ResetPassword([FromBody] ResetPasswordDto dto)
        {
            var result = await _authService.ResetPasswordAsync(dto.UserName, dto.NewPassword);
            if (result.IsSucceed)
                return Ok(new { newPassword = result.Message });
            return StatusCode(result.StatusCode, result.Message);
        }
    }

    public class ResetPasswordDto
    {
        public string UserName { get; set; }
        public string? NewPassword { get; set; }
    }
}
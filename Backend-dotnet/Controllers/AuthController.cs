using Backend_dotnet.Core.Constants;
using Backend_dotnet.Core.Dtos.Auth;
using Backend_dotnet.Core.Interfaces;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Backend_dotnet.Core.Dtos;
using Microsoft.AspNetCore.Identity;
using Backend_dotnet.Core.Entities;

namespace Backend_dotnet.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class AuthController : ControllerBase
    {
        private readonly IAuthService _authService;
        private readonly UserManager<ApplicationUser> _userManager;

        public AuthController(IAuthService authService, UserManager<ApplicationUser> userManager)
        {
            _authService = authService;
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
        [Authorize(Roles = StaticUserRoles.ADMIN)]
        public async Task<IActionResult> Register([FromBody] RegisterDto registerDto)
        {
            var registerResult = await _authService.RegisterAsync(User, registerDto);
            return StatusCode(registerResult.StatusCode, registerResult.Message);
        }

        // Route -> Login
        [HttpPost]
        [Route("login")]
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
        [HttpPost]
        [Route("update-role")]
        [Authorize(Roles = StaticUserRoles.ADMIN)]
        public async Task<IActionResult> UpdateRole([FromBody] UpdateRoleDto updateRoleDto)
        {
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
        [Route("update-profile")]
        [Authorize]
        public async Task<IActionResult> UpdateProfile([FromBody] UpdateProfileDto dto)
        {
            var result = await _authService.UpdateProfileAsync(User, dto);
            if (result.IsSucceed)
                return Ok(result.Message);
            return StatusCode(result.StatusCode, result.Message);
        }

        [HttpPut]
        [Route("update-password")]
        [Authorize]
        public async Task<IActionResult> UpdatePassword([FromBody] UpdatePasswordDto dto)
        {
            var result = await _authService.UpdatePasswordAsync(User, dto);
            if (result.IsSucceed)
                return Ok(result.Message);
            return StatusCode(result.StatusCode, result.Message);
        }

        // Route -> List of all users with details
        [HttpGet]
        [Route("users")]
        [Authorize(Roles = StaticUserRoles.ADMIN)]
        public async Task<ActionResult<IEnumerable<UserInfoResult>>> GetUsersList()
        {
            var usersList = await _authService.GetUsersListAsync();
            return Ok(usersList);
        }

        // Route -> Get a User by UserName
        [HttpGet]
        [Route("users/{userName}")]
        [Authorize(Roles = StaticUserRoles.ADMIN)]
        public async Task<ActionResult<UserInfoResult>> GetUserDetailsByUserName([FromRoute] string userName)
        {
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

        // Route -> Delete user by id
        [HttpDelete("users/{id}")]
        [Authorize(Roles = StaticUserRoles.ADMIN)]
        public async Task<IActionResult> DeleteUser(string id)
        {
            var result = await _authService.DeleteUserByIdAsync(User, id);
            if (result.IsSucceed)
                return Ok(result.Message);
            return StatusCode(result.StatusCode, result.Message);
        }

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
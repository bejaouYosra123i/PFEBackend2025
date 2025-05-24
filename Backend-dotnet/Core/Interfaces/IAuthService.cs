﻿using Backend_dotnet.Core.Dtos.Auth;
using Backend_dotnet.Core.Dtos.General;
using System.Security.Claims;

namespace Backend_dotnet.Core.Interfaces
{
    public interface IAuthService
    {
        Task<GeneralServiceResponseDto> SeedRolesAsync();
        Task<GeneralServiceResponseDto> RegisterAsync(ClaimsPrincipal User , RegisterDto registerDto);
        Task<LoginServiceResponseDto?> LoginAsync(LoginDto loginDto);
        Task<GeneralServiceResponseDto> UpdateRoleAsync(ClaimsPrincipal User, UpdateRoleDto updateRoleDto);
        Task<LoginServiceResponseDto?> MeAsync(MeDto meDto);
        Task<IEnumerable<UserInfoResult>> GetUsersListAsync();
        Task<UserInfoResult?> GetUserDetailsByUserNameAsync(string userName);
        Task<IEnumerable<string>> GetUsernamesListAsync();

        Task<GeneralServiceResponseDto> UpdateCredentialsAsync(ClaimsPrincipal User, UpdateCredentialsDto updateCredentialsDto);

        Task<GeneralServiceResponseDto> DeleteUserByIdAsync(System.Security.Claims.ClaimsPrincipal adminUser, string userId);

        Task<GeneralServiceResponseDto> ResetPasswordAsync(string userName, string? newPassword = null);




    }
}

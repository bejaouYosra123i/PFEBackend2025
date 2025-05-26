using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Backend_dotnet.Core.Services;
using Backend_dotnet.Core.Dtos.Privilege;
using System.Threading.Tasks;
using System.Collections.Generic;
using Backend_dotnet.Core.Entities;

namespace Backend_dotnet.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    [Authorize]
    public class PrivilegeController : ControllerBase
    {
        private readonly PrivilegeService _privilegeService;

        public PrivilegeController(PrivilegeService privilegeService)
        {
            _privilegeService = privilegeService;
        }

        [HttpGet]
        [Authorize(Roles = "ADMIN")]
        public async Task<ActionResult<IEnumerable<Privilege>>> GetAllPrivileges()
        {
            var privileges = await _privilegeService.GetAllPrivilegesAsync();
            return Ok(privileges);
        }

        [HttpGet("user/{userId}")]
        [Authorize(Roles = "ADMIN")]
        public async Task<ActionResult<IEnumerable<UserPrivilege>>> GetUserPrivileges(string userId)
        {
            var privileges = await _privilegeService.GetUserPrivilegesAsync(userId);
            return Ok(privileges);
        }

        [HttpPost("assign")]
        [Authorize(Roles = "ADMIN")]
        public async Task<IActionResult> AssignPrivilege([FromBody] AssignPrivilegeDto dto)
        {
            var result = await _privilegeService.AssignPrivilegeToUserAsync(
                dto.UserId,
                dto.PrivilegeId,
                dto.StartDate,
                dto.EndDate
            );

            if (result)
                return Ok(new { message = "Privilege assigned successfully" });
            return BadRequest(new { message = "Failed to assign privilege" });
        }

        [HttpPost("remove")]
        [Authorize(Roles = "ADMIN")]
        public async Task<IActionResult> RemovePrivilege([FromBody] AssignPrivilegeDto dto)
        {
            var result = await _privilegeService.RemovePrivilegeFromUserAsync(
                dto.UserId,
                dto.PrivilegeId
            );

            if (result)
                return Ok(new { message = "Privilege removed successfully" });
            return BadRequest(new { message = "Failed to remove privilege" });
        }
    }
} 
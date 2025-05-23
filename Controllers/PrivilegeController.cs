using System;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Authorization;
using Backend_dotnet.Core.Services;
using Backend_dotnet.Core.DbContext;
using Backend_dotnet.Core.Dtos.Privilege;
using Microsoft.EntityFrameworkCore;
using System.Security.Claims;

namespace Backend_dotnet.Controllers
{
    [ApiController]
    [Route("api/[controller]")]
    [Authorize]
    public class PrivilegeController : ControllerBase
    {
        private readonly PrivilegeService _privilegeService;
        private readonly ApplicationDbContext _dbContext;
        public PrivilegeController(PrivilegeService privilegeService, ApplicationDbContext dbContext)
        {
            _privilegeService = privilegeService;
            _dbContext = dbContext;
        }

        [HttpGet("all")]
        [Authorize(Roles = "ADMIN")]
        public async Task<IActionResult> GetAllPrivileges()
        {
            var privileges = await _dbContext.Privileges
                .Select(p => new PrivilegeDto { Id = p.Id, Name = p.Name, Description = p.Description })
                .ToListAsync();
            return Ok(privileges);
        }

        [HttpGet("user/{userId}")]
        public async Task<IActionResult> GetUserPrivileges(string userId)
        {
            var currentUserId = User.FindFirst(ClaimTypes.NameIdentifier)?.Value;
            var isAdmin = User.IsInRole("ADMIN");
            var hasManagePrivileges = await _privilegeService.UserHasPrivilegeAsync(currentUserId, "ManagePrivileges");

            if (!isAdmin && currentUserId != userId && !hasManagePrivileges)
                return Forbid();

            var userPrivileges = await _dbContext.UserPrivileges
                .Include(up => up.Privilege)
                .Where(up => up.UserId == userId)
                .Select(up => new UserPrivilegeDto
                {
                    Id = up.Id,
                    PrivilegeId = up.PrivilegeId,
                    PrivilegeName = up.Privilege.Name,
                    UserId = up.UserId,
                    StartDate = up.StartDate,
                    EndDate = up.EndDate
                })
                .ToListAsync();
            return Ok(userPrivileges);
        }

        [HttpPost("assign")]
        [Authorize(Roles = "ADMIN")]
        public async Task<IActionResult> AssignPrivilege([FromBody] AssignPrivilegeDto dto)
        {
            var ok = await _privilegeService.AssignPrivilegeToUserAsync(dto.UserId, dto.PrivilegeId, dto.StartDate, dto.EndDate);
            if (!ok) return BadRequest("Erreur lors de l'attribution du privilège.");
            return Ok();
        }

        [HttpPost("remove")]
        [Authorize(Roles = "ADMIN")]
        public async Task<IActionResult> RemovePrivilege([FromBody] AssignPrivilegeDto dto)
        {
            var ok = await _privilegeService.RemovePrivilegeFromUserAsync(dto.UserId, dto.PrivilegeId);
            if (!ok) return NotFound("Privilège non trouvé pour cet utilisateur.");
            return Ok();
        }
    }
} 
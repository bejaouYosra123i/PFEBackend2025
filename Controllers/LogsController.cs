using Microsoft.AspNetCore.Mvc;
using Backend_dotnet.Core.Entities;
using Backend_dotnet.Core.Dtos.Log;
using Backend_dotnet.Core.DbContext;

namespace Backend_dotnet.Controllers
{
    [ApiController]
    [Route("api/[controller]")]
    public class LogsController : ControllerBase
    {
        private readonly ApplicationDbContext _context;
        public LogsController(ApplicationDbContext context)
        {
            _context = context;
        }

        [HttpPost]
        public async Task<IActionResult> CreateLog([FromBody] CreateLogDto dto)
        {
            if (string.IsNullOrWhiteSpace(dto.Description) || string.IsNullOrWhiteSpace(dto.UserName))
                return BadRequest("Description and UserName are required.");

            var log = new Log
            {
                Description = dto.Description,
                UserName = dto.UserName
            };
            _context.Logs.Add(log);
            await _context.SaveChangesAsync();
            return Ok();
        }
    }
} 
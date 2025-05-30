using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using System.Security.Claims;

namespace backend-.net.Controllers
{
    [ApiController]
    [Route("api/[controller]")]
    public class PcRequestController : ControllerBase
    {
        private readonly IPcRequestService _service;

        public PcRequestController(IPcRequestService service)
        {
            _service = service;
        }

        [HttpGet("requests")]
        [Authorize]
        public async Task<ActionResult<List<PcRequestReadDto>>> GetAllRequests()
        {
            var currentUser = User.FindFirst(ClaimTypes.Name)?.Value;
            if (string.IsNullOrEmpty(currentUser))
            {
                return Unauthorized();
            }
            var result = await _service.GetAllRequestsAsync(currentUser);
            return Ok(result);
        }
    }
} 
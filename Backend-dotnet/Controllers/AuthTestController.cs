using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;

namespace Backend_dotnet.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class AuthTestController : ControllerBase
    {
        [Authorize(Roles = "MANAGER")]
        [HttpGet("test-manager")]
        public IActionResult TestManager()
        {
            return Ok("Tu es bien authentifié en tant que MANAGER !");
        }
    }
} 
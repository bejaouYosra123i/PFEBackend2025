using Microsoft.AspNetCore.Mvc;

namespace Backend_dotnet.Controllers
{
    [ApiController]
    [Route("api/[controller]")]
    public class NotificationsController : ControllerBase
    {
        [HttpGet]
        public IActionResult GetNotifications()
        {
            return Ok(new[] {
                new { id = "test", message = "Hello from notifications!" }
            });
        }
    }
} 
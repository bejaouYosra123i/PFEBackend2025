using Backend_dotnet.Core.Constants;
using Backend_dotnet.Core.Dtos.Message;
using Backend_dotnet.Core.Interfaces;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;

namespace Backend_dotnet.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class MessagesController : ControllerBase
    {
        private readonly IMessageService _messageService;

        public MessagesController(IMessageService messageService)
        {
            _messageService = messageService;
        }

        [HttpPost]
        [Route("create")]
        [Authorize]
        public async Task<IActionResult> CreateNewMessage([FromBody] CreateMessageDto createMessageDto)
        {
            var result = await _messageService.CreateNewMessageAsync(User, createMessageDto);
            if (result.IsSucceed)
                return Ok(result.Message);

            return StatusCode(result.StatusCode, result.Message);
        }

        // Route -> Get All Messages for current user, Either as Sender or as Receiver
        [HttpGet]
        [Route("mine")]
        [Authorize]
        public async Task<ActionResult<IEnumerable<GetMessageDto>>> GetMyMessages()
        {
            var messages = await _messageService.GetMyMessagesAsync(User);
            return Ok(messages);
        }

        // Route -> Get all messages With Admin access and Manager access
        [HttpGet]
        [Authorize(Roles = StaticUserRoles.ManagerAdmin)]
        public async Task<ActionResult<IEnumerable<GetMessageDto>>> GetMessages()
        {
            var messages = await _messageService.GetMessagesAsync();
            return Ok(messages);
        }
    }
}

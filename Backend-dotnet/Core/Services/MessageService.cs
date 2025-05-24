using Backend_dotnet.Core.DbContext;
using Backend_dotnet.Core.Dtos.General;
using Backend_dotnet.Core.Dtos.Message;
using Backend_dotnet.Core.Entities;
using Backend_dotnet.Core.Interfaces;
using Microsoft.AspNetCore.Identity;
using Microsoft.EntityFrameworkCore;
using System.Security.Claims;

namespace Backend_dotnet.Core.Services
{
    public class MessageService : IMessageService
    {
        
        private readonly ApplicationDbContext _context;
        private readonly ILogService _logService;
        private readonly UserManager<ApplicationUser> _userManager;

        public MessageService(ApplicationDbContext context, ILogService logService, UserManager<ApplicationUser> userManager)
        {
            _context = context;
            _logService = logService;
            _userManager = userManager;
        }
        
        public async Task<GeneralServiceResponseDto> CreateNewMessageAsync(ClaimsPrincipal User, CreateMessageDto createMessageDto)
        {
            var senderUserName = User?.Identity?.Name ?? "Anonymous";
            if (senderUserName == createMessageDto.ReceiverUserName)
                return new GeneralServiceResponseDto()
                {
                    IsSucceed = false,
                    StatusCode = 400,
                    Message = "Sender and Receiver can not be same",
                };

            var isReceiverUserNameValid = _userManager.Users.Any(q => q.UserName == createMessageDto.ReceiverUserName);
            if (!isReceiverUserNameValid)
                return new GeneralServiceResponseDto()
                {
                    IsSucceed = false,
                    StatusCode = 400,
                    Message = "Receiver UserName is not valid",
                };

            Message newMessage = new Message()
            {
                SenderUserName = senderUserName,
                ReceiverUserName = createMessageDto.ReceiverUserName,
                Text = createMessageDto.Text,
                Type = createMessageDto.Type ?? "GENERAL",
                Status = createMessageDto.Status ?? "NEW"
            };
            await _context.Messages.AddAsync(newMessage);
            await _context.SaveChangesAsync();
            await _logService.SaveNewLog(senderUserName, "Send Message");

            return new GeneralServiceResponseDto()
            {
                IsSucceed = true,
                StatusCode = 201,
                Message = "Message saved successfully",
            };
        }
       
        public async Task<IEnumerable<GetMessageDto>> GetMessagesAsync()
        {
            var messages = await _context.Messages
                .Select(q => new GetMessageDto()
                {
                    Id = q.Id,
                    SenderUserName = q.SenderUserName,
                    ReceiverUserName = q.ReceiverUserName,
                    Text = q.Text,
                    Type = q.Type,
                    Status = q.Status,
                    CreatedAt = q.CreatedAt
                })
                .OrderByDescending(q => q.CreatedAt)
                .ToListAsync();

            return messages;
        }
     

        public async Task<IEnumerable<GetMessageDto>> GetMyMessagesAsync(ClaimsPrincipal User)
        {
            var loggedInUser = User.Identity.Name;

            var messages = await _context.Messages
                .Where(q => q.SenderUserName == loggedInUser || q.ReceiverUserName == loggedInUser)
             .Select(q => new GetMessageDto()
             {
                 Id = q.Id,
                 SenderUserName = q.SenderUserName,
                 ReceiverUserName = q.ReceiverUserName,
                 Text = q.Text,
                 Type = q.Type,
                 Status = q.Status,
                 CreatedAt = q.CreatedAt
             })
             .OrderByDescending(q => q.CreatedAt)
             .ToListAsync();

            return messages;
        }
        
        public async Task<bool> MarkMessageAsDone(long messageId)
        {
            var msg = await _context.Messages.FindAsync(messageId);
            if (msg == null) return false;
            msg.Status = "DONE";
            await _context.SaveChangesAsync();
            return true;
        }
    }
}
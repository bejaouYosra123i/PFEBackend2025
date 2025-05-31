using Backend_dotnet.Core.Dtos.General;
using Backend_dotnet.Core.Dtos.Message;
using System.Security.Claims;

namespace Backend_dotnet.Core.Interfaces
{
    public interface IMessageService
    {
        Task<GeneralServiceResponseDto> CreateNewMessageAsync(ClaimsPrincipal User, CreateMessageDto createMessageDto);
        Task<IEnumerable<GetMessageDto>> GetMessagesAsync();
        Task<IEnumerable<GetMessageDto>> GetMyMessagesAsync(ClaimsPrincipal User);
        Task<bool> MarkMessageAsDone(long messageId);
    }
}

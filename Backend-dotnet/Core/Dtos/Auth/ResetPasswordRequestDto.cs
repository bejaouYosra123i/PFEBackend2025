namespace Backend_dotnet.Core.Dtos.Auth
{
    public class ResetPasswordRequestDto
    {
        public string NewPassword { get; set; }
        public string Token { get; set; }
        public string UserId { get; set; }
    }
} 
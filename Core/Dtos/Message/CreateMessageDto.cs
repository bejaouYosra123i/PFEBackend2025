namespace Backend_dotnet.Core.Dtos.Message
{
    public class CreateMessageDto
    {


        public string  ReceiverUserName { get; set; }
        public string  Text { get; set; }
        public string Type { get; set; } // ex: RESET_PASSWORD_REQUEST, GENERAL
        public string Status { get; set; } // ex: NEW, DONE

    }
}

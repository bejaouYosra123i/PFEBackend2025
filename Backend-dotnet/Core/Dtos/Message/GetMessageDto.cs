﻿namespace Backend_dotnet.Core.Dtos.Message
{
    public class GetMessageDto
    {
        public long  Id { get; set; }
        public string SenderUserName { get; set; }
        public string  ReceiverUserName { get; set; }
        public string Text { get; set; }
        public string Type { get; set; } // ex: RESET_PASSWORD_REQUEST, GENERAL
        public string Status { get; set; } // ex: NEW, DONE
        public DateTime CreatedAt { get; set; } = DateTime.Now;
    }
}

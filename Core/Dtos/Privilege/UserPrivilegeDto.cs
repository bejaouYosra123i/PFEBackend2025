using System;

namespace Backend_dotnet.Core.Dtos.Privilege
{
    public class UserPrivilegeDto
    {
        public int Id { get; set; }
        public int PrivilegeId { get; set; }
        public string PrivilegeName { get; set; }
        public string UserId { get; set; }
        public DateTime? StartDate { get; set; }
        public DateTime? EndDate { get; set; }
    }
} 
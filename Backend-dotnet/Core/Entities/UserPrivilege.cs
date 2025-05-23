using System;

namespace Backend_dotnet.Core.Entities
{
    public class UserPrivilege
    {
        public int Id { get; set; }
        public string UserId { get; set; }
        public int PrivilegeId { get; set; }
        public DateTime? StartDate { get; set; }
        public DateTime? EndDate { get; set; }
        public virtual ApplicationUser User { get; set; }
        public virtual Privilege Privilege { get; set; }
    }
} 
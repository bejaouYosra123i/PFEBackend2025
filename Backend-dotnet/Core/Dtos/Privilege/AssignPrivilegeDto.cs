namespace Backend_dotnet.Core.Dtos.Privilege
{
    public class AssignPrivilegeDto
    {
        public string UserId { get; set; }
        public int PrivilegeId { get; set; }
        public DateTime? StartDate { get; set; }
        public DateTime? EndDate { get; set; }
    }
} 
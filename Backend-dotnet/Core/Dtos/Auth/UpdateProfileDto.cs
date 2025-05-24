using System.ComponentModel.DataAnnotations;

namespace Backend_dotnet.Core.Dtos.Auth
{
    public class UpdateProfileDto
    {
        [Required]
        public string FirstName { get; set; }
        [Required]
        public string LastName { get; set; }
        [EmailAddress]
        public string Email { get; set; }
        public string Address { get; set; }
    }
} 
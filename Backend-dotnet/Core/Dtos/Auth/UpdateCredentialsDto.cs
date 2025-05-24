using System.ComponentModel.DataAnnotations;

namespace Backend_dotnet.Core.Dtos.Auth
{
    public class UpdateCredentialsDto
    {
        // [Required(ErrorMessage = "Current password is required for verification")]
        public string? CurrentPassword { get; set; }

        public string FirstName { get; set; }
        public string LastName { get; set; }

        [EmailAddress(ErrorMessage = "Invalid email address")]
        public string Email { get; set; }

        public string NewPassword { get; set; }

        public string Address { get; set; }
    }
}

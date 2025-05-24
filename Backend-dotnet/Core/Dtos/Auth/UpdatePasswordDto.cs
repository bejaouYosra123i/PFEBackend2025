using System.ComponentModel.DataAnnotations;

namespace Backend_dotnet.Core.Dtos.Auth
{
    public class UpdatePasswordDto
    {
        [Required]
        public string CurrentPassword { get; set; }
        [Required]
        [MinLength(8)]
        public string NewPassword { get; set; }
    }
} 
using Microsoft.AspNetCore.Identity;
using System.ComponentModel.DataAnnotations.Schema;
using System.Collections.Generic;

namespace Backend_dotnet.Core.Entities
{
    public class ApplicationUser : IdentityUser 
    {

        public string FirstName { get; set; }

        public string LastName { get; set; }

        public string Address { get; set; }

        public string? Avatar { get; set; }

        public DateTime CreatedAt { get; set; } = DateTime.Now;


        [NotMapped]
        public IList<string> Roles { get; set; }

        public virtual ICollection<UserPrivilege> UserPrivileges { get; set; }

    }
}

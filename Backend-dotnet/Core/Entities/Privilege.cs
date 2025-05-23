using System.Collections.Generic;

namespace Backend_dotnet.Core.Entities
{
    public class Privilege
    {
        public int Id { get; set; }
        public string Name { get; set; }
        public string Description { get; set; }
        public ICollection<UserPrivilege> UserPrivileges { get; set; }
    }
} 
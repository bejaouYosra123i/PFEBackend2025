using System.Collections.Generic;

namespace Backend_dotnet.Core.Dtos.General
{
    public class AssetScrubDeleteRequest
    {
        public List<int> Ids { get; set; }
        public string Password { get; set; }
    }
} 
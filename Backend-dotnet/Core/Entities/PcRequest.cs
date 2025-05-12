using System;
using System.Collections.Generic;

namespace Backend_dotnet.Core.Entities
{
    public class PcRequest : BaseEntity<int>
    {
        public string FullName { get; set; }
        public string Department { get; set; }
        public string Function { get; set; }
        public string PcType { get; set; }
        public string Reason { get; set; }
        public string RequestedBy { get; set; }
        public string SignaturesJson { get; set; } // Stocker les signatures en JSON
        public string Status { get; set; } = "En attente";
    }
} 
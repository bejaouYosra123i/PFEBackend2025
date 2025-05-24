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
        public string SignaturesJson { get; set; } // Store signatures in JSON
        public string Status { get; set; } = "Pending";
        public string ApprovalsJson { get; set; } = "{}"; // Stocke les approbations des managers
        public int RequiredApprovals { get; set; } = 4; // Nombre d'approbations requises
        public int CurrentApprovals { get; set; } = 0; // Nombre d'approbations actuelles
    }
} 
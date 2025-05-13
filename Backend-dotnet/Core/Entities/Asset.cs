using System;

namespace Backend_dotnet.Core.Entities
{
    public class Asset : BaseEntity<int>
    {
        public string SerialNumber { get; set; }
        public string Description { get; set; }
        public string Category { get; set; }
        public string Status { get; set; }
        public string AssignedTo { get; set; }
        public string Location { get; set; }
        public DateTime AcquisitionDate { get; set; }
        public DateTime LastUpdate { get; set; }
        public int? PcRequestId { get; set; } // Référence à la demande PC associée
    }
} 
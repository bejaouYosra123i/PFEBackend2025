using System;

namespace Backend_dotnet.Core.Entities
{
    public class AssetScrub : BaseEntity<int>
    {
        public string CompanyCode { get; set; }
        public string PlantCode { get; set; }
        public string AssetNumber { get; set; }
        public string SubNumber { get; set; }
        public string SerialNumber { get; set; }
        public int Quantity { get; set; }
        public string TotalPartialRetirement { get; set; }
        public string CostCenter { get; set; }
        public string Description { get; set; }
        public string Location { get; set; }
        public DateTime? AcquisitionDate { get; set; }
        public decimal? AcquisitionAmountEuro { get; set; }
        public decimal? AcquisitionAmountLocal { get; set; }
        public decimal? NetBookValueEuro { get; set; }
        public decimal? NetBookValueLocal { get; set; }
        public string AssetOwner { get; set; }
        public DateTime? DataInputDate { get; set; }
    }
} 
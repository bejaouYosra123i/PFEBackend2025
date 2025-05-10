using System;
using System.Collections.Generic;

namespace Backend_dotnet.Core.Entities
{
    public class InvestmentForm : BaseEntity<int>
    {
        public string Region { get; set; }
        public string Currency { get; set; }
        public string Location { get; set; }
        public string TypeOfInvestment { get; set; }
        public string Justification { get; set; }
        public DateTime ReqDate { get; set; }
        public DateTime? DueDate { get; set; }
        public string Observations { get; set; }
        public decimal Total { get; set; }
        public string Status { get; set; }
        public ICollection<InvestmentItem> Items { get; set; }
    }
} 
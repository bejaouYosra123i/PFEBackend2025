using System;
using System.Collections.Generic;

namespace Backend_dotnet.Core.Dtos.General
{
    public class InvestmentFormDto
    {
        public int Id { get; set; }
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
        public List<InvestmentItemDto> Items { get; set; }
        public string? NumRitm { get; set; }
        public string? NumCoupa { get; set; }
        public string? NumIyras { get; set; }
        public string? IoNumber { get; set; }
    }
} 
namespace Backend_dotnet.Core.Dtos.General
{
    public class InvestmentItemDto
    {
        public int Id { get; set; }
        public string Description { get; set; }
        public string Supplier { get; set; }
        public decimal UnitCost { get; set; }
        public decimal Shipping { get; set; }
        public decimal SubTotal { get; set; }
        public int Quantity { get; set; }
        public decimal Total { get; set; }
        public string? NumRitm { get; set; }
        public string? NumCoupa { get; set; }
        public string? NumIyras { get; set; }
        public string? IoNumber { get; set; }
        public string? CoupaNumber { get; set; }
        public string? RytmNumber { get; set; }
        public string? IyrasNumber { get; set; }
        public string? Status { get; set; }
    }
} 
namespace Backend_dotnet.Core.Dtos.General
{
    public class InvestmentItemDto
    {
        public string Description { get; set; }
        public string Supplier { get; set; }
        public decimal UnitCost { get; set; }
        public decimal Shipping { get; set; }
        public decimal SubTotal { get; set; }
        public int Quantity { get; set; }
        public decimal Total { get; set; }
    }
} 
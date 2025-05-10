using System.ComponentModel.DataAnnotations.Schema;

namespace Backend_dotnet.Core.Entities
{
    public class InvestmentItem : BaseEntity<int>
    {
        public string Description { get; set; }
        public string Supplier { get; set; }
        public decimal UnitCost { get; set; }
        public decimal Shipping { get; set; }
        public decimal SubTotal { get; set; }
        public int Quantity { get; set; }
        public decimal Total { get; set; }

        public int InvestmentFormId { get; set; }
        [ForeignKey("InvestmentFormId")]
        public InvestmentForm InvestmentForm { get; set; }
    }
} 
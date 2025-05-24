using System.Collections.Generic;
using System.Threading.Tasks;
using Backend_dotnet.Core.Dtos.General;

namespace Backend_dotnet.Core.Interfaces
{
    public interface IInvestmentFormService
    {
        Task<List<InvestmentFormDto>> GetAllAsync();
        Task<InvestmentFormDto> GetByIdAsync(int id);
        Task<InvestmentFormDto> CreateAsync(InvestmentFormDto dto);
        Task<InvestmentFormDto> UpdateAsync(int id, InvestmentFormDto dto);
        Task<bool> DeleteAsync(int id);
    }
} 
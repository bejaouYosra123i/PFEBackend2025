using System.Collections.Generic;
using System.Threading.Tasks;
using Backend_dotnet.Core.Dtos.General;

namespace Backend_dotnet.Core.Interfaces
{
    public interface IAssetScrubService
    {
        Task<List<AssetScrubDto>> GetAllAsync();
        Task<AssetScrubDto> GetByIdAsync(int id);
        Task<AssetScrubDto> CreateAsync(AssetScrubDto dto);
        Task<bool> DeleteAsync(int id);
    }
} 
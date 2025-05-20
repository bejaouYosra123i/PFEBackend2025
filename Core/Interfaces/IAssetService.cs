using System.Collections.Generic;
using System.Threading.Tasks;
using Backend_dotnet.Core.Dtos;

namespace Backend_dotnet.Core.Interfaces
{
    public interface IAssetService
    {
        Task<List<AssetDto>> GetAllAsync();
        Task<AssetDto> GetByIdAsync(int id);
        Task<AssetDto> CreateAsync(AssetDto dto);
        Task<AssetDto> UpdateStatusAsync(int id, string status);
    }
} 
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Backend_dotnet.Core.DbContext;
using Backend_dotnet.Core.Dtos.General;
using Backend_dotnet.Core.Entities;
using Backend_dotnet.Core.Interfaces;
using Microsoft.EntityFrameworkCore;

namespace Backend_dotnet.Core.Services
{
    public class AssetScrubService : IAssetScrubService
    {
        private readonly ApplicationDbContext _context;
        public AssetScrubService(ApplicationDbContext context)
        {
            _context = context;
        }

        public async Task<List<AssetScrubDto>> GetAllAsync()
        {
            var assets = await _context.AssetScrubs.ToListAsync();
            return assets.Select(a => ToDto(a)).ToList();
        }

        public async Task<AssetScrubDto> GetByIdAsync(int id)
        {
            var asset = await _context.AssetScrubs.FindAsync(id);
            return asset == null ? null : ToDto(asset);
        }

        public async Task<AssetScrubDto> CreateAsync(AssetScrubDto dto)
        {
            var asset = new AssetScrub
            {
                CompanyCode = dto.CompanyCode,
                PlantCode = dto.PlantCode,
                AssetNumber = dto.AssetNumber,
                SubNumber = dto.SubNumber,
                SerialNumber = dto.SerialNumber,
                Quantity = dto.Quantity,
                TotalPartialRetirement = dto.TotalPartialRetirement,
                CostCenter = dto.CostCenter,
                Description = dto.Description,
                Location = dto.Location,
                AcquisitionDate = dto.AcquisitionDate,
                AcquisitionAmountEuro = dto.AcquisitionAmountEuro,
                AcquisitionAmountLocal = dto.AcquisitionAmountLocal,
                NetBookValueEuro = dto.NetBookValueEuro,
                NetBookValueLocal = dto.NetBookValueLocal,
                AssetOwner = dto.AssetOwner,
                DataInputDate = dto.DataInputDate
            };
            _context.AssetScrubs.Add(asset);
            await _context.SaveChangesAsync();
            return ToDto(asset);
        }

        public async Task<bool> DeleteAsync(int id)
        {
            var asset = await _context.AssetScrubs.FindAsync(id);
            if (asset == null) return false;
            _context.AssetScrubs.Remove(asset);
            await _context.SaveChangesAsync();
            return true;
        }

        private AssetScrubDto ToDto(AssetScrub asset)
        {
            return new AssetScrubDto
            {
                Id = asset.Id,
                CompanyCode = asset.CompanyCode,
                PlantCode = asset.PlantCode,
                AssetNumber = asset.AssetNumber,
                SubNumber = asset.SubNumber,
                SerialNumber = asset.SerialNumber,
                Quantity = asset.Quantity,
                TotalPartialRetirement = asset.TotalPartialRetirement,
                CostCenter = asset.CostCenter,
                Description = asset.Description,
                Location = asset.Location,
                AcquisitionDate = asset.AcquisitionDate,
                AcquisitionAmountEuro = asset.AcquisitionAmountEuro,
                AcquisitionAmountLocal = asset.AcquisitionAmountLocal,
                NetBookValueEuro = asset.NetBookValueEuro,
                NetBookValueLocal = asset.NetBookValueLocal,
                AssetOwner = asset.AssetOwner,
                DataInputDate = asset.DataInputDate
            };
        }
    }
} 
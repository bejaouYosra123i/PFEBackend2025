using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Backend_dotnet.Core.DbContext;
using Backend_dotnet.Core.Dtos;
using Backend_dotnet.Core.Entities;
using Backend_dotnet.Core.Interfaces;
using Microsoft.EntityFrameworkCore;

namespace Backend_dotnet.Core.Services
{
    public class AssetService : IAssetService
    {
        private readonly ApplicationDbContext _context;

        public AssetService(ApplicationDbContext context)
        {
            _context = context;
        }

        public async Task<List<AssetDto>> GetAllAsync()
        {
            var assets = await _context.Assets
                .Where(a => !a.IsDeleted)
                .ToListAsync();

            return assets.Select(a => new AssetDto
            {
                Id = a.Id,
                SerialNumber = a.SerialNumber,
                Description = a.Description,
                Category = a.Category,
                Status = a.Status,
                AssignedTo = a.AssignedTo,
                Location = a.Location,
                AcquisitionDate = a.AcquisitionDate,
                LastUpdate = a.LastUpdate,
                PcRequestId = a.PcRequestId
            }).ToList();
        }

        public async Task<AssetDto> GetByIdAsync(int id)
        {
            var asset = await _context.Assets
                .FirstOrDefaultAsync(a => a.Id == id && !a.IsDeleted);

            if (asset == null) return null;

            return new AssetDto
            {
                Id = asset.Id,
                SerialNumber = asset.SerialNumber,
                Description = asset.Description,
                Category = asset.Category,
                Status = asset.Status,
                AssignedTo = asset.AssignedTo,
                Location = asset.Location,
                AcquisitionDate = asset.AcquisitionDate,
                LastUpdate = asset.LastUpdate,
                PcRequestId = asset.PcRequestId
            };
        }

        public async Task<AssetDto> CreateAsync(AssetDto dto)
        {
            // Génération automatique du SerialNumber
            int nextId = 1;
            if (await _context.Assets.AnyAsync())
            {
                nextId = await _context.Assets.MaxAsync(a => a.Id) + 1;
            }
            string serialNumber = $"ASSET-{nextId.ToString().PadLeft(5, '0')}";

            var asset = new Asset
            {
                SerialNumber = serialNumber,
                Description = dto.Description,
                Category = dto.Category,
                Status = dto.Status,
                AssignedTo = dto.AssignedTo,
                Location = dto.Location,
                AcquisitionDate = dto.AcquisitionDate,
                LastUpdate = DateTime.UtcNow,
                PcRequestId = dto.PcRequestId
            };

            _context.Assets.Add(asset);
            await _context.SaveChangesAsync();

            dto.Id = asset.Id;
            dto.SerialNumber = asset.SerialNumber;
            return dto;
        }

        public async Task<AssetDto> UpdateStatusAsync(int id, string status)
        {
            var asset = await _context.Assets
                .FirstOrDefaultAsync(a => a.Id == id && !a.IsDeleted);

            if (asset == null) return null;

            asset.Status = status;
            asset.LastUpdate = DateTime.UtcNow;

            await _context.SaveChangesAsync();

            return new AssetDto
            {
                Id = asset.Id,
                SerialNumber = asset.SerialNumber,
                Description = asset.Description,
                Category = asset.Category,
                Status = asset.Status,
                AssignedTo = asset.AssignedTo,
                Location = asset.Location,
                AcquisitionDate = asset.AcquisitionDate,
                LastUpdate = asset.LastUpdate,
                PcRequestId = asset.PcRequestId
            };
        }
    }
} 
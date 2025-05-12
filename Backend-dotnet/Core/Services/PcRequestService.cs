using Backend_dotnet.Core.Dtos.General;
using Backend_dotnet.Core.Entities;
using Backend_dotnet.Core.Interfaces;
using Backend_dotnet.Core.DbContext;
using Microsoft.EntityFrameworkCore;
using Newtonsoft.Json;
using System.Threading.Tasks;
using System.Linq;
using System.Collections.Generic;

namespace Backend_dotnet.Core.Services
{
    public class PcRequestService : IPcRequestService
    {
        private readonly ApplicationDbContext _context;
        public PcRequestService(ApplicationDbContext context)
        {
            _context = context;
        }

        public async Task<PcRequest> AddRequestAsync(PcRequestDto dto)
        {
            var entity = new PcRequest
            {
                FullName = dto.FullName,
                Department = dto.Department,
                Function = dto.Function,
                PcType = dto.PcType,
                Reason = dto.Reason,
                RequestedBy = dto.RequestedBy,
                SignaturesJson = JsonConvert.SerializeObject(dto.Signatures)
            };
            _context.PcRequests.Add(entity);
            await _context.SaveChangesAsync();
            return entity;
        }

        public async Task<List<PcRequestReadDto>> GetAllRequestsAsync()
        {
            var entities = await _context.PcRequests.OrderByDescending(x => x.CreatedAt).ToListAsync();
            var result = entities.Select(e => new PcRequestReadDto
            {
                Id = e.Id,
                FullName = e.FullName,
                Department = e.Department,
                Function = e.Function,
                PcType = e.PcType,
                Reason = e.Reason,
                RequestedBy = e.RequestedBy,
                Signatures = string.IsNullOrEmpty(e.SignaturesJson) ? new Dictionary<string, string>() : JsonConvert.DeserializeObject<Dictionary<string, string>>(e.SignaturesJson),
                CreatedAt = e.CreatedAt,
                UpdatedAt = e.UpdatedAt,
                Status = e.Status
            }).ToList();
            return result;
        }

        public async Task<PcRequestReadDto?> UpdateStatusAsync(int id, string status)
        {
            var entity = await _context.PcRequests.FindAsync(id);
            if (entity == null) return null;
            entity.Status = status;
            await _context.SaveChangesAsync();
            return new PcRequestReadDto
            {
                Id = entity.Id,
                FullName = entity.FullName,
                Department = entity.Department,
                Function = entity.Function,
                PcType = entity.PcType,
                Reason = entity.Reason,
                RequestedBy = entity.RequestedBy,
                Signatures = string.IsNullOrEmpty(entity.SignaturesJson) ? new Dictionary<string, string>() : JsonConvert.DeserializeObject<Dictionary<string, string>>(entity.SignaturesJson),
                CreatedAt = entity.CreatedAt,
                UpdatedAt = entity.UpdatedAt,
                Status = entity.Status
            };
        }
    }
} 
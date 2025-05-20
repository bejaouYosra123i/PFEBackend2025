using Backend_dotnet.Core.Dtos.General;
using Backend_dotnet.Core.Entities;
using Backend_dotnet.Core.Interfaces;
using Backend_dotnet.Core.DbContext;
using Microsoft.EntityFrameworkCore;
using Newtonsoft.Json;
using System.Threading.Tasks;
using System.Linq;
using System.Collections.Generic;
using Backend_dotnet.Core.Dtos;

namespace Backend_dotnet.Core.Services
{
    public class PcRequestService : IPcRequestService
    {
        private readonly ApplicationDbContext _context;
        private readonly IAssetService _assetService;
        private readonly ILogService _logService;

        public PcRequestService(ApplicationDbContext context, IAssetService assetService, ILogService logService)
        {
            _context = context;
            _assetService = assetService;
            _logService = logService;
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
                SignaturesJson = JsonConvert.SerializeObject(new Dictionary<string, string>()),
                ApprovalsJson = JsonConvert.SerializeObject(new Dictionary<string, string>()),
                Status = "Pending",
                RequiredApprovals = 4,
                CurrentApprovals = 0
            };
            // Log de debug
            Console.WriteLine($"[DEBUG] Création: Status={entity.Status}, ApprovalsJson={entity.ApprovalsJson}");
            _context.PcRequests.Add(entity);
            await _context.SaveChangesAsync();

            await _logService.SaveNewLog(dto.RequestedBy, $"New PC request created for {dto.FullName} - Type: {dto.PcType}");

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
                Approvals = string.IsNullOrEmpty(e.ApprovalsJson) ? new Dictionary<string, string>() : JsonConvert.DeserializeObject<Dictionary<string, string>>(e.ApprovalsJson),
                CurrentApprovals = e.CurrentApprovals,
                RequiredApprovals = e.RequiredApprovals,
                CreatedAt = e.CreatedAt,
                UpdatedAt = e.UpdatedAt,
                Status = e.Status
            }).ToList();
            return result;
        }

        public async Task<PcRequestReadDto?> UpdateStatusAsync(int id, string status, string managerRole)
        {
            var entity = await _context.PcRequests.FindAsync(id);
            if (entity == null) return null;

            var approvals = string.IsNullOrEmpty(entity.ApprovalsJson) 
                ? new Dictionary<string, string>() 
                : JsonConvert.DeserializeObject<Dictionary<string, string>>(entity.ApprovalsJson);

            // Vérifier si ce rôle a déjà approuvé
            if (approvals.ContainsKey(managerRole))
            {
                return null; // Ce rôle a déjà approuvé
            }

            // Ajouter l'approbation du rôle
            approvals[managerRole] = status;
            entity.ApprovalsJson = JsonConvert.SerializeObject(approvals);

            // Liste des rôles requis pour l'approbation
            var requiredRoles = new[] { "MANAGER", "IT_MANAGER", "RH_MANAGER", "PLANT_MANAGER" };

            // Si au moins un manager a refusé, la demande est rejetée immédiatement
            if (approvals.Values.Any(v => v == "Rejected"))
            {
                entity.Status = "Rejected";
            }
            else if (requiredRoles.All(role => approvals.ContainsKey(role) && approvals[role] == "Approved"))
            {
                // Les 4 rôles différents ont approuvé
                entity.Status = "Approved";
                var assetDto = new AssetDto
                {
                    Description = $"PC {entity.PcType} requested by {entity.FullName}",
                    Category = entity.PcType,
                    Status = "In Service",
                    AssignedTo = entity.FullName,
                    Location = entity.Department,
                    AcquisitionDate = DateTime.UtcNow,
                    LastUpdate = DateTime.UtcNow
                };
                await _assetService.CreateAsync(assetDto);
            }
            else
            {
                // Sinon, la demande reste en attente
                entity.Status = "Pending";
            }

            // Sécurisation supplémentaire : lors de la création ou si le statut est vide, toujours Pending
            if (string.IsNullOrEmpty(entity.Status))
            {
                entity.Status = "Pending";
            }

            await _context.SaveChangesAsync();

            // Log l'approbation
            await _logService.SaveNewLog(
                managerRole,
                $"PC request for {entity.FullName} was {status.ToLower()} by {managerRole}. ({approvals.Count}/{entity.RequiredApprovals} approvals)"
            );

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
                Approvals = approvals,
                CurrentApprovals = approvals.Count,
                RequiredApprovals = entity.RequiredApprovals,
                CreatedAt = entity.CreatedAt,
                UpdatedAt = entity.UpdatedAt,
                Status = entity.Status
            };
        }
    }
} 
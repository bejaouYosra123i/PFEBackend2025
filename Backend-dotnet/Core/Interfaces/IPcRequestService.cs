using Backend_dotnet.Core.Dtos.General;
using Backend_dotnet.Core.Entities;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace Backend_dotnet.Core.Interfaces
{
    public interface IPcRequestService
    {
        Task<PcRequest> AddRequestAsync(PcRequestDto dto);
        Task<List<PcRequestReadDto>> GetAllRequestsAsync();
        Task<PcRequestReadDto?> UpdateStatusAsync(int id, string status);
        // (Optionnel) Ajouter d'autres méthodes comme GetAll, GetById, etc.
    }
} 
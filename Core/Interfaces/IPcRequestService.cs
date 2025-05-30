using Backend_dotnet.Core.Dtos.General;
using Backend_dotnet.Core.Entities;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace Backend_dotnet.Core.Interfaces
{
    public interface IPcRequestService
    {
        Task<PcRequest> AddRequestAsync(PcRequestDto dto);
        Task<List<PcRequestReadDto>> GetAllRequestsAsync(string currentUser);
        Task<PcRequestReadDto?> UpdateStatusAsync(int id, string status, string managerName);
        // (Optionnel) Ajouter d'autres méthodes comme GetAll, GetById, etc.
    }
} 
using Backend_dotnet.Core.Dtos.General;
using Backend_dotnet.Core.Interfaces;
using Microsoft.AspNetCore.Mvc;
using System.Threading.Tasks;
using System.Collections.Generic;
using Microsoft.AspNetCore.Authorization;
using System.Linq;
using System.IO;

namespace Backend_dotnet.Controllers
{
    [ApiController]
    [Route("api/[controller]")]
    public class PcRequestController : ControllerBase
    {
        private readonly IPcRequestService _service;
        public PcRequestController(IPcRequestService service)
        {
            _service = service;
        }

        /// <summary>
        /// Ajouter une nouvelle demande de PC
        /// </summary>
        [HttpPost("requests")]
        public async Task<IActionResult> AddRequest([FromBody] PcRequestDto dto)
        {
            var result = await _service.AddRequestAsync(dto);
            return Ok(result);
        }

        /// <summary>
        /// Récupérer toutes les demandes de PC
        /// </summary>
        /// <returns>Liste des demandes de PC avec signatures lisibles</returns>
        [HttpGet("requests")]
        public async Task<ActionResult<List<PcRequestReadDto>>> GetAllRequests()
        {
            var result = await _service.GetAllRequestsAsync();
            return Ok(result);
        }

        /// <summary>
        /// Mettre à jour le statut d'une demande de PC
        /// </summary>
        [Authorize(Roles = "MANAGER")]
        [HttpPatch("requests/{id}/status")]
        public async Task<IActionResult> UpdateStatus(int id, [FromBody] UpdateStatusDto dto)
        {
            var req = await _service.UpdateStatusAsync(id, dto.Status);
            if (req == null) return NotFound();
            return Ok(req);
        }
    }
} 
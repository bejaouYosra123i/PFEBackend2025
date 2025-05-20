using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Backend_dotnet.Core.Interfaces;
using Backend_dotnet.Core.Dtos;
using System.Collections.Generic;

namespace Backend_dotnet.Controllers
{
    [ApiController]
    [Route("api/[controller]")]
    public class AssetController : ControllerBase
    {
        private readonly IAssetService _service;

        public AssetController(IAssetService service)
        {
            _service = service;
        }

        [HttpGet]
        public async Task<ActionResult<List<AssetDto>>> GetAll()
        {
            return Ok(await _service.GetAllAsync());
        }

        [HttpGet("{id}")]
        public async Task<ActionResult<AssetDto>> GetById(int id)
        {
            var asset = await _service.GetByIdAsync(id);
            if (asset == null) return NotFound();
            return Ok(asset);
        }

        [HttpPost]
        public async Task<ActionResult<AssetDto>> Create(AssetDto dto)
        {
            var created = await _service.CreateAsync(dto);
            return CreatedAtAction(nameof(GetById), new { id = created.Id }, created);
        }

        [HttpPut("{id}/status")]
        public async Task<ActionResult<AssetDto>> UpdateStatus(int id, [FromBody] string status)
        {
            var updated = await _service.UpdateStatusAsync(id, status);
            if (updated == null) return NotFound();
            return Ok(updated);
        }
    }
} 
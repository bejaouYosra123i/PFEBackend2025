using System.Collections.Generic;
using System.Threading.Tasks;
using Backend_dotnet.Core.Dtos.General;
using Backend_dotnet.Core.Interfaces;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Identity;
using Backend_dotnet.Core.Entities;

namespace Backend_dotnet.Controllers
{
    [ApiController]
    [Route("api/AssetScrub")]
    public class AssetScrubController : ControllerBase
    {
        private readonly IAssetScrubService _service;
        private readonly UserManager<ApplicationUser> _userManager;
        private readonly ILogService _logService;
        public AssetScrubController(IAssetScrubService service, UserManager<ApplicationUser> userManager, ILogService logService)
        {
            _service = service;
            _userManager = userManager;
            _logService = logService;
        }

        
        [HttpGet]
        public async Task<ActionResult<List<AssetScrubDto>>> GetAll()
        {
            return Ok(await _service.GetAllAsync());
        }

        [HttpGet("{id}")]
        public async Task<ActionResult<AssetScrubDto>> GetById(int id)
        {
            var asset = await _service.GetByIdAsync(id);
            if (asset == null) return NotFound();
            return Ok(asset);
        }

        [HttpPost]
        public async Task<ActionResult<AssetScrubDto>> Create(AssetScrubDto dto)
        {
            var created = await _service.CreateAsync(dto);
            return CreatedAtAction(nameof(GetById), new { id = created.Id }, created);
        }

        
    }
} 
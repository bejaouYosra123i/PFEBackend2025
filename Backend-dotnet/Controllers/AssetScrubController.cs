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
        public AssetScrubController(IAssetScrubService service, UserManager<ApplicationUser> userManager)
        {
            _service = service;
            _userManager = userManager;
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

        [HttpDelete("{id}")]
        public async Task<ActionResult> Delete(int id)
        {
            var deleted = await _service.DeleteAsync(id);
            if (!deleted) return NotFound();
            return NoContent();
        }

        [HttpPost("delete-with-password")]
        public async Task<IActionResult> DeleteWithPassword([FromBody] AssetScrubDeleteRequest req)
        {
            // Récupère l'utilisateur connecté
            var user = await _userManager.GetUserAsync(User);
            if (user == null)
                return Unauthorized("Utilisateur non authentifié");

            // Vérifie le mot de passe
            var isPasswordValid = await _userManager.CheckPasswordAsync(user, req.Password);
            if (!isPasswordValid)
                return Unauthorized("Mot de passe incorrect");

            foreach (var id in req.Ids)
            {
                var deleted = await _service.DeleteAsync(id);
                if (!deleted)
                    return NotFound($"L'actif avec l'ID {id} n'a pas été trouvé.");
            }
            return NoContent();
        }
    }
} 
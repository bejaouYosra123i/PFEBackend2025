using System.Collections.Generic;
using System.Threading.Tasks;
using Backend_dotnet.Core.Dtos.General;
using Backend_dotnet.Core.Interfaces;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Identity;
using Backend_dotnet.Core.Entities;
using System;

namespace Backend_dotnet.Controllers
{
    [ApiController]
    [Route("api/InvestmentForm")]
    [Authorize(Roles = "ADMIN")]
    public class InvestmentFormController : ControllerBase
    {
        private readonly IInvestmentFormService _service;
        private readonly UserManager<ApplicationUser> _userManager;
        private readonly ILogService _logService;
        public InvestmentFormController(IInvestmentFormService service, UserManager<ApplicationUser> userManager, ILogService logService)
        {
            _service = service;
            _userManager = userManager;
            _logService = logService;
        }

        [HttpGet]
        public async Task<ActionResult<List<InvestmentFormDto>>> GetAll()
        {
            await _logService.SaveNewLog("TEST", "Test log depuis InvestmentFormController");
            return Ok(await _service.GetAllAsync());
        }

        [HttpGet("{id}")]
        public async Task<ActionResult<InvestmentFormDto>> GetById(int id)
        {
            var form = await _service.GetByIdAsync(id);
            if (form == null) return NotFound();
            return Ok(form);
        }

        [Authorize]
        [HttpPost]
        public async Task<ActionResult<InvestmentFormDto>> Create(InvestmentFormDto dto)
        {
            var user = await _userManager.GetUserAsync(User);
            var created = await _service.CreateAsync(dto);
            if (user != null)
                await _logService.SaveNewLog(user.UserName, $"Création d'une nouvelle demande d'investissement ID={created.Id}");
            return CreatedAtAction(nameof(GetById), new { id = created.Id }, created);
        }

        [HttpPut("{id}")]
        public async Task<ActionResult<InvestmentFormDto>> Update(int id, InvestmentFormDto dto)
        {
            var user = await _userManager.GetUserAsync(User);
            var updated = await _service.UpdateAsync(id, dto);
            if (updated == null) return NotFound();
            if (user != null)
                await _logService.SaveNewLog(user.UserName, $"Mise à jour du suivi pour la demande d'investissement ID={id}");
            return Ok(updated);
        }

        [Authorize]
        [HttpDelete("{id}")]
        public async Task<ActionResult> Delete(int id, [FromBody] DeleteInvestmentFormRequest request)
        {
            try
            {
                if (request == null || string.IsNullOrEmpty(request.Password))
                {
                    return BadRequest("Le mot de passe est requis");
                }

                var user = await _userManager.GetUserAsync(User);
                if (user == null)
                {
                    return Unauthorized("Utilisateur non authentifié");
                }

                if (!await _userManager.CheckPasswordAsync(user, request.Password))
                {
                    return Unauthorized("Mot de passe incorrect");
                }

                var deleted = await _service.DeleteAsync(id);
                if (!deleted)
                {
                    return NotFound("La demande d'investissement n'a pas été trouvée");
                }
                await _logService.SaveNewLog(user.UserName, $"Suppression de la demande d'investissement ID={id}");
                return NoContent();
            }
            catch (Exception ex)
            {
                // Log l'erreur ici
                return StatusCode(500, "Une erreur est survenue lors de la suppression");
            }
        }

        [Authorize]
        [HttpPost("{id}/delete-with-password")]
        public async Task<ActionResult> DeleteWithPassword(int id, [FromBody] DeleteInvestmentFormRequest request)
        {
            var user = await _userManager.GetUserAsync(User);
            if (request == null || string.IsNullOrEmpty(request.Password))
                return BadRequest("Le mot de passe est requis");

            if (user == null)
                return Unauthorized("Utilisateur non authentifié");

            if (!await _userManager.CheckPasswordAsync(user, request.Password))
                return Unauthorized("Mot de passe incorrect");

            var deleted = await _service.DeleteAsync(id);
            if (!deleted)
                return NotFound("La demande d'investissement n'a pas été trouvée");
            await _logService.SaveNewLog(user.UserName, $"Suppression de la demande d'investissement ID={id}");
            return NoContent();
        }

        public class DeleteInvestmentFormRequest
        {
            public string Password { get; set; }
        }
    }
}

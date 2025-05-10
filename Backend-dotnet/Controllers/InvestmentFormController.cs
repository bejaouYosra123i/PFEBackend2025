using System.Collections.Generic;
using System.Threading.Tasks;
using Backend_dotnet.Core.Dtos.General;
using Backend_dotnet.Core.Interfaces;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Identity;
using Backend_dotnet.Core.Entities;

namespace Backend_dotnet.Controllers
{
    [ApiController]
    [Route("api/InvestmentForm")]
    public class InvestmentFormController : ControllerBase
    {
        private readonly IInvestmentFormService _service;
        private readonly UserManager<ApplicationUser> _userManager;
        public InvestmentFormController(IInvestmentFormService service, UserManager<ApplicationUser> userManager)
        {
            _service = service;
            _userManager = userManager;
        }

        [HttpGet]
        public async Task<ActionResult<List<InvestmentFormDto>>> GetAll()
        {
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
            var created = await _service.CreateAsync(dto);
            return CreatedAtAction(nameof(GetById), new { id = created.Id }, created);
        }

        [HttpPut("{id}")]
        public async Task<ActionResult<InvestmentFormDto>> Update(int id, InvestmentFormDto dto)
        {
            var updated = await _service.UpdateAsync(id, dto);
            if (updated == null) return NotFound();
            return Ok(updated);
        }

        [Authorize]
        [HttpDelete("{id}")]
        public async Task<ActionResult> Delete(int id, [FromBody] DeleteInvestmentFormRequest request)
        {
            var user = await _userManager.GetUserAsync(User);
            if (user == null || !await _userManager.CheckPasswordAsync(user, request.Password))
                return Unauthorized("Mot de passe incorrect.");
            var deleted = await _service.DeleteAsync(id);
            if (!deleted) return NotFound();
            return NoContent();
        }

        public class DeleteInvestmentFormRequest
        {
            public string Password { get; set; }
        }
    }
} 
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Authorization;
using Backend_dotnet.Core.DbContext;
using Backend_dotnet.Core.Entities;
using System.Threading.Tasks;
using Microsoft.EntityFrameworkCore;
using Backend_dotnet.Core.Interfaces;
using Microsoft.AspNetCore.Identity;

namespace Backend_dotnet.Controllers
{
    [ApiController]
    [Route("api/[controller]")]
    [Authorize(Roles = "ADMIN")]
    public class InvestmentItemController : ControllerBase
    {
        private readonly ApplicationDbContext _context;
        private readonly ILogService _logService;
        private readonly UserManager<ApplicationUser> _userManager;

        public InvestmentItemController(ApplicationDbContext context, ILogService logService, UserManager<ApplicationUser> userManager)
        {
            _context = context;
            _logService = logService;
            _userManager = userManager;
        }

        [HttpDelete("{id}")]
        public async Task<IActionResult> Delete(int id)
        {
            var item = await _context.InvestmentItems.FindAsync(id);
            if (item == null) return NotFound();
            _context.InvestmentItems.Remove(item);
            await _context.SaveChangesAsync();

            // Log l'action
            var user = await _userManager.GetUserAsync(User);
            await _logService.SaveNewLog(user?.UserName ?? "Unknown", $"DELETE InvestmentItem ID={id} (Desc: {item.Description})");

            return NoContent();
        }

        [HttpPut("{id}")]
        public async Task<IActionResult> Update(int id, [FromBody] InvestmentItem dto)
        {
            var item = await _context.InvestmentItems.FindAsync(id);
            if (item == null) return NotFound();

            // Optionnel : garder l'ancienne valeur pour le log
            var oldDesc = item.Description;

            item.Description = dto.Description;
            item.Supplier = dto.Supplier;
            item.UnitCost = dto.UnitCost;
            item.Shipping = dto.Shipping;
            item.SubTotal = dto.SubTotal;
            item.Quantity = dto.Quantity;
            item.Total = dto.Total;
            item.CoupaNumber = dto.CoupaNumber;
            item.RytmNumber = dto.RytmNumber;
            item.IoNumber = dto.IoNumber;
            item.IyrasNumber = dto.IyrasNumber;

            await _context.SaveChangesAsync();

            // Log l'action
            var user = await _userManager.GetUserAsync(User);
            await _logService.SaveNewLog(user?.UserName ?? "Unknown", 
                $"EDIT InvestmentItem ID={id} (Old Desc: {oldDesc}, New Desc: {dto.Description})");

            return Ok(item);
        }

        [HttpPut("{id}/tracking")]
        public async Task<IActionResult> UpdateTracking(int id, [FromBody] TrackingUpdateDto trackingData)
        {
            var item = await _context.InvestmentItems.FindAsync(id);
            if (item == null) return NotFound();

            item.CoupaNumber = trackingData.CoupaNumber;
            item.RytmNumber = trackingData.RytmNumber;
            item.IoNumber = trackingData.IoNumber;
            item.IyrasNumber = trackingData.IyrasNumber;
            item.Status = trackingData.Status;

            await _context.SaveChangesAsync();

            // Log l'action
            var user = await _userManager.GetUserAsync(User);
            await _logService.SaveNewLog(user?.UserName ?? "Unknown", 
                $"UPDATE Tracking InvestmentItem ID={id} (Desc: {item.Description})");

            return Ok(item);
        }
    }

    public class TrackingUpdateDto
    {
        public string CoupaNumber { get; set; }
        public string RytmNumber { get; set; }
        public string IoNumber { get; set; }
        public string IyrasNumber { get; set; }
        public string Status { get; set; }
    }
} 
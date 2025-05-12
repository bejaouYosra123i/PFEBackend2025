using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Backend_dotnet.Core.DbContext;
using Backend_dotnet.Core.Dtos.General;
using Backend_dotnet.Core.Entities;
using Backend_dotnet.Core.Interfaces;
using Microsoft.EntityFrameworkCore;

namespace Backend_dotnet.Core.Services
{
    public class InvestmentFormService : IInvestmentFormService
    {
        private readonly ApplicationDbContext _context;
        public InvestmentFormService(ApplicationDbContext context)
        {
            _context = context;
        }

        public async Task<List<InvestmentFormDto>> GetAllAsync()
        {
            var forms = await _context.InvestmentForms
                .Include(f => f.Items)
                .Where(f => !f.IsDeleted)
                .ToListAsync();
            return forms.Select(f => ToDto(f)).ToList();
        }

        public async Task<InvestmentFormDto> GetByIdAsync(int id)
        {
            var form = await _context.InvestmentForms
                .Include(f => f.Items)
                .FirstOrDefaultAsync(f => f.Id == id && !f.IsDeleted);
            return form == null ? null : ToDto(form);
        }

        public async Task<InvestmentFormDto> CreateAsync(InvestmentFormDto dto)
        {
            var form = new InvestmentForm
            {
                Region = dto.Region,
                Currency = dto.Currency,
                Location = dto.Location,
                TypeOfInvestment = dto.TypeOfInvestment,
                Justification = dto.Justification,
                ReqDate = dto.ReqDate,
                DueDate = dto.DueDate,
                Observations = dto.Observations,
                Total = dto.Total,
                Status = dto.Status,
                NumRitm = dto.NumRitm,
                NumCoupa = dto.NumCoupa,
                NumIyras = dto.NumIyras,
                IoNumber = dto.IoNumber,
                Items = dto.Items?.Select(i => new InvestmentItem
                {
                    Description = i.Description,
                    Supplier = i.Supplier,
                    UnitCost = i.UnitCost,
                    Shipping = i.Shipping,
                    SubTotal = i.SubTotal,
                    Quantity = i.Quantity,
                    Total = i.Total
                }).ToList()
            };
            _context.InvestmentForms.Add(form);
            await _context.SaveChangesAsync();
            return ToDto(form);
        }

        public async Task<InvestmentFormDto> UpdateAsync(int id, InvestmentFormDto dto)
        {
            var form = await _context.InvestmentForms.Include(f => f.Items).FirstOrDefaultAsync(f => f.Id == id);
            if (form == null) return null;
            form.Region = dto.Region;
            form.Currency = dto.Currency;
            form.Location = dto.Location;
            form.TypeOfInvestment = dto.TypeOfInvestment;
            form.Justification = dto.Justification;
            form.Observations = dto.Observations;
            form.Total = dto.Total;
            form.Status = dto.Status;
            form.NumRitm = dto.NumRitm;
            form.NumCoupa = dto.NumCoupa;
            form.NumIyras = dto.NumIyras;
            form.IoNumber = dto.IoNumber;
            // Update items: simple version (remove all, add new)
            _context.InvestmentItems.RemoveRange(form.Items);
            form.Items = dto.Items?.Select(i => new InvestmentItem
            {
                Description = i.Description,
                Supplier = i.Supplier,
                UnitCost = i.UnitCost,
                Shipping = i.Shipping,
                SubTotal = i.SubTotal,
                Quantity = i.Quantity,
                Total = i.Total
            }).ToList();
            await _context.SaveChangesAsync();
            return ToDto(form);
        }

        public async Task<bool> DeleteAsync(int id)
        {
            try
            {
                var form = await _context.InvestmentForms
                    .Include(f => f.Items)
                    .FirstOrDefaultAsync(f => f.Id == id);

                if (form == null) return false;

                // Marquer les items comme supprimés
                foreach (var item in form.Items)
                {
                    item.IsDeleted = true;
                    item.IsActive = false;
                }

                // Marquer le formulaire comme supprimé
                form.IsDeleted = true;
                form.IsActive = false;

                await _context.SaveChangesAsync();
                return true;
            }
            catch (DbUpdateException ex)
            {
                // Log the exception (e.g., using a logging framework)
                // Console.WriteLine(ex.Message); // Replace with proper logging
                return false; // Indicate failure due to database issues
            }
        }

        private InvestmentFormDto ToDto(InvestmentForm form)
        {
            return new InvestmentFormDto
            {
                Id = form.Id,
                Region = form.Region,
                Currency = form.Currency,
                Location = form.Location,
                TypeOfInvestment = form.TypeOfInvestment,
                Justification = form.Justification,
                ReqDate = form.ReqDate,
                DueDate = form.DueDate,
                Observations = form.Observations,
                Total = form.Total,
                Status = form.Status,
                NumRitm = form.NumRitm,
                NumCoupa = form.NumCoupa,
                NumIyras = form.NumIyras,
                IoNumber = form.IoNumber,
                Items = form.Items?.Select(i => new InvestmentItemDto
                {
                    Description = i.Description,
                    Supplier = i.Supplier,
                    UnitCost = i.UnitCost,
                    Shipping = i.Shipping,
                    SubTotal = i.SubTotal,
                    Quantity = i.Quantity,
                    Total = i.Total
                }).ToList()
            };
        }
    }
} 
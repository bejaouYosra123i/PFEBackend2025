using System;
using System.Linq;
using System.Threading.Tasks;
using System.Collections.Generic;
using Backend_dotnet.Core.DbContext;
using Backend_dotnet.Core.Entities;
using Microsoft.EntityFrameworkCore;

namespace Backend_dotnet.Core.Services
{
    public class PrivilegeService
    {
        private readonly ApplicationDbContext _dbContext;
        public PrivilegeService(ApplicationDbContext dbContext)
        {
            _dbContext = dbContext;
        }

        // Obtenir tous les privilèges
        public async Task<IEnumerable<Privilege>> GetAllPrivilegesAsync()
        {
            return await _dbContext.Privileges.ToListAsync();
        }

        // Obtenir les privilèges d'un utilisateur
        public async Task<IEnumerable<UserPrivilege>> GetUserPrivilegesAsync(string userId)
        {
            return await _dbContext.UserPrivileges
                .Include(up => up.Privilege)
                .Where(up => up.UserId == userId)
                .ToListAsync();
        }

        // Attribuer un privilège temporaire à un utilisateur
        public async Task<bool> AssignPrivilegeToUserAsync(string userId, int privilegeId, DateTime? startDate, DateTime? endDate)
        {
            var privilege = await _dbContext.Privileges.FindAsync(privilegeId);
            if (privilege == null) return false;
            var user = await _dbContext.Users.FindAsync(userId);
            if (user == null) return false;
            var existingPrivilege = await _dbContext.UserPrivileges
                .FirstOrDefaultAsync(up => up.UserId == userId && up.PrivilegeId == privilegeId);
            if (existingPrivilege != null)
            {
                existingPrivilege.StartDate = startDate;
                existingPrivilege.EndDate = endDate;
            }
            else
            {
                var userPrivilege = new UserPrivilege
                {
                    UserId = userId,
                    PrivilegeId = privilegeId,
                    StartDate = startDate,
                    EndDate = endDate
                };
                _dbContext.UserPrivileges.Add(userPrivilege);
            }
            await _dbContext.SaveChangesAsync();
            return true;
        }

        // Retirer un privilège d'un utilisateur
        public async Task<bool> RemovePrivilegeFromUserAsync(string userId, int privilegeId)
        {
            var userPrivilege = await _dbContext.UserPrivileges
                .FirstOrDefaultAsync(up => up.UserId == userId && up.PrivilegeId == privilegeId);
            if (userPrivilege == null) return false;
            _dbContext.UserPrivileges.Remove(userPrivilege);
            await _dbContext.SaveChangesAsync();
            return true;
        }

        // Vérifier si un utilisateur a un privilège (temporaire ou non)
        public async Task<bool> UserHasPrivilegeAsync(string userId, string privilegeName)
        {
            var now = DateTime.Now;
            return await _dbContext.UserPrivileges
                .Include(up => up.Privilege)
                .AnyAsync(up => up.UserId == userId
                    && up.Privilege.Name == privilegeName
                    && (up.StartDate == null || up.StartDate <= now)
                    && (up.EndDate == null || up.EndDate >= now));
        }
    }
} 
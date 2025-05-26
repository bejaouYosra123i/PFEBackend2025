using System;
using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace Backend_dotnet.Migrations
{
    /// <inheritdoc />
    public partial class AddPrivilegesAndUserPrivileges : Migration
    {
        /// <inheritdoc />
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            // Supprimer les tables existantes si elles existent
            migrationBuilder.DropTable(name: "UserPrivileges");
            migrationBuilder.DropTable(name: "Privileges");

            // Recréer la table Privileges
            migrationBuilder.CreateTable(
                name: "Privileges",
                columns: table => new
                {
                    Id = table.Column<int>(type: "int", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    Name = table.Column<string>(type: "nvarchar(450)", nullable: false),
                    Description = table.Column<string>(type: "nvarchar(max)", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_Privileges", x => x.Id);
                });

            // Recréer la table UserPrivileges
            migrationBuilder.CreateTable(
                name: "UserPrivileges",
                columns: table => new
                {
                    Id = table.Column<int>(type: "int", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    UserId = table.Column<string>(type: "nvarchar(450)", nullable: false),
                    PrivilegeId = table.Column<int>(type: "int", nullable: false),
                    StartDate = table.Column<DateTime>(type: "datetime2", nullable: true),
                    EndDate = table.Column<DateTime>(type: "datetime2", nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_UserPrivileges", x => x.Id);
                    table.ForeignKey(
                        name: "FK_UserPrivileges_Privileges_PrivilegeId",
                        column: x => x.PrivilegeId,
                        principalTable: "Privileges",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Cascade);
                    table.ForeignKey(
                        name: "FK_UserPrivileges_AspNetUsers_UserId",
                        column: x => x.UserId,
                        principalTable: "AspNetUsers",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Cascade);
                });

            // Ajouter les index
            migrationBuilder.CreateIndex(
                name: "IX_Privileges_Name",
                table: "Privileges",
                column: "Name",
                unique: true);

            migrationBuilder.CreateIndex(
                name: "IX_UserPrivileges_PrivilegeId",
                table: "UserPrivileges",
                column: "PrivilegeId");

            migrationBuilder.CreateIndex(
                name: "IX_UserPrivileges_UserId",
                table: "UserPrivileges",
                column: "UserId");

            // Insérer les privilèges de base
            migrationBuilder.InsertData(
                table: "Privileges",
                columns: new[] { "Name", "Description" },
                values: new object[,]
                {
                    { "ManageUsers", "Can manage users and their roles" },
                    { "ManageAssets", "Can manage assets" },
                    { "ViewReports", "Can view reports" },
                    { "ManageSettings", "Can manage system settings" }
                });
        }

        /// <inheritdoc />
        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropTable(name: "UserPrivileges");
            migrationBuilder.DropTable(name: "Privileges");
        }
    }
}

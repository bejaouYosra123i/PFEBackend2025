using System;
using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace Backend_dotnet.Migrations
{
    /// <inheritdoc />
    public partial class NomDeLaMigration : Migration
    {
        /// <inheritdoc />
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropColumn(
                name: "IoNumber",
                table: "InvestmentItems");

            migrationBuilder.DropColumn(
                name: "NumCoupa",
                table: "InvestmentItems");

            migrationBuilder.DropColumn(
                name: "NumRytm",
                table: "InvestmentItems");

            migrationBuilder.DropColumn(
                name: "NumYiras",
                table: "InvestmentItems");

            migrationBuilder.DropColumn(
                name: "Status",
                table: "InvestmentItems");

            migrationBuilder.CreateTable(
                name: "Trackings",
                columns: table => new
                {
                    Id = table.Column<int>(type: "int", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    InvestmentFormId = table.Column<int>(type: "int", nullable: false),
                    YirasNumber = table.Column<string>(type: "nvarchar(max)", nullable: true),
                    IoNumber = table.Column<string>(type: "nvarchar(max)", nullable: true),
                    CoupaNumber = table.Column<string>(type: "nvarchar(max)", nullable: true),
                    RytmNumber = table.Column<string>(type: "nvarchar(max)", nullable: true),
                    Status = table.Column<string>(type: "nvarchar(max)", nullable: false),
                    CreatedAt = table.Column<DateTime>(type: "datetime2", nullable: false),
                    UpdatedAt = table.Column<DateTime>(type: "datetime2", nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_Trackings", x => x.Id);
                    table.ForeignKey(
                        name: "FK_Trackings_InvestmentForms_InvestmentFormId",
                        column: x => x.InvestmentFormId,
                        principalTable: "InvestmentForms",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Cascade);
                });

            migrationBuilder.CreateIndex(
                name: "IX_Trackings_InvestmentFormId",
                table: "Trackings",
                column: "InvestmentFormId");
        }

        /// <inheritdoc />
        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropTable(
                name: "Trackings");

            migrationBuilder.AddColumn<string>(
                name: "IoNumber",
                table: "InvestmentItems",
                type: "nvarchar(max)",
                nullable: false,
                defaultValue: "");

            migrationBuilder.AddColumn<string>(
                name: "NumCoupa",
                table: "InvestmentItems",
                type: "nvarchar(max)",
                nullable: false,
                defaultValue: "");

            migrationBuilder.AddColumn<string>(
                name: "NumRytm",
                table: "InvestmentItems",
                type: "nvarchar(max)",
                nullable: false,
                defaultValue: "");

            migrationBuilder.AddColumn<string>(
                name: "NumYiras",
                table: "InvestmentItems",
                type: "nvarchar(max)",
                nullable: false,
                defaultValue: "");

            migrationBuilder.AddColumn<string>(
                name: "Status",
                table: "InvestmentItems",
                type: "nvarchar(max)",
                nullable: false,
                defaultValue: "");
        }
    }
}

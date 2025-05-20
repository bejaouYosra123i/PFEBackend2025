using System;
using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace Backend_dotnet.Migrations
{
    /// <inheritdoc />
    public partial class NomDe : Migration
    {
        /// <inheritdoc />
        protected override void Up(MigrationBuilder migrationBuilder)
        {
           

            migrationBuilder.DropColumn(
                name: "IoNumber",
                table: "InvestmentForms");

            migrationBuilder.DropColumn(
                name: "NumCoupa",
                table: "InvestmentForms");

            migrationBuilder.DropColumn(
                name: "NumIyras",
                table: "InvestmentForms");

            migrationBuilder.DropColumn(
                name: "NumRitm",
                table: "InvestmentForms");

            migrationBuilder.AddColumn<string>(
                name: "CoupaNumber",
                table: "InvestmentItems",
                type: "nvarchar(max)",
                nullable: false,
                defaultValue: "");

            migrationBuilder.AddColumn<string>(
                name: "IoNumber",
                table: "InvestmentItems",
                type: "nvarchar(max)",
                nullable: true);

            migrationBuilder.AddColumn<string>(
                name: "IyrasNumber",
                table: "InvestmentItems",
                type: "nvarchar(max)",
                nullable: false,
                defaultValue: "");

            migrationBuilder.AddColumn<string>(
                name: "NumCoupa",
                table: "InvestmentItems",
                type: "nvarchar(max)",
                nullable: true);

            migrationBuilder.AddColumn<string>(
                name: "NumIyras",
                table: "InvestmentItems",
                type: "nvarchar(max)",
                nullable: true);

            migrationBuilder.AddColumn<string>(
                name: "NumRitm",
                table: "InvestmentItems",
                type: "nvarchar(max)",
                nullable: true);

            migrationBuilder.AddColumn<string>(
                name: "RytmNumber",
                table: "InvestmentItems",
                type: "nvarchar(max)",
                nullable: false,
                defaultValue: "");
        }

        /// <inheritdoc />
        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropColumn(
                name: "CoupaNumber",
                table: "InvestmentItems");

            migrationBuilder.DropColumn(
                name: "IoNumber",
                table: "InvestmentItems");

            migrationBuilder.DropColumn(
                name: "IyrasNumber",
                table: "InvestmentItems");

            migrationBuilder.DropColumn(
                name: "NumCoupa",
                table: "InvestmentItems");

            migrationBuilder.DropColumn(
                name: "NumIyras",
                table: "InvestmentItems");

            migrationBuilder.DropColumn(
                name: "NumRitm",
                table: "InvestmentItems");

            migrationBuilder.DropColumn(
                name: "RytmNumber",
                table: "InvestmentItems");

            migrationBuilder.AddColumn<string>(
                name: "IoNumber",
                table: "InvestmentForms",
                type: "nvarchar(max)",
                nullable: true);

            migrationBuilder.AddColumn<string>(
                name: "NumCoupa",
                table: "InvestmentForms",
                type: "nvarchar(max)",
                nullable: true);

            migrationBuilder.AddColumn<string>(
                name: "NumIyras",
                table: "InvestmentForms",
                type: "nvarchar(max)",
                nullable: true);

            migrationBuilder.AddColumn<string>(
                name: "NumRitm",
                table: "InvestmentForms",
                type: "nvarchar(max)",
                nullable: true);

            migrationBuilder.CreateTable(
                name: "Trackings",
                columns: table => new
                {
                    Id = table.Column<int>(type: "int", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    InvestmentFormId = table.Column<int>(type: "int", nullable: false),
                    CoupaNumber = table.Column<string>(type: "nvarchar(max)", nullable: true),
                    CreatedAt = table.Column<DateTime>(type: "datetime2", nullable: false),
                    IoNumber = table.Column<string>(type: "nvarchar(max)", nullable: true),
                    RytmNumber = table.Column<string>(type: "nvarchar(max)", nullable: true),
                    Status = table.Column<string>(type: "nvarchar(max)", nullable: false),
                    UpdatedAt = table.Column<DateTime>(type: "datetime2", nullable: true),
                    YirasNumber = table.Column<string>(type: "nvarchar(max)", nullable: true)
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
    }
}

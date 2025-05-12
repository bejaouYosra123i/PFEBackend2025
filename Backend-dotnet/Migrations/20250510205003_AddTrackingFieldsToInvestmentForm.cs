using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace Backend_dotnet.Migrations
{
    /// <inheritdoc />
    public partial class AddTrackingFieldsToInvestmentForm : Migration
    {
        /// <inheritdoc />
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.AddColumn<string>(
                name: "Et",
                table: "InvestmentForms",
                type: "nvarchar(max)",
                nullable: false,
                defaultValue: "");

            migrationBuilder.AddColumn<string>(
                name: "IoNumber",
                table: "InvestmentForms",
                type: "nvarchar(max)",
                nullable: false,
                defaultValue: "");

            migrationBuilder.AddColumn<string>(
                name: "NumCoupa",
                table: "InvestmentForms",
                type: "nvarchar(max)",
                nullable: false,
                defaultValue: "");

            migrationBuilder.AddColumn<string>(
                name: "NumIyras",
                table: "InvestmentForms",
                type: "nvarchar(max)",
                nullable: false,
                defaultValue: "");

            migrationBuilder.AddColumn<string>(
                name: "NumRitm",
                table: "InvestmentForms",
                type: "nvarchar(max)",
                nullable: false,
                defaultValue: "");
        }

        /// <inheritdoc />
        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropColumn(
                name: "Et",
                table: "InvestmentForms");

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
        }
    }
}

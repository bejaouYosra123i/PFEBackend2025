using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace Backend_dotnet.Migrations
{
    /// <inheritdoc />
    public partial class AddTrackingFieldsToInvestmentItem : Migration
    {
        /// <inheritdoc />
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropColumn(
                name: "Permissions",
                table: "Users");

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

        /// <inheritdoc />
        protected override void Down(MigrationBuilder migrationBuilder)
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

            migrationBuilder.AddColumn<string>(
                name: "Permissions",
                table: "Users",
                type: "nvarchar(max)",
                nullable: false,
                defaultValue: "");
        }
    }
}

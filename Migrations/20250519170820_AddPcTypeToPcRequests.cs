using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace Backend_dotnet.Migrations
{
    /// <inheritdoc />
    public partial class AddPcTypeToPcRequests : Migration
    {
        /// <inheritdoc />
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropColumn(
                name: "MaterialType",
                table: "PcRequests");

            migrationBuilder.RenameColumn(
                name: "OtherMaterial",
                table: "PcRequests",
                newName: "PcType");
        }

        /// <inheritdoc />
        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.RenameColumn(
                name: "PcType",
                table: "PcRequests",
                newName: "OtherMaterial");

            migrationBuilder.AddColumn<string>(
                name: "MaterialType",
                table: "PcRequests",
                type: "nvarchar(max)",
                nullable: false,
                defaultValue: "");
        }
    }
}

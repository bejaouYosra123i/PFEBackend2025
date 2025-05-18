using Microsoft.EntityFrameworkCore.Migrations;

namespace Backend_dotnet.Migrations
{
    public partial class AddTrackingTable : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
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
                column: "InvestmentFormId",
                unique: true);
        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropTable(
                name: "Trackings");
        }
    }
} 
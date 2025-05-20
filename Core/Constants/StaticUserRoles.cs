namespace Backend_dotnet.Core.Constants;
//{ to avoid type erros
    public static class StaticUserRoles
    {


    public const string ADMIN = "ADMIN";
    public const string MANAGER = "MANAGER";
    public const string USER= "USER";
    public const string IT_MANAGER = "IT_MANAGER";
    public const string RH_MANAGER = "RH_MANAGER";
    public const string PLANT_MANAGER = "PLANT_MANAGER";



    public const string ManagerAdmin = "MANAGER,ADMIN";
    public const string ManagerAdminUser = "MANAGER,ADMIN,USER";
    public const string AllManagers = "IT_MANAGER,RH_MANAGER,PLANT_MANAGER";



    }

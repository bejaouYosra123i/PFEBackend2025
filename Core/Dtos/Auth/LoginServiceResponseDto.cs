using System.Runtime.CompilerServices;

namespace Backend_dotnet.Core.Dtos.Auth
{
    public class LoginServiceResponseDto
    {


        public string NewToken { get; set; }



        //this would be returned to the front-end
        public UserInfoResult UserInfo { get; set; }
    }
}

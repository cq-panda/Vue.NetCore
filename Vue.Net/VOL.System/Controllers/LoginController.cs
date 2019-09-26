using DotNet.Utilities;
using Microsoft.AspNetCore.Authentication;
using Microsoft.AspNetCore.Authentication.Cookies;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using System;
using System.IO;
using System.Linq;
using System.Security.Claims;
using System.Threading.Tasks;
using VOL.Core.Configuration;
using VOL.Core.Enums;
using VOL.Core.Extensions;
using VOL.Core.Filters;
using VOL.Core.Services;
using VOL.Core.Utilities;
using VOL.Entity.DomainModels;
using VOL.System.IRepositories;

namespace VOL.System.Controllers
{
    public class LoginController : Controller
    {
        private string VerificationCode = "VerCode";

        private ISys_UserRepository sys_UserRepository { get; set; }
        public LoginController(ISys_UserRepository sys_UserRepository)
        {
            this.sys_UserRepository = sys_UserRepository;
        }
        [AllowAnonymous]
        public ActionResult Index()
        {
            if (!string.IsNullOrEmpty(HttpContext.Request("ReturnUrl")))
            {
                ContentResult content = new ContentResult
                {
                    ContentType = "text/html",
                    Content = string.Format("<script language='javaScript' type='text/javaScript'> window.parent.location.href = '/Login/Index';</script>")
                };
                return content;
            }
            return View("~/Views/System/Login/Index.cshtml");
        }

        [AllowAnonymous]
        public async Task<ActionResult> ValidateLogin(LoginInfo loginInfo)
        {
            string msg = string.Empty;
            WebResponseContent responseData = new WebResponseContent();

            try
            {
                responseData = loginInfo.ValidationEntity();
                if (!responseData.Status)
                    return Json(responseData);
                responseData.Status = false;
                var PINCode = TempData[VerificationCode];
                if (PINCode == null ||
                    loginInfo.VerificationCode.ToLower() != PINCode.ToString().ToLower())
                    return Json(responseData.Set(ResponseType.PINError, false));

                Sys_User user = await Task.Run(() => sys_UserRepository.Find(x => x.UserName == loginInfo.UserName).FirstOrDefault());
                if (user == null || loginInfo.PassWord.Trim() != (user.UserPwd ?? "").DecryptDES(AppSetting.Secret.User))
                {
                    responseData.Set(ResponseType.LoginError);
                    return Json(responseData);
                }

                ClaimsIdentity claimIdentity = new ClaimsIdentity(CookieAuthenticationDefaults.AuthenticationScheme);
                claimIdentity.AddClaim(new Claim(ClaimTypes.NameIdentifier, user.User_Id.ToString()));
                claimIdentity.AddClaim(new Claim(ClaimTypes.Name, user.UserName));
                claimIdentity.AddClaim(new Claim(ClaimTypes.Surname, user.UserTrueName));
                claimIdentity.AddClaim(new Claim(ClaimTypes.Role, user.Role_Id.ToString()));
                claimIdentity.AddClaim(new Claim("RoleName", user.RoleName ?? ""));
                await HttpContext.SignInAsync(
                    new ClaimsPrincipal(claimIdentity),
                    new AuthenticationProperties() { ExpiresUtc = DateTimeOffset.UtcNow.AddMinutes(60) });
                TempData[VerificationCode] = string.Empty;
                loginInfo.PassWord = "";
                responseData.Set(ResponseType.LoginSuccess, true);
            }
            catch (Exception ex)
            {
                msg = ex.Message + ex.StackTrace;
                responseData.Set(ResponseType.ServerError);
                return Json(responseData);
            }
            finally
            {
                Logger.Info(LoggerType.Login, loginInfo.Serialize(), responseData.Message, msg);
            }
            return Json(responseData);
        }
        [AllowAnonymous]
        public ActionResult GetVerificationCode()
        {
            string code = string.Empty;
            MemoryStream ms = VierificationCodeServices.Create(out code);
            TempData[VerificationCode] = code;
            Response.Body.Dispose();
            byte[] bytes = ms.ToArray();
            ms.Dispose();
            return File(bytes, @"image/png");
        }
        [ActionPermission()]
        public async Task<IActionResult> Out()
        {
            await HttpContext.SignOutAsync(CookieAuthenticationDefaults.AuthenticationScheme);
            TempData[VerificationCode] = string.Empty;
            return new RedirectResult("/Login/Index");
        }

    }
}

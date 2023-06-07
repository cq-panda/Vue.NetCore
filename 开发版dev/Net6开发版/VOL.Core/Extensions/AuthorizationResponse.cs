using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Filters;
using System.IdentityModel.Tokens.Jwt;
using System.Net;
using System.Security.Claims;
using VOL.Core.Configuration;
using VOL.Core.Enums;
using VOL.Core.Services;
using VOL.Core.Utilities;

namespace VOL.Core.Extensions
{
    public static class AuthorizationResponse
    {
        public static AuthorizationFilterContext FilterResult(
          this AuthorizationFilterContext context,
            HttpStatusCode statusCode,
            string message = null)
        {
            context.Result = new ContentResult()
            {
                Content = new { message, status = false, code = (int)statusCode }.Serialize(),
                ContentType = "application/json",
                StatusCode = (int)statusCode
            };
            Logger.Info(LoggerType.ApiAuthorize, message);
            return context;
        }
        public static AuthorizationFilterContext Unauthorized(this AuthorizationFilterContext context, string message = null)
        {
            return context.FilterResult(HttpStatusCode.Unauthorized, message);
        }
        //不通过JWT验证的，直接将用户信息缓存起来
        public static void AddIdentity(this AuthorizationFilterContext context, int? userId=null)
        {
            int _userId = userId ?? JwtHelper.GetUserId(context.HttpContext.Request.Headers[AppSetting.TokenHeaderName]);
            if (_userId <= 0) return;
            //将用户Id缓存到上下文(或者自定一个对象，通过DI以AddScoped方式注入上下文来管理用户信息)
            var claims = new Claim[] { new Claim(JwtRegisteredClaimNames.Jti, _userId.ToString()) };
            context.HttpContext.User.AddIdentity(new ClaimsIdentity(claims));
        }
    }

}

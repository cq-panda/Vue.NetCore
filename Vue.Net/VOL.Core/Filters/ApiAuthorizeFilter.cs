using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Authorization;
using Microsoft.AspNetCore.Mvc.Filters;
using System;
using System.IdentityModel.Tokens.Jwt;
using System.Linq;
using System.Net;
using System.Security.Claims;
using VOL.Core.Configuration;
using VOL.Core.Enums;
using VOL.Core.Extensions;
using VOL.Core.ManageUser;
using VOL.Core.Services;
using VOL.Core.Utilities;

namespace VOL.Core.Filters
{
    public class ApiAuthorizeFilter : IAuthorizationFilter
    {

        public ApiAuthorizeFilter()
        {

        }
        /// <summary>
        /// 只判断token是否正确，不判断权限
        /// 如果需要判断权限的在Action上加上ApiActionPermission属性标识权限类别，ActionPermissionFilter作权限处理
        ///(string,string,string)1、请求参数,2、返回消息，3,异常消息,4状态
        /// </summary>
        /// <param name="context"></param>
        public void OnAuthorization(AuthorizationFilterContext context)
        {
            if (context.Filters.Any(item => item is IAllowAnonymousFilter))
            {
                //如果是不需要授权方法并且传入了token，需要将用户的ID缓存起来，保证UserHelper里能正确获取到用户信息
                if (!context.HttpContext.User.Identity.IsAuthenticated
                    && !string.IsNullOrEmpty(context.HttpContext.Request.Headers[AppSetting.TokenHeaderName]))
                {
                    int userId = JwtHelper.GetUserId(context.HttpContext.Request.Headers[AppSetting.TokenHeaderName]);
                    if (userId <= 0) return;
                    //将用户Id缓存到上下文(或者自定一个对象，通过DI以AddScoped方式注入上下文来管理用户信息)
                    var claims = new Claim[] { new Claim(JwtRegisteredClaimNames.Jti, userId.ToString()) };
                    context.HttpContext.User.AddIdentity(new ClaimsIdentity(claims));
                }
                return;
            }
            //限定一个帐号不能在多处登陆   UserContext.Current.Token != ((ClaimsIdentity)context.HttpContext.User.Identity)?.BootstrapContext?.ToString()

            // &&UserContext.Current.UserName!="admin666"为演示环境，实际使用时去掉此条件
            if (!context.HttpContext.User.Identity.IsAuthenticated
                || (
                UserContext.Current.Token != ((ClaimsIdentity)context.HttpContext.User.Identity)
                ?.BootstrapContext?.ToString()
                &&UserContext.Current.UserName!="admin666"
                ))
            {
                Console.Write($"IsAuthenticated:{context.HttpContext.User.Identity.IsAuthenticated}," +
                    $"userToken{UserContext.Current.Token}" +
                    $"BootstrapContext:{((ClaimsIdentity)context.HttpContext.User.Identity)?.BootstrapContext?.ToString()}");
                Response(context, "登陆已过期", HttpStatusCode.Unauthorized);
                return;
            }

            DateTime expDate = context.HttpContext.User.Claims.Where(x => x.Type == JwtRegisteredClaimNames.Exp)
                .Select(x => x.Value).FirstOrDefault().GetTimeSpmpToDate();
            //如果过期时间小于设置定分钟数的1/3时，返回状态需要刷新token
            if (expDate < DateTime.Now || (expDate - DateTime.Now).TotalMinutes < AppSetting.ExpMinutes / 3)
            {
                Response(context, "Token即将过期,请更换token", HttpStatusCode.Accepted);//202
                return;
            }

        }

        private void Response(AuthorizationFilterContext context, string message, HttpStatusCode statusCode)
        {
            context.Result = new ContentResult()
            {
                Content = new { message, status = false, code = (int)statusCode }.Serialize(),
                ContentType = "application/json",
                StatusCode = (int)statusCode
            };
            Logger.Info(LoggerType.ApiAuthorize, message);
        }
    }
}

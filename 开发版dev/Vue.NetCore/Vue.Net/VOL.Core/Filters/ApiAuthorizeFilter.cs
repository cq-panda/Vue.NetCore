using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc.Authorization;
using Microsoft.AspNetCore.Mvc.Filters;
using System;
using System.IdentityModel.Tokens.Jwt;
using System.Linq;
using System.Net;
using System.Security.Claims;
using VOL.Core.Configuration;
using VOL.Core.Extensions;
using VOL.Core.ManageUser;

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
           // is Microsoft.AspNetCore.Authentication.AllowAnonymousAttribute
            //if (context.Filters.Any(item => item is IAllowAnonymousFilter))
            if (context.ActionDescriptor.EndpointMetadata.Any(item => item is IAllowAnonymous))
            {
                //如果使用了固定Token不过期，直接对token的合法性及token是否存在进行验证
                if (context.Filters
                    .Where(item => item is IFixedTokenFilter)
                    .FirstOrDefault() is IFixedTokenFilter tokenFilter)
                {
                    tokenFilter.OnAuthorization(context);
                    return;
                }
                //匿名并传入了token，需要将用户的ID缓存起来，保证UserHelper里能正确获取到用户信息
                if (!context.HttpContext.User.Identity.IsAuthenticated
                    && !string.IsNullOrEmpty(context.HttpContext.Request.Headers[AppSetting.TokenHeaderName]))
                {
                    context.AddIdentity();
                }
                return;
            }
            //限定一个帐号不能在多处登陆   UserContext.Current.Token != ((ClaimsIdentity)context.HttpContext.User.Identity)?.BootstrapContext?.ToString()

            // &&UserContext.Current.UserName!="admin666"为演示环境，实际使用时去掉此条件
            if (!context.HttpContext.User.Identity.IsAuthenticated
                || (
                UserContext.Current.Token != ((ClaimsIdentity)context.HttpContext.User.Identity)
                ?.BootstrapContext?.ToString()
                && UserContext.Current.UserName != "admin666" 
                ))
            {
                Console.Write($"IsAuthenticated:{context.HttpContext.User.Identity.IsAuthenticated}," +
                    $"userToken{UserContext.Current.Token}" +
                    $"BootstrapContext:{((ClaimsIdentity)context.HttpContext.User.Identity)?.BootstrapContext?.ToString()}");
                context.Unauthorized("登陆已过期");
                return;
            }

            DateTime expDate = context.HttpContext.User.Claims.Where(x => x.Type == JwtRegisteredClaimNames.Exp)
                .Select(x => x.Value).FirstOrDefault().GetTimeSpmpToDate();
            //动态标识刷新token(2021.05.01)
            if ((expDate - DateTime.Now).TotalMinutes < AppSetting.ExpMinutes/ 3 && context.HttpContext.Request.Path != replaceTokenPath)
            {
                context.HttpContext.Response.Headers.Add("vol_exp", "1");
            }
        }
        private static readonly string replaceTokenPath = "/api/User/replaceToken";
    }
}

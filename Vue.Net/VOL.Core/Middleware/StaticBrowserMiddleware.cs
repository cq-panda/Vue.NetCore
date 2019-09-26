using Microsoft.AspNetCore.Http;
using System;
using System.IO;
using System.Collections.Generic;
using System.Text;
using System.Threading.Tasks;
using VOL.Core.Const;
using VOL.Core.Extensions;
using VOL.Core.Services;
using System.Data;
using VOL.Entity.DomainModels;

namespace VOL.Core.Middleware
{
    public class StaticBrowserMiddleware
    {

        public static Func<RequestDelegate, RequestDelegate> Browser
        {
            get
            {
                return next => async context =>
                {
                //    if (!(context.Request.Path.ToString().StartsWith($"/{ConfigOptions.AppStaticFolder}", StringComparison.OrdinalIgnoreCase)
                // && context.Request.Path.ToString()[$"/{ConfigOptions.AppStaticFolder}".Length] == '/'
                //))
                //    {
                //        await next(context);

                //        return;
                //    }
                //    string token = context.Request.Query["token"];

                //    App_StaticBrowserLog browserLog = new App_StaticBrowserLog()
                //    {
                //        ServerIP = context.Request.Host.Host,
                //        Url = context.Request.Path,
                //        User_Id = context.Request.Query["uid"].GetInt(),
                //        CreateDate = DateTime.Now,
                //        TablePrimaryKey=0,
                //        TableName="Other"
                //    };
                //    if (!string.IsNullOrEmpty(token))
                //    {
                //     try
                //        {
                //            string[] tokenInfo = token.Replace("-", "=").DecryptDES(Secret.HtmlToken)?.Split(",");

                //            if (tokenInfo != null && tokenInfo.Length == 2)
                //            {
                //                browserLog.TableName = tokenInfo[0];
                //                browserLog.TablePrimaryKey = tokenInfo[1].GetInt();
                //            }
                //        }
                //        catch { }
                //    }
                //    ApiStaticBrowseLogService.WriteHtmlLog(browserLog);
                    await next(context);
                };
            }
        }
    }

}

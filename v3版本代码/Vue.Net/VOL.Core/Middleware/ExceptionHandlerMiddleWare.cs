using Microsoft.AspNetCore.Hosting;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Http.Features;
using Microsoft.AspNetCore.Routing;
using Microsoft.Extensions.Hosting;
using System;
using System.IO;
using System.Text;
using System.Threading.Tasks;
using VOL.Core.Const;
using VOL.Core.EFDbContext;
using VOL.Core.Enums;
using VOL.Core.Extensions;
using VOL.Core.ManageUser;
using VOL.Core.Services;

namespace VOL.Core.Middleware
{

    public class ExceptionHandlerMiddleWare
    {
        private readonly RequestDelegate next;
        public ExceptionHandlerMiddleWare(RequestDelegate next)
        {
            this.next = next;
        }

        public async Task Invoke(HttpContext context)
        {
            try
            {
                context.Request.EnableBuffering();
                (context.RequestServices.GetService(typeof(ActionObserver)) as ActionObserver).RequestDate = DateTime.Now;
                await next(context);
                //app.UseMiddleware<ExceptionHandlerMiddleWare>()放在  app.UseRouting()后才可以在await next(context);前执行
                Endpoint endpoint = context.Features.Get<IEndpointFeature>()?.Endpoint;
                if (endpoint != null && endpoint is RouteEndpoint routeEndpoint)
                {
                    ActionLog log = endpoint.Metadata.GetMetadata<ActionLog>();
                    if (log != null && log.Write)
                    {
                        Logger.Add(log?.LogType, null, null, null, status: LoggerStatus.Info);
                    }
                }
                else
                {
                    Logger.Info(LoggerType.Info);
                }
            }
            catch (Exception exception)
            {
                var env = context.RequestServices.GetService(typeof(IWebHostEnvironment)) as IWebHostEnvironment;
                string message = exception.Message + exception.InnerException;
                Logger.Error(LoggerType.Exception, message);
                if (!env.IsDevelopment())
                {
                    message = "服务器处理异常";
                }
                else
                {
                    Console.WriteLine($"服务器处理出现异常:{message}");
                }
                context.Response.StatusCode = 500;
                context.Response.ContentType = ApplicationContentType.JSON;
                await context.Response.WriteAsync(new { message, status = false }.Serialize(), Encoding.UTF8);
            }
        }
    }
}

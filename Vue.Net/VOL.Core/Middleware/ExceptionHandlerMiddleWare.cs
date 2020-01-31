using Microsoft.AspNetCore.Http;
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
                (context.RequestServices.GetService(typeof(ActionObserver)) as ActionObserver).RequestDate = DateTime.Now;
                await next(context);
                Logger.Info(LoggerType.System);
            }
            catch (Exception exception)
            {
                //  (context.RequestServices.GetService(typeof(ActionObserver)) as ActionObserver).IsWrite = false;
                string message = exception.Message
                    + exception.InnerException
                    ?.InnerException
                    ?.Message
                    + exception.InnerException
                    + exception.StackTrace;
                Console.WriteLine($"服务器处理出现异常:{message}");
                Logger.Error(LoggerType.Exception, message);
                context.Response.StatusCode = 500;
                context.Response.ContentType = ApplicationContentType.JSON;
                await context.Response.WriteAsync(new { message = "~服务器没有正确处理请求,请稍等再试!", status = false }.Serialize()
                  , Encoding.UTF8);
            }
        }
    }
}

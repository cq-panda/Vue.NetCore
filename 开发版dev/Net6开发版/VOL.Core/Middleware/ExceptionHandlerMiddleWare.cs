using Microsoft.AspNetCore.Hosting;
using Microsoft.AspNetCore.Http;
using Microsoft.Extensions.Hosting;
using System;
using System.IO;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using VOL.Core.Const;
using VOL.Core.Enums;
using VOL.Core.Extensions;
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
            context.Request.EnableBuffering();
        
            var requestBodyStream = new MemoryStream();
            await context.Request.Body.CopyToAsync(requestBodyStream);
            requestBodyStream.Seek(0, SeekOrigin.Begin);

            var requestBodyText = new StreamReader(requestBodyStream).ReadToEnd();

            // Get the URL parameters
            var urlParameters = context.Request.Query;
            if (urlParameters.Count > 0)
            {
                var formattedParameters = string.Join("&", urlParameters.Select(x => $"{x.Key}={x.Value}"));
                requestBodyText = "URL 参数: " + formattedParameters + Environment.NewLine + requestBodyText;
            }

            requestBodyStream.Seek(0, SeekOrigin.Begin);
            context.Request.Body = requestBodyStream;

            // Create a new memory stream
            var originalBodyStream = context.Response.Body;
            using (var responseBody = new MemoryStream())
            {
                try
                {
                    // Replace the context response body with our memory stream
                    context.Response.Body = responseBody;

                    (context.RequestServices.GetService(typeof(ActionObserver)) as ActionObserver).RequestDate = DateTime.Now;
                    // Continue down the Middleware pipeline
                    await next(context);

                    // Copy the contents of the new memory stream (which contains the response) to the original stream
                    responseBody.Seek(0, SeekOrigin.Begin);
                    var responseBodyText = new StreamReader(responseBody).ReadToEnd();
                    
                    Logger.Info(LoggerType.System, requestBodyText.TruncateToLength(), responseBodyText.TruncateToLength());
                    

                    responseBody.Seek(0, SeekOrigin.Begin);
                    await responseBody.CopyToAsync(originalBodyStream);
                }
                catch (Exception exception)
                {
                    var env = context.RequestServices.GetService(typeof(IWebHostEnvironment)) as IWebHostEnvironment;
                    string message = exception.Message + exception.InnerException;
                    Logger.Error(LoggerType.Exception, requestBodyText.TruncateToLength(), "", message);
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
}

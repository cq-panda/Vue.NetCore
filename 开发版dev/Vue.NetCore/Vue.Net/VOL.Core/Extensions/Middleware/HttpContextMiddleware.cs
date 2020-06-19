using Microsoft.AspNetCore.Http;
using System;
using System.Collections.Generic;
using System.IO;
using System.Text;

namespace VOL.Core.Extensions
{
    public class HttpContextMiddleware
    {
        /// <summary>
        /// 将流重新
        /// </summary>
        public static Func<RequestDelegate, RequestDelegate> contextMiddleware
        {
            get
            {
                return next => async context =>
                {

                    var stream = context.Request.Body;
                    if (stream == Stream.Null || stream.CanSeek)
                    {
                        await next(context);

                        return;
                    }
                    try
                    {
                        //将流拷贝一份出来,调用结束后再将流写回去
                        using (var buffer = new MemoryStream())
                        {
                            // Copy the request stream to the memory stream.
                            await stream.CopyToAsync(buffer);

                            // Rewind the memory stream.
                            buffer.Position = 0L;

                            // Replace the request stream by the memory stream.
                            context.Request.Body = buffer;

                            // Invoke the rest of the pipeline.
                            await next(context);
                        }
                    }

                    finally
                    {
                        // Restore the original stream.
                        context.Request.Body = stream;
                    }

                };

            }
        }
    }
}

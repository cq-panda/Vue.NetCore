using Microsoft.AspNetCore.Builder;
using Microsoft.AspNetCore.Http;
using Microsoft.Extensions.FileProviders;
using System;
using System.Collections.Generic;
using System.IO;
using System.Text;

namespace VOL.Core.Extensions
{
    public static class StaticDefaultFileExtensions
    {
        public static IApplicationBuilder UseStaticDefaultFile(this IApplicationBuilder app, string path)
        {
            app.UseStaticFiles(new StaticFileOptions()
            {

                FileProvider = new PhysicalFileProvider(
                Path.Combine(path, "Content")),
                RequestPath = new PathString("/Content")
                //,
                //OnPrepareResponse = x => {
                //    x.Context.Response.Headers.Append("Cache-Control", "public,max-age=600");
                //}
            })
            .UseStaticFiles(new StaticFileOptions()
            {

                FileProvider = new PhysicalFileProvider(
                Path.Combine(path, "fonts")),
                RequestPath = new PathString("/fonts")
            })
            .UseStaticFiles(new StaticFileOptions()
            {

                FileProvider = new PhysicalFileProvider(
                Path.Combine(path, "Scripts")),
                RequestPath = new PathString("/Scripts")
            })
            .UseStaticFiles(new StaticFileOptions()
            {

                FileProvider = new PhysicalFileProvider(
                Path.Combine(path, "Html")),
                RequestPath = new PathString("/Html")
            });
            return app;
        }
    }
}

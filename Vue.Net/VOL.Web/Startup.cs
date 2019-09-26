using Microsoft.AspNetCore.Authentication.Cookies;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Builder;
using Microsoft.AspNetCore.Hosting;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Http.Internal;
using Microsoft.AspNetCore.Mvc.Authorization;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.DependencyInjection;
using Microsoft.Extensions.FileProviders;
using Microsoft.Extensions.Logging;
using System;
using System.Collections.Generic;
using System.IO;
using VOL.Core.Const;
using VOL.Core.Extensions;
using VOL.Core.Filters;
using VOL.Core.Middleware;


namespace VOL.Web
{
    public class Startup
    {
        public Startup(IHostingEnvironment env, ILoggerFactory factory)
        {
               var builder = new ConfigurationBuilder()
                .SetBasePath(env.ContentRootPath)
                .AddJsonFile("appsettings.json", optional: false, reloadOnChange: true)
                .AddJsonFile($"appsettings.{env.EnvironmentName}.json", optional: true)
                .AddEnvironmentVariables();
            Configuration = builder.Build();
        }


        public IConfiguration Configuration { get; }

        // This method gets called by the runtime. Use this method to add services to the container.
        public IServiceProvider ConfigureServices(IServiceCollection services)
        {
            services.AddAuthentication(options =>
            {
                options.DefaultScheme = CookieAuthenticationDefaults.AuthenticationScheme;
            })
            .AddCookie(options =>
            {
                options.Cookie.HttpOnly = true;
                options.LoginPath = new PathString("/Login/Index");
                options.ClaimsIssuer = CookieAuthenticationDefaults.AuthenticationScheme;
                options.SlidingExpiration = true;
                options.ExpireTimeSpan = TimeSpan.FromMinutes(60);
            });

            services.AddHttpContextAccessor();
            services.AddMvc().AddJsonOptions(op => op.SerializerSettings.ContractResolver =
                                new Newtonsoft.Json.Serialization.DefaultContractResolver())
                                .AddJsonOptions(options =>
                                {
                                    options.SerializerSettings.DateFormatString = "yyyy-MM-dd HH:mm:ss";
                                }); ;
            services.AddMvc(options =>
            {
                var policy = new AuthorizationPolicyBuilder()
                                .RequireAuthenticatedUser()
                                .Build();
                options.Filters.Add(new AuthorizeFilter(policy));
                options.Filters.Add(typeof(ActionExecuteFilter));
                //注入自定义ModelBinder
                //options.ModelBinderProviders.Insert(0, new VOL.Core.ModelBinder.BaseBinderProvider(new List<Type>()
                //{
                //}));
            });
            return services.AddModule(Configuration);
        }


        // This method gets called by the runtime. Use this method to configure the HTTP request pipeline.
        public void Configure(IApplicationBuilder app, IHostingEnvironment env)
        {
            app.UseForwardedHeaders(new ForwardedHeadersOptions()
            {
                ForwardedHeaders = Microsoft.AspNetCore.HttpOverrides.ForwardedHeaders.XForwardedFor | Microsoft.AspNetCore.HttpOverrides.ForwardedHeaders.XForwardedProto
            });
            //app.Use(async (context, next) =>
            //{
            //    context.Request.EnableRewind();
            //    await next();
            //});
            app.Use(StaticBrowserMiddleware.Browser);
            if (env.IsDevelopment())
            {
                app.UseDeveloperExceptionPage();
                //   app.UseBrowserLink();
            }
            else
            {
                app.UseExceptionHandler("/Home/Error");
            }
            if (!string.IsNullOrEmpty(ConfigOptions.StaticFolder) && Directory.Exists(ConfigOptions.StaticFolder))
            {
                app.UseStaticFiles(new StaticFileOptions()

                {
                    FileProvider = new PhysicalFileProvider(
              //配置虚拟目录所在路径
              Path.Combine(Directory.GetCurrentDirectory(), ConfigOptions.StaticFolder)),
                    //配置访问虚拟目录时文件夹别名
                    RequestPath = new PathString(ConfigOptions.VirtualFolder)
                });
            }
            app.UseStaticFiles(new StaticFileOptions()

            {
                FileProvider = new PhysicalFileProvider(
               Path.Combine(Directory.GetCurrentDirectory(), @"Html")),
                //配置访问虚拟目录时文件夹别名
                RequestPath = "/Html"
            });

            app.UseStaticFiles(new StaticFileOptions()

            {
                FileProvider = new PhysicalFileProvider(
                Path.Combine(Directory.GetCurrentDirectory(), @"Static")),
                //配置访问虚拟目录时文件夹别名
                RequestPath = "/app"
            });
            app.UseSession();
            app.UseStaticHttpContext()
                .UseStaticDefaultFile(Directory.GetCurrentDirectory())
                .UseStaticFiles(new StaticFileOptions
                {      //设置不限制content-type
                    ServeUnknownFileTypes = true
                })
                .UseAuthentication()
                //  .UseMiddleware<StaticBrowserMiddleware>()
                .UseMiddleware<ExceptionHandlerMiddleWare>()
                .UseMvcWithDefaultRoute()
                .UseMvc()
                .UseMvc(routes =>
                {
                    routes.MapRoute(
                        name: "beef_default",
                        template: "{controller=Home}/{action=Index}/{id?}");
                });



        }
    }
}

using Microsoft.AspNetCore.Authentication.JwtBearer;
using Microsoft.AspNetCore.Builder;
using Microsoft.AspNetCore.Hosting;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Http.Internal;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.DependencyInjection;
using Microsoft.Extensions.FileProviders;
using Microsoft.IdentityModel.Tokens;
using Swashbuckle.AspNetCore.Swagger;
using System;
using System.Collections.Generic;
using System.IO;
using System.Text;
using VOL.Core.Configuration;
using VOL.Core.Extensions;
using VOL.Core.Filters;
using VOL.Core.Middleware;

namespace VOL.WebApi
{
    public class Startup
    {
        public Startup(IConfiguration configuration)
        {
            Configuration = configuration;
        }

        public IConfiguration Configuration { get; }

        // This method gets called by the runtime. Use this method to add services to the container.
        public IServiceProvider ConfigureServices(IServiceCollection services)
        {
            services.AddSingleton<IHttpContextAccessor, HttpContextAccessor>();
            services.AddMvc(options =>
            {
                options.Filters.Add(typeof(ApiAuthorizeFilter));
                options.Filters.Add(typeof(ActionExecuteFilter));
            });
            services.AddCors();
            services.AddMvc()
            .AddJsonOptions(op =>
            {
                op.SerializerSettings.ContractResolver = new Newtonsoft.Json.Serialization.CamelCasePropertyNamesContractResolver();
                // op.SerializerSettings.DateFormatString = "yyyy-MM-dd HH:mm:ss";
            });

            services.AddAuthentication(JwtBearerDefaults.AuthenticationScheme)
            .AddJwtBearer(options =>
            {
                options.TokenValidationParameters = new TokenValidationParameters
                {
                    SaveSigninToken = true,//保存token,后台验证token是否生效(重要)
                    ValidateIssuer = true,//是否验证Issuer
                    ValidateAudience = true,//是否验证Audience
                    ValidateLifetime = true,//是否验证失效时间
                    ValidateIssuerSigningKey = true,//是否验证SecurityKey
                    ValidAudience = AppSetting.Secret.Audience,//Audience
                    ValidIssuer = AppSetting.Secret.Issuer,//Issuer，这两项和前面签发jwt的设置一致
                    IssuerSigningKey = new SymmetricSecurityKey(Encoding.UTF8.GetBytes(AppSetting.Secret.JWT)),
                    AudienceValidator = (IEnumerable<string> audiences, SecurityToken securityToken,
                    TokenValidationParameters validationParameters) =>
                    {
                        bool audienceValidator = true;
                        return audienceValidator;
                    }
                };
            });

            services.AddSwaggerGen(c =>
            {
                c.SwaggerDoc("v1", new Info
                {
                    Version = "v1",
                    Title = "Vue后台Api",
                    Description = "Vue后台Api",
                    TermsOfService = "None"
                });
                var security = new Dictionary<string, IEnumerable<string>>
                { { AppSetting.Secret.Issuer, new string[] { } }};
                c.AddSecurityRequirement(security);

                c.AddSecurityDefinition(AppSetting.Secret.Issuer, new ApiKeyScheme
                {
                    Description = "JWT授权token前面需要加上字段Bearer与一个空格,如Bearer 12345x",
                    Name = AppSetting.TokenHeaderName,//jwt默认的参数名称
                    In = "header",//jwt默认存放Authorization信息的位置(请求头中)
                    Type = "apiKey"
                });
            });
            return services.AddModule(Configuration);
        }

        // This method gets called by the runtime. Use this method to configure the HTTP request pipeline.
        public void Configure(IApplicationBuilder app, IHostingEnvironment env)
        {
            app.UseAuthentication();
            app.UseMiddleware<ExceptionHandlerMiddleWare>();
            app.UseCors(builder => builder
                .AllowAnyOrigin()
                .AllowAnyMethod()
                .AllowAnyHeader()
                .AllowCredentials());
            app.UseMvc();
            //使用webapi时设置Body内容可以重复读取
            app.Use(HttpRequestMiddleware.Context);
            app.Use(async (context, next) =>
            {
                context.Request.EnableRewind();
                await next();
            });

            string path = Directory.GetCurrentDirectory() + "/Upload";
            Console.Write(path);
            if (!Directory.Exists(path))
            {
                Directory.CreateDirectory(path);
            }
            app.UseStaticFiles(new StaticFileOptions()
            {
                FileProvider = new PhysicalFileProvider(
                Path.Combine(Directory.GetCurrentDirectory(), @"Upload")),
                //配置访问虚拟目录时文件夹别名
                RequestPath = "/Upload",
                OnPrepareResponse = (Microsoft.AspNetCore.StaticFiles.StaticFileResponseContext staticFile) =>
                {
                    //可以在此处读取请求的信息进行权限认证
                    //  staticFile.File
                    //  staticFile.Context.Response.StatusCode;
                }
            });

            //配置HttpContext
            app.UseStaticHttpContext()
                .UseStaticFiles(new StaticFileOptions
                {      //设置不限制content-type
                    ServeUnknownFileTypes = true
                });
            if (env.IsDevelopment())
            {
                app.UseDeveloperExceptionPage();
            }
            //配置全局异常
            app.UseSwagger();
            app.UseSwaggerUI(c =>
            {
                c.SwaggerEndpoint("/swagger/v1/swagger.json", "api接口");
            });

            app.UseMvc(routes =>
             {
                 routes.MapRoute(
                     name: "ApiDefault",
                     template: "{controller}/{action}/{id?}",
                     defaults: new { controller = "ApiHome", action = "Index" }
                 );
             });
            app.UseMvc();

        }
    }
}

using Autofac;
using Autofac.Extensions.DependencyInjection;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.DependencyInjection;
using Microsoft.Extensions.DependencyModel;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Reflection;
using System.Runtime.Loader;
using VOL.Core.CacheManager;
using VOL.Core.Configuration;
using VOL.Core.Const;
using VOL.Core.DBManager;
using VOL.Core.EFDbContext;
using VOL.Core.Enums;
using VOL.Core.Extensions.AutofacManager;
using VOL.Core.ManageUser;

namespace VOL.Core.Extensions
{
    public static class AutofacContainerModuleExtension
    {
        private static bool _isMysql = false;
        public static IServiceProvider AddModule(this IServiceCollection services, IConfiguration configuration)
        {
            services.AddSession();
            services.AddMemoryCache();
            //初始化配置文件
            AppSetting.Init(services, configuration);
            ContainerBuilder builder = new ContainerBuilder();

            //批量注入autofac
            Type baseType = typeof(IDependency);
            var compilationLibrary = DependencyContext.Default.CompileLibraries.Where(x => !x.Serviceable && x.Type != "package");
            List<Assembly> assemblyList = new List<Assembly>();
            foreach (var _compilation in compilationLibrary)
            {
                assemblyList.Add(AssemblyLoadContext.Default.LoadFromAssemblyName(new AssemblyName(_compilation.Name)));
            }
            builder.RegisterAssemblyTypes(assemblyList.ToArray())
             .Where(type => baseType.IsAssignableFrom(type) && !type.IsAbstract)
             .AsSelf().AsImplementedInterfaces() //.PropertiesAutowired()//属性注入
             .InstancePerLifetimeScope();

            //注入用管理类,将用户信息写入上下文管理，减少redis或memory使用，提高效率
            services.AddScoped(typeof(UserContext));
            services.AddScoped(typeof(Services.ActionObserver));
            //注入EF
            _isMysql = DBType.Name == DbCurrentType.MySql.ToString();
            void dbContextOptions(DbContextOptionsBuilder optionsBuilder)
            {
                string connectionString = DBServerProvider.GetConnectionString(null);
                if (_isMysql)
                {
                    optionsBuilder.UseMySql(connectionString);
                }
                else
                {
                    optionsBuilder.UseSqlServer(connectionString);
                }
            }
            services.AddDbContext<VOLContext>(dbContextOptions);

            //启用缓存
            if (AppSetting.UseRedis)
            {
                services.AddSingleton(typeof(ICacheService), typeof(RedisCacheService));
            }
            else
            {
                services.AddSingleton<ICacheService, MemoryCacheService>();
            }
        
            builder.Populate(services);
            return new AutofacServiceProvider(builder.Build());
        }

    }
}

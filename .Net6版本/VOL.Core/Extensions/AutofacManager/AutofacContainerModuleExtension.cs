using Autofac;
using Autofac.Extensions.DependencyInjection;
using Dapper;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Caching.Memory;
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
using VOL.Core.Dapper;
using VOL.Core.DBManager;
using VOL.Core.EFDbContext;
using VOL.Core.Enums;
using VOL.Core.Extensions.AutofacManager;
using VOL.Core.KafkaManager.IService;
using VOL.Core.KafkaManager.Service;
using VOL.Core.ManageUser;
using VOL.Core.ObjectActionValidator;
using VOL.Core.Services;

namespace VOL.Core.Extensions
{
    public static class AutofacContainerModuleExtension
    {
        //  private static bool _isMysql = false;
        public static IServiceCollection AddModule(this IServiceCollection services, ContainerBuilder builder, IConfiguration configuration)
        {
            //services.AddSession();
            //services.AddMemoryCache();
            //初始化配置文件
            AppSetting.Init(services, configuration);
            Type baseType = typeof(IDependency);
            var compilationLibrary = DependencyContext.Default
                .RuntimeLibraries
                .Where(x => !x.Serviceable
                && x.Type == "project")
                .ToList();
            var count1 = compilationLibrary.Count;
            List<Assembly> assemblyList = new List<Assembly>();

            foreach (var _compilation in compilationLibrary)
            {
                try
                {
                    assemblyList.Add(AssemblyLoadContext.Default.LoadFromAssemblyName(new AssemblyName(_compilation.Name)));
                }
                catch (Exception ex)
                {
                    Console.WriteLine(_compilation.Name + ex.Message);
                }
            }
            builder.RegisterAssemblyTypes(assemblyList.ToArray())
             .Where(type => baseType.IsAssignableFrom(type) && !type.IsAbstract)
             .AsSelf().AsImplementedInterfaces()
             .InstancePerLifetimeScope();
            builder.RegisterType<UserContext>().InstancePerLifetimeScope();
            builder.RegisterType<ActionObserver>().InstancePerLifetimeScope();
            //model校验结果
            builder.RegisterType<ObjectModelValidatorState>().InstancePerLifetimeScope();
            string connectionString = DBServerProvider.GetConnectionString(null);

            if (DBType.Name == DbCurrentType.MySql.ToString())
            {
                //2020.03.31增加dapper对mysql字段Guid映射
                SqlMapper.AddTypeHandler(new DapperParseGuidTypeHandler());
                SqlMapper.RemoveTypeMap(typeof(Guid?));

                //services.AddDbContext<VOLContext>();
                //mysql8.x的版本使用Pomelo.EntityFrameworkCore.MySql 3.1会产生异常，需要在字符串连接上添加allowPublicKeyRetrieval=true
                services.AddDbContextPool<VOLContext>(optionsBuilder => { optionsBuilder.UseMySql(connectionString, new MySqlServerVersion(new Version(8, 0, 11))); }, 64);
            }
            else if (DBType.Name == DbCurrentType.PgSql.ToString())
            {
                services.AddDbContextPool<VOLContext>(optionsBuilder => { optionsBuilder.UseNpgsql(connectionString); }, 64);
            }
            {
                services.AddDbContextPool<VOLContext>(optionsBuilder => { optionsBuilder.UseSqlServer(connectionString); }, 64);
            } 
            //启用缓存
            if (AppSetting.UseRedis)    
            {
                builder.RegisterType<RedisCacheService>().As<ICacheService>().SingleInstance();
            }
            else
            {
                builder.RegisterType<MemoryCacheService>().As<ICacheService>().SingleInstance();
            }
            //kafka注入
            if (AppSetting.Kafka.UseConsumer)
                builder.RegisterType<KafkaConsumer<string, string>>().As<IKafkaConsumer<string, string>>().SingleInstance();
            if (AppSetting.Kafka.UseProducer)
                builder.RegisterType<KafkaProducer<string, string>>().As<IKafkaProducer<string, string>>().SingleInstance();
            return services;
        }

    }
}

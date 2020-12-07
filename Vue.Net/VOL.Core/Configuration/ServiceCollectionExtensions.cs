using Microsoft.Extensions.DependencyInjection;
using Microsoft.Extensions.DependencyInjection.Extensions;
using System.Collections.Generic;
using System.Linq;
using System.Reflection;
using VOL.Core.Configuration.ConfigModel;
using VOL.Core.Enums;
using VOL.Core.Extensions;
using VOL.Core.Helpers;

namespace VOL.Core.Configuration
{
    public static class ServiceCollectionExtensions
    {
        /// <summary>
        /// 添加配置管理
        /// </summary>
        /// <param name="services"></param>
        /// <returns></returns>
        public static IServiceCollection AddConfig(this IServiceCollection services)
        {
            //配置核心服务
            services.AddConfigCore();

            return services;
        }

        /// <summary>
        /// 添加配置项核心服务
        /// </summary>
        /// <param name="services"></param>
        /// <returns></returns>
        public static IServiceCollection AddConfigCore(this IServiceCollection services)
        {
            if (services.All(m => m.ServiceType != typeof(IConfigCollection)))
            {
                services.AddImplementTypes();
            }

            return services;
        }


        /// <summary>
        /// 加载所有配置实现
        /// </summary>
        /// <param name="services"></param>
        private static void AddImplementTypes(this IServiceCollection services)
        {
            var configs = new ConfigCollection();
            var assemblies = AssemblyHelper.Load();
            foreach (var assembly in assemblies)
            {
                var types = assembly.GetTypes().Where(m => typeof(IConfig).IsImplementType(m) && typeof(IConfig) != m);
                foreach (var implType in types)
                {
                    if (implType.FullName.NotNull())
                    {
                        var descriptor = new ConfigDescriptor
                        {
                            Code = implType.Name.Replace("Config", ""),
                            ImplementType = implType
                        };

                        configs.Add(descriptor);
                    }
                }
            }

            services.AddChangedEvent(assemblies, configs);

            services.AddSingleton<IConfigCollection>(configs);
        }

        /// <summary>
        /// 注入变更事件
        /// </summary>
        /// <param name="services"></param>
        /// <param name="assemblies"></param>
        /// <param name="configs"></param>
        private static void AddChangedEvent(this IServiceCollection services, List<Assembly> assemblies, ConfigCollection configs)
        {
            foreach (var assembly in assemblies)
            {
                var types = assembly.GetTypes().Where(m => typeof(IConfigChangeEvent<>).IsImplementType(m));
                foreach (var implType in types)
                {
                    var configType = implType.GetInterfaces().First().GetGenericArguments()[0];
                    var configDescriptor = configs.FirstOrDefault(m => m.ImplementType == configType);
                    if (configDescriptor != null)
                    {
                        configDescriptor.ChangeEvents.Add(implType);

                        services.AddSingleton(implType);
                    }
                }
            }
        }

    }
}

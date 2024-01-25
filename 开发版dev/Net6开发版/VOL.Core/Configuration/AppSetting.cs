using Microsoft.AspNetCore.Hosting;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.DependencyInjection;
using Microsoft.Extensions.Options;
using System.IO;
using VOL.Core.Const;
using VOL.Core.Extensions;
using Yitter.IdGenerator;

namespace VOL.Core.Configuration
{
    public static class AppSetting
    {
        public static IConfiguration Configuration { get; private set; }

        public static string DbConnectionString
        {
            get { return _connection.DbConnectionString; }
        }

        public static string RedisConnectionString
        {
            get { return _connection.RedisConnectionString; }
        }

        public static bool UseRedis
        {
            get { return _connection.UseRedis; }
        }
        public static bool UseSignalR
        {
            get { return _connection.UseSignalR; }
        }
        public static Secret Secret { get; private set; }

        public static CreateMember CreateMember { get; private set; }

        public static ModifyMember ModifyMember { get; private set; }

        private static Connection _connection;

        public static string TokenHeaderName = "Authorization";

        /// <summary>
        /// Actions权限过滤
        /// </summary>
        public static GlobalFilter GlobalFilter { get; set; }

        /// <summary>
        /// kafka配置
        /// </summary>
        public static Kafka Kafka { get; set; }


        /// <summary>
        /// JWT有效期(分钟=默认120)
        /// </summary>
        public static int ExpMinutes { get; private set; } = 120;

        // 是否启用雪花ID
        public static bool EnableSnowFlakeID { get; set; } = false;

        public static string CurrentPath { get; private set; } = null;
        public static string DownLoadPath { get { return CurrentPath + "\\Download\\"; } }
        public static void Init(IServiceCollection services, IConfiguration configuration)
        {
            Configuration = configuration;
            services.Configure<Secret>(configuration.GetSection("Secret"));
            services.Configure<Connection>(configuration.GetSection("Connection"));
            services.Configure<CreateMember>(configuration.GetSection("CreateMember"));
            services.Configure<ModifyMember>(configuration.GetSection("ModifyMember"));
            services.Configure<GlobalFilter>(configuration.GetSection("GlobalFilter"));
            services.Configure<Kafka>(configuration.GetSection("Kafka"));

            var provider = services.BuildServiceProvider();
            IWebHostEnvironment environment = provider.GetRequiredService<IWebHostEnvironment>();
            CurrentPath = Path.Combine(environment.ContentRootPath, "").ReplacePath();

            Secret = provider.GetRequiredService<IOptions<Secret>>().Value;

            //设置修改或删除时需要设置为默认用户信息的字段
            CreateMember = provider.GetRequiredService<IOptions<CreateMember>>().Value ?? new CreateMember();
            ModifyMember = provider.GetRequiredService<IOptions<ModifyMember>>().Value ?? new ModifyMember();

            GlobalFilter = provider.GetRequiredService<IOptions<GlobalFilter>>().Value ?? new GlobalFilter();

            GlobalFilter.Actions = GlobalFilter.Actions ?? new string[0];
            Kafka = provider.GetRequiredService<IOptions<Kafka>>().Value ?? new Kafka();

            _connection = provider.GetRequiredService<IOptions<Connection>>().Value;

    

            ExpMinutes = (configuration["ExpMinutes"] ?? "120").GetInt();

            EnableSnowFlakeID = (configuration["EnableSnowFlakeID"] ?? "false").GetBool();

            if (EnableSnowFlakeID)
            {
                var options = configuration.GetSection("SnowFlakeOptions").Get<Yitter.IdGenerator.IdGeneratorOptions>();
                YitIdHelper.SetIdGenerator(options);
            }

            DBType.Name = _connection.DBType;
            if (string.IsNullOrEmpty(_connection.DbConnectionString))
                throw new System.Exception("未配置好数据库默认连接");

            try
            {
                _connection.DbConnectionString = _connection.DbConnectionString.DecryptDES(Secret.DB);
            }
            catch { }

            if (!string.IsNullOrEmpty(_connection.RedisConnectionString))
            {
                try
                {
                    _connection.RedisConnectionString = _connection.RedisConnectionString.DecryptDES(Secret.Redis);
                }
                catch { }
            }

        }
        // 多个节点name格式 ：["key:key1"]
        public static string GetSettingString(string key)
        {
            return Configuration[key];
        }
        // 多个节点,通过.GetSection("key")["key1"]获取
        public static IConfigurationSection GetSection(string key)
        {
            return Configuration.GetSection(key);
        }
    }

    public class Connection
    {
        public string DBType { get; set; }
        public string DbConnectionString { get; set; }
        public string RedisConnectionString { get; set; }
        public bool UseRedis { get; set; }
        public bool UseSignalR { get; set; }
    }

    public class CreateMember: TableDefaultColumns
    {
    }
    public class ModifyMember: TableDefaultColumns
    {
    }

    public abstract class TableDefaultColumns
    {
        public string UserIdField { get; set; }
        public string UserNameField { get; set; }
        public string DateField { get; set; }
    }
    public class GlobalFilter
    {
        public string Message { get; set; }
        public bool Enable { get; set; }
        public string[] Actions { get; set; }
    }

    public class Kafka
    {
        public bool UseProducer { get; set; }
        public ProducerSettings ProducerSettings { get; set; }
        public bool UseConsumer { get; set; }
        public bool IsConsumerSubscribe { get; set; }
        public ConsumerSettings ConsumerSettings { get; set; }
        public Topics Topics { get; set; }
    }
    public class ProducerSettings
    {
        public string BootstrapServers { get; set; }
        public string SaslMechanism { get; set; }
        public string SecurityProtocol { get; set; }
        public string SaslUsername { get; set; }
        public string SaslPassword { get; set; }
    }
    public class ConsumerSettings
    {
        public string BootstrapServers { get; set; }
        public string SaslMechanism { get; set; }
        public string SecurityProtocol { get; set; }
        public string SaslUsername { get; set; }
        public string SaslPassword { get; set; }
        public string GroupId { get; set; }
    }
    public class Topics
    {
        public string TestTopic { get; set; }
    }
}

using Microsoft.AspNetCore.Http;
using Microsoft.Extensions.DependencyInjection;
using SqlSugar;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Linq.Expressions;
using System.Reflection;
using System.Text;
using System.Threading.Tasks;
using VOL.Core.Configuration;
using VOL.Core.DBManager;
using VOL.Core.DbSqlSugar;
using VOL.Core.Enums;
using VOL.Core.Extensions;

namespace VOL.Core.DBManager
{
    public static class SqlSugarRegister
    {

        /// <summary>
        ///系统库链接
        /// </summary>
        /// <returns></returns>
        public static ConnectionConfig GetSysConnectionConfig()
        {
            return new ConnectionConfig()
            {
                DbType = DbManger.GetDbType(),// SqlSugar.DbType.SqlServer,
                ConnectionString = DBServerProvider.GetConnectionString(null),
                IsAutoCloseConnection = true,
                ConfigId = "default",
                MoreSettings = new ConnMoreSettings()
                {
                    PgSqlIsAutoToLower = false
                }
            };
        }


        public static IServiceCollection UseSqlSugar(this IServiceCollection services)
        {
            services.AddHttpContextAccessor();
            var dbType = DbManger.GetDbType();
            //缓存所有配置文件的中的数据库链接
            var configs = new List<ConnectionConfig>() { };

            services.AddSingleton<ISqlSugarClient>(s =>
            {
                SqlSugarScope sqlSugar = new SqlSugarScope(
                 GetSysConnectionConfig(),
               //这里自定义数据库链接
               //new List<ConnectionConfig>()
               //{
               //   sysConfig,
               //    new ConnectionConfig(){
               //    DbType = dbType,// SqlSugar.DbType.SqlServer,
               //    ConnectionString = DBServerProvider.SysConnectingString,
               //    IsAutoCloseConnection = true,
               //    ConfigId ="名字"// typeof(SysDbContext).Name,
               //  },

               //},
               db =>
               {
                   //单例参数配置，所有上下文生效
                   db.Aop.OnLogExecuting = (sql, pars) =>
                   {
                       if (AppSetting.ShowSqlLog)
                       {
                           Console.Write(sql);
                       }
                   };

               });
                return sqlSugar;
            });
            return services;
        }
    }
}

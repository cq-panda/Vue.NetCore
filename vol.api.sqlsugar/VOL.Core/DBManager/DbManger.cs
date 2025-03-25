using Microsoft.Extensions.DependencyInjection;
using SqlSugar;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using VOL.Core.DBManager;
using VOL.Core.Enums;
using VOL.Core.ManageUser;
using VOL.Core.Utilities;

namespace VOL.Core.DbSqlSugar
{
    public class DbManger
    {
        /// <summary>
        /// 获取系统库：后台异步使用
        /// </summary>
        public static SqlSugarScope SqlSugarClient = new SqlSugarScope(
          new List<ConnectionConfig>() {
              SqlSugarRegister.GetSysConnectionConfig()
              //添加其他数据库链接
          },
         db =>
         {
             db.Aop.OnLogExecuting = (sql, pars) =>
            {
                Console.WriteLine(sql);//输出sql,查看执行sql 性能无影响

            };
         });
        public static ISqlSugarClient GetSqlSugarClient(string dbContextName = null)
        {
            return GetConnection(dbContextName);
        }
        public static ISqlSugarClient GetConnection(string configId)
        {
            //其他配置文件里面的自定义数据库链接名称
            return Db.GetConnection(configId);
        }

        public static SqlSugarScope Db
        {
            get
            {
                var obj = HttpContext.Current.RequestServices.GetService<ISqlSugarClient>();
                return (SqlSugarScope)obj;
            }
        }

        public static DbType GetDbType()
        {
            if (Const.DBType.Name == DbCurrentType.MsSql.ToString())
            {
                return DbType.SqlServer;
            }
            else if (Const.DBType.Name == DbCurrentType.MySql.ToString())
            {
                return DbType.MySql;
            }
            else if (Const.DBType.Name == DbCurrentType.PgSql.ToString())
            {
                return DbType.PostgreSQL;
            }
            throw new Exception("未实现数据库");
        }
    }
}

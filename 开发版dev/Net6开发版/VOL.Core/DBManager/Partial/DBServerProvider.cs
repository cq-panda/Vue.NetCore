using System;
using System.Collections.Generic;
using System.Text;
using VOL.Core.Configuration;
using VOL.Core.Dapper;
using VOL.Core.Enums;

namespace VOL.Core.DBManager
{
    /// <summary>
    /// 2022.11.21增加其他数据库(sqlserver、mysql、pgsql、oracle)连接配置说明
    /// 需要把两个DBServerProvider.cs文件都更新下
    /// </summary>
    public partial class DBServerProvider
    {
        ///// <summary>
        ///// 单独配置mysql数据库
        ///// </summary>
        //public static ISqlDapper SqlDapperMySql
        //{
        //    get
        //    {
        //        //读取appsettings.json中的配置
        //        string 数据库连接字符串 = AppSetting.GetSettingString("key");
        //        return new SqlDapper(数据库连接字符串, DbCurrentType.MySql);

        //        //访问数据库方式
        //        //DBServerProvider.SqlDapperMySql.xx
        //    }
        //}


        ///// <summary>
        ///// 如果有多个不同的mysql数据库，这里再加一个配置
        ///// </summary>
        //public static ISqlDapper SqlDapperMySql2
        //{
        //    get
        //    {
        //        //读取appsettings.json中的配置
        //        string 数据库连接字符串 = AppSetting.GetSettingString("key2");
        //        return new SqlDapper(数据库连接字符串, DbCurrentType.MySql);

        //        //访问数据库方式
        //        //DBServerProvider.SqlDapperMySql2.xx
        //    }
        //}

        ///// <summary>
        ///// 单独配置SqlServer数据库
        ///// </summary>
        //public static ISqlDapper SqlDapperSqlServer
        //{
        //    get
        //    {
        //        //读取appsettings.json中的配置
        //        string 数据库连接字符串 = AppSetting.GetSettingString("key");
        //        return new SqlDapper(数据库连接字符串, DbCurrentType.MsSql);

        //        //访问数据库方式
        //        //DBServerProvider.SqlDapperSqlServer.xx
        //    }
        //}
    }
}

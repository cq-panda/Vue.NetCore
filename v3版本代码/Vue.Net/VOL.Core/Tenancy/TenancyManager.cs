using System;
using System.Collections.Generic;
using System.Text;
using VOL.Core.ManageUser;

namespace VOL.Core.Tenancy
{
    public static class TenancyManager<T> where T : class
    {
        /// <summary>
        /// 数据库表名
        /// </summary>
        /// <param name="tableName"></param>
        /// <returns></returns>
        public static string GetSearchQueryable(string tableName)
        {
            string multiTenancyString = $"select * from {tableName}";
            //超级管理员不限制
            //if (UserContext.Current.IsSuperAdmin)
            //{
            //    return multiTenancyString;
            //}
            switch (tableName)
            {
                //例如：指定用户表指定查询条件
                //case "Sys_User": 
                //    multiTenancyString += $" where UserId='{UserContext.Current.UserId}'";
                //    break;
                default:
                    //开启数租户数据隔离,用户只能看到自己的表数据(自己根据需要写条件做租户数据隔离)
                    multiTenancyString += $" where CreateID='{UserContext.Current.UserId}'";
                    break;
            }
            return multiTenancyString;
        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="tableName">数据库表名</param>
        /// <param name="ids">当前操作的所有id</param>
        /// <param name="tableKey">主键字段</param>
        /// <returns></returns>
        public static string GetMultiTenancySql(string tableName, string ids, string tableKey)
        {
            //使用方法同上
            string multiTenancyString;
            switch (tableName)
            {
                default:
                    multiTenancyString = $"select count(*) FROM {tableName} " +
                       $" where CreateID='{UserContext.Current.UserId}'" +
                       $" and  { tableKey} in ({ids}) ";
                    break;
            }
            return multiTenancyString;
        }
    }
}

using Microsoft.AspNetCore.Http;
using System;
using System.Collections.Generic;
using System.Text;
using VOL.Core.ManageUser;
using VOL.Core.UserManager;

namespace VOL.Core.Infrastructure
{
    public static class DictionaryHandler
    {
        /*2020.05.01增加根据用户信息加载字典数据源sql*/

        /// <summary>
        /// 获取自定义数据源sql
        /// </summary>
        /// <param name="dicNo"></param>
        /// <param name="originalSql"></param>
        /// <returns></returns>
        public static string GetCustomDBSql(string dicNo, string originalSql)
        {
            switch (dicNo)
            {
                case "roles":
                    originalSql = GetRolesSql( originalSql);
                    break;
                default:
                    break;
            }
            return originalSql;
        }

        /// <summary>
        /// 获取解决的数据源，只能看到自己与下级所有角色
        /// </summary>
        /// <param name="context"></param>
        /// <param name="originalSql"></param>
        /// <returns></returns>
        public static string GetRolesSql(string originalSql)
        {
            if (UserContext.Current.IsSuperAdmin)
            {
                return originalSql;
            }
            int currnetRoleId = UserContext.Current.RoleId;
            List<int> roleIds = RoleContext.GetAllChildrenIds(currnetRoleId);
            roleIds.Add(currnetRoleId);
            string sql = $@"SELECT Role_Id as 'key',RoleName as 'value' FROM Sys_Role 
                           WHERE Enable=1  and Role_Id in ({string.Join(',', roleIds)})";
            return sql;
        }
    }
}

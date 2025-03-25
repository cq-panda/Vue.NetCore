using System;
using VOL.Core.Enums;

namespace VOL.Core.Filters
{
    public class ApiActionPermissionAttribute : ActionPermissionAttribute
    {
        public ApiActionPermissionAttribute()
            : base(true)
        {
        }
        /// <summary>
        /// 限定角色访问
        /// </summary>
        /// <param name="roles"></param>
        public ApiActionPermissionAttribute(int roleId)
       : base(roleId, true)
        {
        }
        /// <summary>
        /// 限定角色访问
        /// </summary>
        /// <param name="roles"></param>
        public ApiActionPermissionAttribute(ActionRolePermission actionRolePermission)
         : base(actionRolePermission, true)
        {
           
        }

        public ApiActionPermissionAttribute(string tableName, ActionPermissionOptions tableAction, bool sysController = false)
            : base(tableName, tableAction, sysController, true)
        {
            
        }
        public ApiActionPermissionAttribute(string tableName, string roleIds, ActionPermissionOptions tableAction, bool sysController = false)
           : base(tableName, roleIds, tableAction, sysController, true)
        {
        }
        public ApiActionPermissionAttribute(ActionPermissionOptions tableAction)
        : base(tableAction, true)
        {

        }

    }

    public enum ActionRolePermission
    {
        /// <summary>
        /// 角色ID为1
        /// </summary>
        SuperAdmin = 1,
        Admin=2
    }
}

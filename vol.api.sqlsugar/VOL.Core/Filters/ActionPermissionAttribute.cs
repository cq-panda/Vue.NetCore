using Microsoft.AspNetCore.Mvc;
using System;
using System.Collections.Generic;
using System.Linq;
using VOL.Core.Enums;
using VOL.Core.Extensions;

namespace VOL.Core.Filters
{
    public class ActionPermissionAttribute : TypeFilterAttribute
    {
        public ActionPermissionAttribute(bool isApi = false)
            : base(typeof(ActionPermissionFilter))
        {
            Arguments = new object[] { new ActionPermissionRequirement() { IsApi = isApi } };
        }
        /// <summary>
        /// 限定角色访问
        /// </summary>
        /// <param name="roles"></param>
        public ActionPermissionAttribute(int roleId, bool isApi = false)
       : base(typeof(ActionPermissionFilter))
        {
            Arguments = new object[] { new ActionPermissionRequirement() { RoleIds = new int[] { roleId }, IsApi = isApi } };
        }
        public ActionPermissionAttribute(ActionRolePermission actionRolePermission, bool isApi = false)
        : base(typeof(ActionPermissionFilter))
        {
            Array array = Enum.GetValues(typeof(ActionRolePermission));
            List<int> roles = new List<int>();
            foreach (ActionRolePermission item in array)
            {
                if (actionRolePermission.HasFlag(item))
                {
                    roles.Add((int)item);
                }
            }
            Arguments = new object[] { new ActionPermissionRequirement() { RoleIds = roles.ToArray(), IsApi = isApi } };
        }
        /// <summary>
        /// 限定角色访问
        /// </summary>
        /// <param name="roles"></param>
        public ActionPermissionAttribute(int[] roleIds, bool isApi = false)
       : base(typeof(ActionPermissionFilter))
        {
            Arguments = new object[] { new ActionPermissionRequirement() { RoleIds = roleIds, IsApi = isApi } };
        }

        public ActionPermissionAttribute(string tableName, ActionPermissionOptions tableAction, bool sysController = false, bool isApi = false)
            : base(typeof(ActionPermissionFilter))
        {
            this.SetActionPermissionRequirement(tableName, tableAction, sysController, isApi);
        }

        public ActionPermissionAttribute(string tableName, string roleIds, ActionPermissionOptions tableAction, bool sysController = false, bool isApi = false)
           : base(typeof(ActionPermissionFilter))
        {
            this.SetActionPermissionRequirement(tableName, tableAction, (roleIds ?? "").Split(",").Select(x => x.GetInt()).ToArray(), sysController, isApi);
        }

        public ActionPermissionAttribute(ActionPermissionOptions tableAction, bool isApi = false)
        : base(typeof(ActionPermissionFilter))
        {
            this.SetActionPermissionRequirement("", tableAction, true, isApi);
        }
        private void SetActionPermissionRequirement(string tableName, ActionPermissionOptions tableAction,
            int[] roleId, bool sysController = false, bool isApi = false)
        {
            Arguments = new object[] { new ActionPermissionRequirement() {
                 SysController=sysController,
                 TableAction=tableAction.ToString(),
                 TableName=tableName,
                 IsApi = isApi,
                 RoleIds=roleId
            } };
        }

        private void SetActionPermissionRequirement(string tableName, ActionPermissionOptions tableAction, bool sysController = false, bool isApi = false, int? roleId = null)
        {
            SetActionPermissionRequirement(tableName, tableAction, roleId == null ? null : new int[] { (int)roleId }, sysController, isApi);
        }
    }
}

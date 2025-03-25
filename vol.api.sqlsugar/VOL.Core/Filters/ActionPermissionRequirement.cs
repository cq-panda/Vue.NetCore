using System;
using System.Collections.Generic;
using System.Text;

namespace VOL.Core.Filters
{
    public class ActionPermissionRequirement
    {
        /// <summary>
        /// 控制器要操作的表
        /// </summary>
        public string TableName { get; set; } = string.Empty;
        /// <summary>
        /// 对表的操作/删除/查询等
        /// </summary>
        public string TableAction { get; set; } = string.Empty;
        /// <summary>
        /// 是否为框架定义的控制器
        /// </summary>
        public bool SysController { get; set; }
        /// <summary>
        /// 限制只能由某些角色Id访问
        /// </summary>
        public int[] RoleIds { get; set; }

        public bool IsApi { get; set; }
    }
}

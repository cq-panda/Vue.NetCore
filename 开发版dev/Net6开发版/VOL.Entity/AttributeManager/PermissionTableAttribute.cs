using System;

namespace VOL.Entity.AttributeManager
{
    public class PermissionTableAttribute : Attribute
    {
        /// <summary>
        /// 需要控制权限的表名与Sys_Menu表的表名必须一致
        /// </summary>
        public string Name { get; set; }
    }
}

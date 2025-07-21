using System;
using System.Collections.Generic;
using System.Text;

namespace VOL.Core.WorkFlow
{
    public enum AuditStatus
    {
        待审核 = 0,
        审核通过 = 1,
        审核中 = 2,
        审核未通过 = 3,
        驳回 = 4,
        终止 = 5,
        反审 = 9,
        //预留审批流程草稿、待提交功能
        草稿 = 90,
        待提交 = 100
    }

    public enum AuditType
    {
        用户审批 = 1,
        角色审批 = 2,
        部门审批 = 3,
        提交人上级部门审批 = 4,
        提交人上级角色审批 = 5,
        提交人自己 = 6,
        //根据提交人的部门，找到部门下所有用户的角色
        提交人部门对应角色 = 7
    }
}

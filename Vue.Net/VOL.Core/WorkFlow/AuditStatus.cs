using System;
using System.Collections.Generic;
using System.Text;

namespace VOL.Core.WorkFlow
{
    public enum AuditStatus
    {
        审核中 = 0,
        审核通过 = 1,
        审核未通过 = 2,
        驳回 = 3
    }

    public enum AuditType
    {
        用户审批 = 1,
        角色审批 = 2,
        部门审批 = 3
    }
}

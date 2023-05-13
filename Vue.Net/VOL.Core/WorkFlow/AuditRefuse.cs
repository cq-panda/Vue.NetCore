using System;
using System.Collections.Generic;
using System.Text;

namespace VOL.Core.WorkFlow
{
    public enum AuditRefuse
    {
        流程结束 = 0,
        返回上一节点 = 1,
        流程重新开始 = 2
    }
}

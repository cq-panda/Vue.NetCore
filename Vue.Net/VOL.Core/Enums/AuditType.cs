using System;
using System.Collections.Generic;
using System.Text;

namespace VOL.Core.Enums
{
    public enum AuditType
    {
        Notice=5, //审核通知
        Succes=6,//审核通过
        Fail=7,//审核失败
        App_Question,
        App_Expert,
        App_ReportPrice

    }
}

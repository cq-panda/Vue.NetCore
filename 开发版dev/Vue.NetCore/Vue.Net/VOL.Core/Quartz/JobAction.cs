using System;
using System.Collections.Generic;
using System.Text;

namespace VOL.Core.Quartz
{
    public enum JobAction
    {
        新增 = 1,
        删除 = 2,
        修改 = 3,
        暂停 = 4,
        停止,
        开启,
        立即执行
    }
}

using System;
using System.Collections.Generic;
using System.Text;

namespace VOL.Core.Enums
{
    public enum ActionPermissionOptions
    {
        Add = 0,
        Delete = 1,
        Update = 2,
        Search=4,
        Export=8,
        Audit=16,
        Upload=32,//上传文件
        Import=64 //导入表数据Excel
    }
}

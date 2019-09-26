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
        Search=3,
        Export=4,
        Audit,
        Upload,//上传文件
        Import //导入表数据Excel
    }
}

using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using VOL.Core.DBManager;
using VOL.Core.Extensions.AutofacManager;
using VOL.Entity.DomainModels;

namespace VOL.Core.Utilities
{
    public class SystemSettingContext
    {
        public static Sys_Setting Setting
        {
            get
            {
                return DBServerProvider.DbContext.Set<Sys_Setting>().First(f => f.Id == 1);
            }
        }
    }
}

using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace VOL.Entity
{
    public class ApiRequireAttribute : Attribute
    {
        /// <summary>
        /// 忽略不验证biz_content的控制器,实际ActionName，不是route的name
        /// </summary>
      public string[] IgnoreActions { get; set; }
    }
}

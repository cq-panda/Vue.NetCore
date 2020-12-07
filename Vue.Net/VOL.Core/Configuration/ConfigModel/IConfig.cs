using System;
using System.Collections.Generic;
using System.Text;

namespace VOL.Core.Configuration.ConfigModel
{
    public interface IConfig
    {
        /// <summary>
        /// 修改时间
        /// </summary>
        public DateTime? ModifyDate { get; set; }
    }
}

using VOL.Core.Enums;
using VOL.Entity.System;
using System;
using System.Collections.Generic;
using System.Text;

namespace VOL.Core.Utilities
{
    public class ApiRequestParameters
    {
        /// <summary>
        /// Token  
        /// </summary>
        public string Token { get; set; }
        /// <summary>
        /// 时间戳，格式为yyyy-MM-dd HH:mm:ss,例如2018-08-01 06:49:21
        /// </summary>
        public string TimeStamp { get; set; }
        /// <summary>
        /// 签名
        /// </summary>
        public string Signature { get; set; }
        /// <summary>
        /// 版本号默认1.0
        /// </summary>
        public string V { get; set; }
        /// <summary>
        /// 所有请求业务参数
        /// </summary>
        public string Biz_Content { get; set; }
    }
}

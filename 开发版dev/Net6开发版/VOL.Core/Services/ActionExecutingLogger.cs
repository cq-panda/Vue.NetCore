using Microsoft.AspNetCore.Http;
using System;
using System.Collections.Generic;
using System.Text;

namespace VOL.Core.Services
{
   public class ActionObserver
    {
        //public ActionObserver(IHttpContextAccessor httpContextAccessor)
        //{
        //    this.RequestDate = DateTime.Now;
        //    this.HttpContext = httpContextAccessor.HttpContext;
        //}
        /// <summary>
        /// 记录action执行的开始时间
        /// </summary>
        public DateTime RequestDate { get; set; }

        /// <summary>
        /// 当前请求是否已经写过日志,防止手动与系统自动重复写日志
        /// </summary>
        public bool IsWrite { get; set; }

        public HttpContext HttpContext { get; }
    }
}

/*
 *接口编写处...
*如果接口需要做Action的权限验证，请在Action上使用属性
*如: [ApiActionPermission("test2019",Enums.ActionPermissionOptions.Search)]
 */
using Microsoft.AspNetCore.Mvc;
using System;
using System.Collections.Generic;
using System.Threading;
using System.Threading.Tasks;
using VOL.Entity.DomainModels;

namespace VOL.AppManager.Controllers
{
    public partial class test2019Controller
    {
        private string datetime = DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss");
        [Route("delay")]
        [HttpPost,HttpGet]
        public ActionResult Delay()
        {
            Thread.Sleep(1000);
            return Content($"显示加载提示：{datetime}");
        }
        [Route("getMsg")]
        [HttpPost, HttpGet]
        public ActionResult GetMsg()
        {
            return Content($"不带加载提示加载数据：{datetime}");
        }
    }
}

/*
 *接口编写处...
*如果接口需要做Action的权限验证，请在Action上使用属性
*如: [ApiActionPermission("App_News",Enums.ActionPermissionOptions.Search)]
 */
using Microsoft.AspNetCore.Mvc;
using System;
using System.Threading.Tasks;
using VOL.Core.DBManager;
using VOL.Core.Enums;
using VOL.Core.Extensions;
using VOL.Core.Filters;
using VOL.Core.Utilities.PDFHelper;
using VOL.Entity.DomainModels;
using Microsoft.AspNetCore.Authorization;
using System.Linq;

namespace VOL.AppManager.Controllers
{
    [Route("api/news")]
    public partial class App_NewsController
    {
        /// <summary>
        /// 生成静态页面
        /// </summary>
        /// <param name="news"></param>
        /// <returns></returns>
        [HttpPost, Route("createPage")]
        [ApiActionPermission("App_News", ActionPermissionOptions.Add)]
        public async Task<IActionResult> CreatePage([FromBody] App_News news)
        {
            return Json(await Service.CreatePage(news));
        }
        /// <summary>
        /// 设置封面图片
        /// </summary>
        /// <param name="news"></param>
        /// <returns></returns>
        [ApiActionPermission("App_News", ActionPermissionOptions.Add)]
        [HttpPost, Route("setCover")]

        public IActionResult SetCover([FromBody] App_News news, string t1, string t2)
        {
            return Json(Service.SetCover(news));
        }
        /// <summary>
        /// 设置封面图片
        /// </summary>
        /// <param name="news"></param>
        /// <returns></returns>
        [ApiActionPermission("App_News", ActionPermissionOptions.Search)]
        [HttpPost, Route("getDemoPageList")]
        public async Task<IActionResult> GetDemoPageList()
        {
            return Json(await Service.GetDemoPageList());
        }

        /// <summary>
        /// 导出PDF
        /// </summary>
        /// <returns></returns>
        [HttpPost, Route("ExportPDF")]
        public ActionResult ExportPDF()
        {
            var content = DBServerProvider.DbContext.Set<App_News>().FirstOrDefault()?.Content;
            var pdf = HttpContext.GetService<IPDFService>();
            var result = pdf.CreatePDF(content);
            return File(result, "application/pdf", $"导出新闻PDF{DateTime.Now:yyyyMMddHHmmsss}.pdf");
        }

    }
}

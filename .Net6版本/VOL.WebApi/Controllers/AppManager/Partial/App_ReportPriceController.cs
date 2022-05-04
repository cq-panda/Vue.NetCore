/*
 *接口编写处...
*如果接口需要做Action的权限验证，请在Action上使用属性
*如: [ApiActionPermission("App_ReportPrice",Enums.ActionPermissionOptions.Search)]
 */
using Microsoft.AspNetCore.Mvc;
using System;
using System.Collections.Generic;
using System.Threading.Tasks;
using VOL.Core.Enums;
using VOL.Core.Filters;
using VOL.Entity.DomainModels;

namespace VOL.AppManager.Controllers
{
    public partial class App_ReportPriceController
    {
        //ApiActionPermission("App_ReportPrice", ActionPermissionOptions.Search)设置查询表的权限，如果不填写只要登陆了都可以查询
        /// <summary>
        /// 获取table1的数据
        /// </summary>
        /// <param name="loadData"></param>
        /// <returns></returns>
        [Route("getTable1Data"),HttpPost, ApiActionPermission("App_ReportPrice", ActionPermissionOptions.Search)]
        public async Task<IActionResult> GetTable1Data([FromBody] PageDataOptions loadData)
        {
            return Json(await Service.GetTable1Data(loadData));
        }

        /// <summary>
        /// 获取table1的数据
        /// </summary>
        /// <param name="loadData"></param>
        /// <returns></returns>
        [Route("getTable2Data"), HttpPost, ApiActionPermission("App_ReportPrice", ActionPermissionOptions.Search)]
        public async Task<IActionResult> GetTable2Data([FromBody] PageDataOptions loadData)
        {
            return Json(await Service.GetTable2Data(loadData));
        }
    }
}

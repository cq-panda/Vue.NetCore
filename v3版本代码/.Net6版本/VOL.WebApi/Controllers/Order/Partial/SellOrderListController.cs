/*
 *接口编写处...
*如果接口需要做Action的权限验证，请在Action上使用属性
*如: [ApiActionPermission("SellOrderList",Enums.ActionPermissionOptions.Search)]
 */
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using System;
using System.Collections.Generic;
using System.Threading.Tasks;
using VOL.Core.Filters;
using VOL.Entity.DomainModels;

namespace VOL.Order.Controllers
{
    public partial class SellOrderListController
    {
        /// <summary>
        /// 导出明细
        /// （重写权限）将子表的权限指向主表权限
        /// </summary>
        /// <param name="loadData"></param>
        /// <returns></returns>
        [ApiActionPermission("SellOrder", Core.Enums.ActionPermissionOptions.Export)]
        [ApiExplorerSettings(IgnoreApi = false)]
        [HttpPost, Route("Export")]
        public override ActionResult Export([FromBody] PageDataOptions loadData)
        {
            return base.Export(loadData);
        }
        /// <summary>
        /// 导入表数据Excel
        ///  （重写权限）将子表的权限指向主表权限
        /// </summary>
        /// <param name="fileInput"></param>
        /// <returns></returns>
        [HttpPost, Route("Import")]
        [ApiActionPermission("SellOrder", Core.Enums.ActionPermissionOptions.Import)]
        [ApiExplorerSettings(IgnoreApi = false)]
        public override ActionResult Import(List<IFormFile> fileInput)
        {
            return base.Import(fileInput);
        }
        /// <summary>
        /// 下载导入Excel模板
        /// （重写权限）将子表的权限指向主表权限
        /// </summary>
        /// <returns></returns>
        [HttpGet, Route("DownLoadTemplate")]
        [ApiActionPermission("SellOrder", Core.Enums.ActionPermissionOptions.Import)]
        [ApiExplorerSettings(IgnoreApi = false)]
        public override ActionResult DownLoadTemplate()
        {
            return base.DownLoadTemplate();
        }
    }
}

/*
 *接口编写处...
*如果接口需要做Action的权限验证，请在Action上使用属性
*如: [ApiActionPermission("Sys_Configuration",Enums.ActionPermissionOptions.Search)]
 */
using Microsoft.AspNetCore.Mvc;
using System.Threading.Tasks;
using VOL.Core.Configuration;
using VOL.Core.Enums;
using VOL.Entity.DomainModels.System;

namespace VOL.System.Controllers
{
    public partial class Sys_ConfigurationController
    {
        [HttpPost, Route("get")]
        public async Task<IActionResult> Get(int id)
        {
            return Json(await Service.GetAsync(id));
        }

        [HttpPost, Route("getConfigList")]
        public IActionResult GetConfigList()
        {
            return Json(Service.GetConfigList());
        }

        [HttpPost, Route("getTableData")]
        public async Task<IActionResult> GetTableDataAsync()
        {
            return Json(await Service.GetTableDataAsync());
        }

        [HttpPost, Route("save")]
        public async Task<IActionResult> Update([FromBody] ConfigInfo configInfo)
        {
            return Json(await Service.UpdateAsync(configInfo));
        }

        [HttpPost, Route("saveExportColumns")]
        public async Task<IActionResult> SaveExportColumns([FromBody] ConfigInfo configInfo)
        {
            return Json(await Service.UpdateExportColumnsAsync(configInfo));
        }

    }
}

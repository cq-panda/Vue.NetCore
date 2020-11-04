/*
 *接口编写处...
*如果接口需要做Action的权限验证，请在Action上使用属性
*如: [ApiActionPermission("Sys_Setting",Enums.ActionPermissionOptions.Search)]
 */
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using System;
using System.Collections.Generic;
using System.Threading.Tasks;
using VOL.Core.Enums;
using VOL.Core.Filters;
using VOL.Entity.DomainModels;

namespace VOL.System.Controllers
{
    [Route("api/setting")]
    public partial class Sys_SettingController
    {
        [HttpPost, Route("save"), ApiActionPermission(ActionRolePermission.SuperAdmin)]
        [ApiActionPermission(ActionPermissionOptions.Add)]
        public async Task<ActionResult> Save([FromBody] Sys_Setting setting)
        {
            return Json(await base.Service.Save(setting));
        }

        [HttpPost, Route("getSystemSetting"), AllowAnonymous]
        public async Task<ActionResult> GetSystemSetting()
        {
            return Json(await base.Service.GetSystemSetting());
        }
    }
}

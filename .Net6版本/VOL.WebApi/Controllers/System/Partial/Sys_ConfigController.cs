/*
 *接口编写处...
*如果接口需要做Action的权限验证，请在Action上使用属性
*如: [ApiActionPermission("Sys_Config",Enums.ActionPermissionOptions.Search)]
 */
using Microsoft.AspNetCore.Mvc;
using System;
using System.Collections.Generic;
using System.Threading.Tasks;
using Microsoft.Extensions.DependencyInjection;
using Microsoft.AspNetCore.Http;
using VOL.Entity.DomainModels;
using VOL.System.IServices;
using Microsoft.AspNetCore.Authorization;
using System.ComponentModel;
using VOL.Core.Const;

namespace VOL.System.Controllers
{
    public partial class Sys_ConfigController
    {
        private readonly ISys_ConfigService _service;//访问业务代码
        private readonly IHttpContextAccessor _httpContextAccessor;

        [ActivatorUtilitiesConstructor]
        public Sys_ConfigController(
            ISys_ConfigService service,
            IHttpContextAccessor httpContextAccessor
        )
        : base(service)
        {
            _service = service;
            _httpContextAccessor = httpContextAccessor;
        }

        /// <summary>
        /// 获取系统信息 🔖
        /// </summary>
        /// <returns></returns>
        [HttpGet, Route("getSysInfo"), AllowAnonymous]
        public async Task<IActionResult> GetSysInfo()
        {
            return Json(await _service.GetSysInfo());
        }
    }

}

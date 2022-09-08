/*
 *接口编写处...
*如果接口需要做Action的权限验证，请在Action上使用属性
*如: [ApiActionPermission("Sys_QuartzOptions",Enums.ActionPermissionOptions.Search)]
 */
using Microsoft.AspNetCore.Mvc;
using System;
using System.Collections.Generic;
using System.Threading.Tasks;
using Microsoft.Extensions.DependencyInjection;
using Microsoft.AspNetCore.Http;
using VOL.Entity.DomainModels;
using VOL.System.IServices;
using VOL.Core.Filters;
using VOL.Core.Enums;

namespace VOL.System.Controllers
{
    public partial class Sys_QuartzOptionsController
    {
        private readonly ISys_QuartzOptionsService _service;//访问业务代码
        private readonly IHttpContextAccessor _httpContextAccessor;

        [ActivatorUtilitiesConstructor]
        public Sys_QuartzOptionsController(
            ISys_QuartzOptionsService service,
            IHttpContextAccessor httpContextAccessor
        )
        : base(service)
        {
            _service = service;
            _httpContextAccessor = httpContextAccessor;
        }

        /// <summary>
        /// api加上属性 [ApiTask]
        /// </summary>
        /// <returns></returns>
        [ApiTask]
        [HttpGet, HttpPost, Route("test")]
        public IActionResult Test()
        {
            return Content(DateTime.Now.ToString("yyyy-MM-dd HH:mm:sss"));
        }

        /// <summary>
        /// api加上属性 [ApiTask]
        /// </summary>
        /// <returns></returns>
        [ApiTask]
        [HttpGet, HttpPost, Route("taskTest")]
        public IActionResult TaskTest()
        {
            return Content(DateTime.Now.ToString("yyyy-MM-dd HH:mm:sss"));
        }



        /// <summary>
        /// 手动执行一次
        /// </summary>
        /// <param name="taskOptions"></param>
        /// <returns></returns>
        [Route("run"), HttpPost]
        [ActionPermission(ActionPermissionOptions.Update)]
        public async Task<object> Run([FromBody] Sys_QuartzOptions taskOptions)
        {
            return await Service.Run(taskOptions);
        }
        /// <summary>
        /// 开启任务
        /// </summary>
        /// <param name="schedulerFactory"></param>
        /// <param name="taskOptions"></param>
        /// <returns></returns>
        [Route("start"), HttpPost]
        [ActionPermission(ActionPermissionOptions.Update)]
        public async Task<object> Start([FromBody] Sys_QuartzOptions taskOptions)
        {
            return await Service.Start(taskOptions);
        }

        /// <summary>
        /// 暂停任务
        /// </summary>
        /// <param name="schedulerFactory"></param>
        /// <param name="taskOptions"></param>
        /// <returns></returns>
        [Route("pause"), HttpPost]
        [ActionPermission(ActionPermissionOptions.Update)]
        public async Task<object> Pause([FromBody] Sys_QuartzOptions taskOptions)
        {
            return await Service.Pause(taskOptions);
        }
    }
}

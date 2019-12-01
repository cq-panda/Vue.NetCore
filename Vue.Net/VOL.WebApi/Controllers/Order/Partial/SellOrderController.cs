/*
 *接口编写处...
*如果接口需要做Action的权限验证，请在Action上使用属性
*如: [ApiActionPermission("SellOrder",Enums.ActionPermissionOptions.Search)]
 */
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Linq.Expressions;
using System.Reflection;
using VOL.Core.Filters;
using VOL.Entity.DomainModels;
using VOL.Order.Repositories;

namespace VOL.Order.Controllers
{
    public partial class SellOrderController
    {
        [HttpPost]
        [ApiActionPermission("SellOrder", Core.Enums.ActionPermissionOptions.Search)]
        [Route("getServiceDate"),FixedToken]//FixedToken请求此接口只要token合法就能能过//AllowAnonymous
        public IActionResult GetServiceDate()
        {
            return Content(Service.GetServiceDate());
        }
    }
}

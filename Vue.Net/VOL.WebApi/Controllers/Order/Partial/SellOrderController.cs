/*
 *接口编写处...
*如果接口需要做Action的权限验证，请在Action上使用属性
*如: [ApiActionPermission("SellOrder",Enums.ActionPermissionOptions.Search)]
 */
using Microsoft.AspNetCore.Mvc;
using VOL.Core.Filters;

namespace VOL.Order.Controllers
{
    public partial class SellOrderController
    {
        [HttpPost]
        [ApiActionPermission("SellOrder", Core.Enums.ActionPermissionOptions.Search)]
        [Route("getServiceDate")]
        public IActionResult GetServiceDate()
        {
            return Content(Service.GetServiceDate());
        }
    }
}

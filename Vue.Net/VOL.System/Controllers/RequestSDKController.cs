
using VOL.System.IServices;
using VOL.Core.Enums;
using VOL.Core.Filters;
using VOL.Core.ManageUser;
using VOL.Core.Utilities;
using VOL.Entity.DomainModels;
using Microsoft.AspNetCore.Mvc;

namespace VOL.System.Controllers
{
    /// <summary>
    /// 通用请求SDK方法
    /// </summary>
    public class RequestSDKController : Controller
    {

        public RequestSDKController(ISys_MenuService service)
        {

        }
        /// <summary>
        /// 只有编辑或新增权限的人才可进行此操作
        /// </summary>
        /// <returns></returns>
        [ActionPermission("", ActionPermissionOptions.Update | ActionPermissionOptions.Add)]
        public IActionResult GetBceSTS()
        {
            (bool, string) result = BeefSDKRequest.GetBaiduBceSTS();
            if (!result.Item1)
            {
                return Json(new { Status = false });
            }
            return Content(result.Item2);
        }

    }
}

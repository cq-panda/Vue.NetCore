/*
 *接口编写处...
*如果接口需要做Action的权限验证，请在Action上使用属性
*如: [ApiActionPermission("App_Transaction",Enums.ActionPermissionOptions.Search)]
 */
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using System;
using System.Collections.Generic;
using System.Threading.Tasks;
using VOL.Core.Filters;
using VOL.Entity.DomainModels;

namespace VOL.AppManager.Controllers
{
    public partial class App_TransactionController
    {
        [ApiActionPermission()]
        [HttpPost, Route("GetPageData"), AllowAnonymous]
        public override ActionResult GetPageData([FromBody] PageDataOptions loadData)
        {
            return base.GetPageData(loadData);
        }
    }
}

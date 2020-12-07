/*
 *接口编写处...
*如果接口需要做Action的权限验证，请在Action上使用属性
*如: [ApiActionPermission("Personal",Enums.ActionPermissionOptions.Search)]
 */
using Microsoft.AspNetCore.Mvc;
using System;
using System.Collections.Generic;
using System.Threading.Tasks;
using VOL.Entity.DomainModels;

namespace Business.Controllers
{
    public partial class PersonalController
    {
    }
}

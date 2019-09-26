/*
 *代码由框架生成,任何更改都可能导致被代码生成器覆盖
 *如果要增加方法请在当前目录下Partial文件夹vProvinceCityController编写
 */
using Microsoft.AspNetCore.Mvc;
using VOL.AppManager.IServices;
using VOL.Core.Controllers.Basic;
using VOL.Entity.AttributeManager;

namespace VOL.AppManager.Controllers
{
    [Route("api/vProvinceCity")]
    [PermissionTable(Name = "vProvinceCity")]
    public partial class vProvinceCityController : ApiBaseController<IvProvinceCityService>
    {
        public vProvinceCityController(IvProvinceCityService service)
        : base("AppManager","App","vProvinceCity", service)
        {
        }
    }
}


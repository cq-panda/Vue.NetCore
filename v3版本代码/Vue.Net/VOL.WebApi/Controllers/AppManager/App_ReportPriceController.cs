/*
 *代码由框架生成,任何更改都可能导致被代码生成器覆盖
 *如果要增加方法请在当前目录下Partial文件夹App_ReportPriceController编写
 */
using Microsoft.AspNetCore.Mvc;
using VOL.Core.Controllers.Basic;
using VOL.Entity.AttributeManager;
using VOL.AppManager.IServices;
namespace VOL.AppManager.Controllers
{
    [Route("api/App_ReportPrice")]
    [PermissionTable(Name = "App_ReportPrice")]
    public partial class App_ReportPriceController : ApiBaseController<IApp_ReportPriceService>
    {
        public App_ReportPriceController(IApp_ReportPriceService service)
        : base(service)
        {
        }
    }
}


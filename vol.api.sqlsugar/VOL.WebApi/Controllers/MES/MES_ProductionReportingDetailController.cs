/*
 *代码由框架生成,任何更改都可能导致被代码生成器覆盖
 *如果要增加方法请在当前目录下Partial文件夹MES_ProductionReportingDetailController编写
 */
using Microsoft.AspNetCore.Mvc;
using VOL.Core.Controllers.Basic;
using VOL.Entity.AttributeManager;
using VOL.MES.IServices;
namespace VOL.MES.Controllers
{
    [Route("api/MES_ProductionReportingDetail")]
    [PermissionTable(Name = "MES_ProductionReportingDetail")]
    public partial class MES_ProductionReportingDetailController : ApiBaseController<IMES_ProductionReportingDetailService>
    {
        public MES_ProductionReportingDetailController(IMES_ProductionReportingDetailService service)
        : base(service)
        {
        }
    }
}


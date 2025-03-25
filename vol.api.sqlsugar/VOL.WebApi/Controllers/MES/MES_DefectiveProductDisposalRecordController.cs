/*
 *代码由框架生成,任何更改都可能导致被代码生成器覆盖
 *如果要增加方法请在当前目录下Partial文件夹MES_DefectiveProductDisposalRecordController编写
 */
using Microsoft.AspNetCore.Mvc;
using VOL.Core.Controllers.Basic;
using VOL.Entity.AttributeManager;
using VOL.MES.IServices;
namespace VOL.MES.Controllers
{
    [Route("api/MES_DefectiveProductDisposalRecord")]
    [PermissionTable(Name = "MES_DefectiveProductDisposalRecord")]
    public partial class MES_DefectiveProductDisposalRecordController : ApiBaseController<IMES_DefectiveProductDisposalRecordService>
    {
        public MES_DefectiveProductDisposalRecordController(IMES_DefectiveProductDisposalRecordService service)
        : base(service)
        {
        }
    }
}


/*
 *代码由框架生成,任何更改都可能导致被代码生成器覆盖
 *如果要增加方法请在当前目录下Partial文件夹MES_EquipmentFaultRecordController编写
 */
using Microsoft.AspNetCore.Mvc;
using VOL.Core.Controllers.Basic;
using VOL.Entity.AttributeManager;
using VOL.MES.IServices;
namespace VOL.MES.Controllers
{
    [Route("api/MES_EquipmentFaultRecord")]
    [PermissionTable(Name = "MES_EquipmentFaultRecord")]
    public partial class MES_EquipmentFaultRecordController : ApiBaseController<IMES_EquipmentFaultRecordService>
    {
        public MES_EquipmentFaultRecordController(IMES_EquipmentFaultRecordService service)
        : base(service)
        {
        }
    }
}


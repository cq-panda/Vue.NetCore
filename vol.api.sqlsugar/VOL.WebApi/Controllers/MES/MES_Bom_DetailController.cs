/*
 *代码由框架生成,任何更改都可能导致被代码生成器覆盖
 *如果要增加方法请在当前目录下Partial文件夹MES_Bom_DetailController编写
 */
using Microsoft.AspNetCore.Mvc;
using VOL.Core.Controllers.Basic;
using VOL.Entity.AttributeManager;
using VOL.MES.IServices;
namespace VOL.MES.Controllers
{
    [Route("api/MES_Bom_Detail")]
    [PermissionTable(Name = "MES_Bom_Detail")]
    public partial class MES_Bom_DetailController : ApiBaseController<IMES_Bom_DetailService>
    {
        public MES_Bom_DetailController(IMES_Bom_DetailService service)
        : base(service)
        {
        }
    }
}


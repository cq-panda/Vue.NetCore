/*
 *代码由框架生成,任何更改都可能导致被代码生成器覆盖
 *如果要增加方法请在当前目录下Partial文件夹MES_MaterialCatalogController编写
 */
using Microsoft.AspNetCore.Mvc;
using VOL.Core.Controllers.Basic;
using VOL.Entity.AttributeManager;
using VOL.MES.IServices;
namespace VOL.MES.Controllers
{
    [Route("api/MES_MaterialCatalog")]
    [PermissionTable(Name = "MES_MaterialCatalog")]
    public partial class MES_MaterialCatalogController : ApiBaseController<IMES_MaterialCatalogService>
    {
        public MES_MaterialCatalogController(IMES_MaterialCatalogService service)
        : base(service)
        {
        }
    }
}


/*
 *代码由框架生成,任何更改都可能导致被代码生成器覆盖
 *如果要增加方法请在当前目录下Partial文件夹Sys_DictionaryListController编写
 */
using Microsoft.AspNetCore.Mvc;
using VOL.Core.Controllers.Basic;
using VOL.Entity.AttributeManager;
using VOL.System.IServices;
namespace VOL.System.Controllers
{
    [Route("api/Sys_DictionaryList")]
    [PermissionTable(Name = "Sys_DictionaryList")]
    [ApiExplorerSettings(GroupName = "字典明细管理_SysDictionaryList")]
    public partial class Sys_DictionaryListController : ApiBaseController<ISys_DictionaryListService>
    {
        public Sys_DictionaryListController(ISys_DictionaryListService service)
        : base(service)
        {
        }
    }
}


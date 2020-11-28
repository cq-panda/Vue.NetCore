/*
 *代码由框架生成,任何更改都可能导致被代码生成器覆盖
 *如果要增加方法请在当前目录下Partial文件夹Sys_ConfigurationController编写
 */
using Microsoft.AspNetCore.Mvc;
using VOL.Core.Controllers.Basic;
using VOL.Entity.AttributeManager;
using VOL.System.IServices;
namespace VOL.System.Controllers
{
    [Route("api/Sys_Configuration")]
    [PermissionTable(Name = "Sys_Configuration")]
    public partial class Sys_ConfigurationController : ApiBaseController<ISys_ConfigurationService>
    {
        public Sys_ConfigurationController(ISys_ConfigurationService service)
        : base(service)
        {
        }
    }
}


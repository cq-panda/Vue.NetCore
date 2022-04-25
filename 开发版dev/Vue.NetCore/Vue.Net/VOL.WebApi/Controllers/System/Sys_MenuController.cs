using Microsoft.AspNetCore.Mvc;
using System.Threading.Tasks;
using VOL.Core.Controllers.Basic;
using VOL.Core.Enums;
using VOL.Core.Filters;
using VOL.Entity.DomainModels;
using VOL.System.IServices;

namespace VOL.System.Controllers
{
    [Route("api/menu")]
    [ApiController, JWTAuthorize()]
    [ApiExplorerSettings(GroupName = "菜单管理_SysMenu")]
    public partial class Sys_MenuController : ApiBaseController<ISys_MenuService>
    {
        private ISys_MenuService _service { get; set; }
        public Sys_MenuController(ISys_MenuService service) :
            base("System", "System", "Sys_Menu", service)
        {
            _service = service;
        } 
    }
}

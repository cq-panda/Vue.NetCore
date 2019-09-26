
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using System.Threading.Tasks;
using VOL.Core.Controllers.Basic;
using VOL.Entity.AttributeManager;
using VOL.Entity.DomainModels;
using VOL.System.IServices;

namespace VOL.System.Controllers
{
    [Route("api/Sys_User")]
    [PermissionTable(Name = "Sys_User")]
    public partial class Sys_UserController : ApiBaseController<ISys_UserService>
    {
        public Sys_UserController(ISys_UserService service)
        : base("System", "System", "Sys_User", service)
        {
            
        }
    }
}

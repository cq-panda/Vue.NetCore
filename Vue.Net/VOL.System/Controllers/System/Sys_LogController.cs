using System;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using VOL.System.IServices;
using VOL.Core.Controllers.Basic;
using Microsoft.AspNetCore.Mvc;

namespace VOL.System.Controllers
{
    public partial class Sys_LogController : WebBaseController<ISys_LogService>
    {
        public Sys_LogController(ISys_LogService service)
        : base("System","System","Sys_Log", service)
        {
        }
    }
}


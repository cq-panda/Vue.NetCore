using Microsoft.AspNetCore.Mvc;
using System.Threading.Tasks;
using VOL.Core.Controllers.Basic;
using VOL.Core.Extensions;
using VOL.Core.Filters;
using VOL.System.IServices;

namespace VOL.System.Controllers
{
    [Route("api/Sys_Dictionary")]
    [ApiExplorerSettings(GroupName = "字典管理_SysDictionary")]
    public partial class Sys_DictionaryController : ApiBaseController<ISys_DictionaryService>
    {
        public Sys_DictionaryController(ISys_DictionaryService service)
        : base("System", "System", "Sys_Dictionary", service)
        {
        }
    }
}

using Microsoft.AspNetCore.Mvc;
using System.Threading.Tasks;
using VOL.Core.Controllers.Basic;
using VOL.Core.Extensions;
using VOL.Core.Filters;
using VOL.System.IServices;

namespace VOL.System.Controllers
{
    public partial class Sys_DictionaryController
    {
        [HttpPost, Route("GetVueDictionary")]
        [ApiActionPermission()]
        public async Task<IActionResult> GetVueDictionary([FromBody]string[] dicNos)
        {
            return Content((await Service.GetVueDictionary(dicNos)).Serialize());
        }

        /// <summary>
        /// 代码生成器获取所有字典项(超级管理权限)
        /// </summary>
        /// <returns></returns>
        [HttpPost, Route("GetBuilderDictionary")]
        [ApiActionPermission(ActionRolePermission.SuperAdmin|ActionRolePermission.Admin)]
        public async Task<IActionResult> GetBuilderDictionary()
        {
            return Json(await Service.GetBuilderDictionary());
        }
    }
}

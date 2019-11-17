using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using System.Collections.Generic;
using System.Threading.Tasks;
using VOL.Core.Extensions;
using VOL.Core.Filters;
using VOL.Core.Utilities;
using VOL.Entity.DomainModels;

namespace VOL.Core.Controllers.Basic
{
    [JWTAuthorize]
    public class ApiBaseController<IServiceBase> : BaseController<IServiceBase>
    {
        public ApiBaseController(IServiceBase service)
       : base(service)
        {
        }
        public ApiBaseController(string projectName, string folder, string tablename, IServiceBase service)
        : base(projectName, folder, tablename, service)
        {
        }

        [ApiActionPermission(Enums.ActionPermissionOptions.Search)]
        [HttpPost, Route("GetPageData")]
        public new async Task<ActionResult> GetPageData([FromBody] PageDataOptions loadData)
        {
            return await base.GetPageData(loadData);
        }

        /// <summary>
        /// 获取明细grid分页数据
        /// </summary>
        /// <param name="loadData"></param>
        /// <returns></returns>
        [ApiActionPermission(Enums.ActionPermissionOptions.Search)]
        [HttpPost, Route("GetDetailPage")]
        public new async Task<ActionResult> GetDetailPage([FromBody] PageDataOptions loadData)
        {
            return await base.GetDetailPage(loadData);
        }

        /// <summary>
        /// 上传文件
        /// </summary>
        /// <param name="fileInput"></param>
        /// <returns></returns>
        [HttpPost, Route("Upload")]
        [ApiActionPermission(Enums.ActionPermissionOptions.Upload)]
        public new async Task<IActionResult> Upload(List<IFormFile> fileInput)
        {
            return await base.Upload(fileInput);
        }

        /// <summary>
        /// 下载导入Excel模板
        /// </summary>
        /// <returns></returns>
        [HttpGet, Route("DownLoadTemplate")]
        [ApiActionPermission(Enums.ActionPermissionOptions.Import)]
        public new async Task<ActionResult> DownLoadTemplate()
        {
            return await base.DownLoadTemplate();
        }

        /// <summary>
        /// 导入表数据Excel
        /// </summary>
        /// <param name="fileInput"></param>
        /// <returns></returns>
        [HttpPost, Route("Import")]
        [ApiActionPermission(Enums.ActionPermissionOptions.Import)]
        public new async Task<ActionResult> Import(List<IFormFile> fileInput)
        {
            return await base.Import(fileInput);
        }

        /// <summary>
        /// 导出文件，返回日期+文件名
        /// </summary>
        /// <param name="loadData"></param>
        /// <returns></returns>
        [ApiActionPermission(Enums.ActionPermissionOptions.Export)]
        [HttpPost, Route("Export")]
        public new async Task<ActionResult> Export([FromBody] PageDataOptions loadData)
        {
            return await base.Export(loadData);
        }
        /// <summary>
        /// 下载文件
        /// </summary>
        /// <param name="fileName"></param>
        /// <returns></returns>
        [ApiActionPermission(Enums.ActionPermissionOptions.Export)]
        [HttpGet, Route("DownLoadFile")]
        public new IActionResult DownLoadFile(string path)
        {
            return base.DownLoadFile(path);
        }

        /// <summary>
        /// 通过key删除文件
        /// </summary>
        /// <param name="keys"></param>
        /// <returns></returns>
        [ApiActionPermission(Enums.ActionPermissionOptions.Delete)]
        [HttpPost, Route("Del")]
        public new async Task<ActionResult> Del([FromBody] object[] keys)
        {
            return await base.Del(keys);
        }
        /// <summary>
        /// 审核
        /// </summary>
        /// <param name="keys"></param>
        /// <returns></returns>
        [ApiActionPermission(Enums.ActionPermissionOptions.Audit)]
        [HttpPost, Route("Audit")]
        public new async Task<ActionResult> Audit([FromBody]object[] id, int? auditStatus, string auditReason)
        {
            return await base.Audit(id, auditStatus, auditReason);
        }
        /// <summary>
        /// 新增支持主子表
        /// </summary>
        /// <param name="saveDataModel"></param>
        /// <returns></returns>
        [ApiActionPermission(Enums.ActionPermissionOptions.Add)]
        [HttpPost, Route("Add")]
        public new async Task<ActionResult> Add([FromBody]SaveModel saveModel)
        {
            WebResponseContent responseContent = await base.Add(saveModel);
            responseContent.Data = responseContent.Data?.Serialize();
            return Json(responseContent);
        }
        /// <summary>
        /// 编辑支持主子表
        /// [ModelBinder(BinderType =(typeof(ModelBinder.BaseModelBinder)))]可指定绑定modelbinder
        /// </summary>
        /// <param name="saveDataModel"></param>
        /// <returns></returns>
        [ApiActionPermission(Enums.ActionPermissionOptions.Update)]
        [HttpPost, Route("Update")]
        public new async Task<ActionResult> Update([FromBody] SaveModel saveModel)
        {
            WebResponseContent responseContent = await base.Update(saveModel);
            responseContent.Data = responseContent.Data?.Serialize();
            return Json(responseContent);
        }
    }
}

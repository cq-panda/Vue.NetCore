using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using System.Collections.Generic;
using System.IO;
using System.Threading.Tasks;
using VOL.Core.Enums;
using VOL.Core.Extensions;
using VOL.Core.Filters;
using VOL.Core.Middleware;
using VOL.Core.Services;
using VOL.Core.Utilities;
using VOL.Entity.DomainModels;

namespace VOL.Core.Controllers.Basic
{
    [JWTAuthorize, ApiController]
    public class ApiBaseController<IServiceBase> : VolController
    {
        protected IServiceBase Service;
        private WebResponseContent _baseWebResponseContent { get; set; }
        public ApiBaseController()
        {
        }
        public ApiBaseController(IServiceBase service)
        {
            Service = service;
        }
        public ApiBaseController(string projectName, string folder, string tablename, IServiceBase service)
        {
            Service = service;
        }
        [ActionLog("查询")]
        [ApiActionPermission(ActionPermissionOptions.Search)]
        [HttpPost, Route("getPageData")]
        public virtual ActionResult GetPageData([FromBody] PageDataOptions loadData)
        {
            return JsonNormal(InvokeService("GetPageData", [loadData]));
        }
        [ActionLog("查询")]
        [ApiActionPermission(ActionPermissionOptions.Search)]
        [HttpPost, Route("getPageDataAsync")]
        [ApiExplorerSettings(IgnoreApi = true)]
        public virtual async Task<ActionResult> GetPageDataAsync([FromBody] PageDataOptions loadData)
        {
            dynamic task = InvokeService("GetPageDataAsync", [loadData]);
            return JsonNormal(await task);
        }
        /// <summary>
        /// 获取明细分页数据
        /// </summary>
        /// <param name="loadData"></param>
        /// <returns></returns>
        [ActionLog("明细查询")]
        [ApiActionPermission(ActionPermissionOptions.Search)]
        [HttpPost, Route("GetDetailPage")]
        [ApiExplorerSettings(IgnoreApi = true)]
        public virtual ActionResult GetDetailPage([FromBody] PageDataOptions loadData)
        {
            return JsonNormal(InvokeService("GetDetailPage", [loadData]));
        }
        /// <summary>
        /// 获取明细分页数据
        /// </summary>
        /// <param name="loadData"></param>
        /// <returns></returns>
        [ActionLog("明细查询")]
        [ApiActionPermission(ActionPermissionOptions.Search)]
        [HttpPost, Route("getDetailPageAsync")]
        [ApiExplorerSettings(IgnoreApi = true)]
        public virtual async Task<ActionResult> GetDetailPageAsync([FromBody] PageDataOptions loadData)
        {
            dynamic task = InvokeService("GetDetailPageAsync", [loadData]);
            return JsonNormal(await task);
        }
        /// <summary>
        /// 上传文件
        /// </summary>
        /// <param name="fileInput"></param>
        /// <returns></returns>
        [ActionLog("上传文件")]
        [HttpPost, Route("Upload")]
        [ApiActionPermission(ActionPermissionOptions.Upload | ActionPermissionOptions.Add | ActionPermissionOptions.Update)]
        [ApiExplorerSettings(IgnoreApi = true)]
        public virtual IActionResult Upload(IEnumerable<IFormFile> fileInput)
        {
            return Json(InvokeService("Upload", [fileInput]));
        }
        [ActionLog("上传文件")]
        [HttpPost, Route("uploadAsync")]
        [ApiActionPermission(ActionPermissionOptions.Upload | ActionPermissionOptions.Add | ActionPermissionOptions.Update)]
        [ApiExplorerSettings(IgnoreApi = true)]
        public virtual async Task<IActionResult> UploadAsync(IEnumerable<IFormFile> fileInput)
        {
            var res = await (InvokeService("UploadAsync", [fileInput]) as Task<WebResponseContent>);
            return Json(res);
        }
        /// <summary>
        /// 下载导入Excel模板
        /// </summary>
        /// <returns></returns>
        [ActionLog("下载导入Excel模板")]
        [HttpGet, Route("DownLoadTemplate")]
        [ApiActionPermission(ActionPermissionOptions.Import)]
        [ApiExplorerSettings(IgnoreApi = true)]
        public virtual ActionResult DownLoadTemplate()
        {
            _baseWebResponseContent = InvokeService("DownLoadTemplate", []) as WebResponseContent;
            return GetFile();
        }
        [ActionLog("下载导入Excel模板")]
        [HttpGet, Route("downLoadTemplateAsync")]
        [ApiActionPermission(ActionPermissionOptions.Import)]
        [ApiExplorerSettings(IgnoreApi = true)]
        public virtual async Task<ActionResult> DownLoadTemplateAsync()
        {
            _baseWebResponseContent = await (InvokeService("DownLoadTemplateAsync", []) as Task<WebResponseContent>);
            return GetFile();
        }
        private ActionResult GetFile()
        {
            if (!_baseWebResponseContent.Status) return Json(_baseWebResponseContent);
            byte[] bytes = _baseWebResponseContent.Data is byte[]? (byte[])_baseWebResponseContent.Data
                : System.IO.File.ReadAllBytes(_baseWebResponseContent.Data.ToString());
            return File(bytes, System.Net.Mime.MediaTypeNames.Application.Octet, Path.GetFileName(_baseWebResponseContent.Data.ToString()));
        }
        /// <summary>
        /// 导入表数据Excel
        /// </summary>
        /// <param name="fileInput"></param>
        /// <returns></returns>
        [ActionLog("导入Excel")]
        [HttpPost, Route("Import")]
        [ApiActionPermission(ActionPermissionOptions.Import)]
        [ApiExplorerSettings(IgnoreApi = true)]
        public virtual ActionResult Import(List<IFormFile> fileInput)
        {
            var res = InvokeService("Import", [fileInput]) as WebResponseContent;
            if (!res.Status) return Json(res);
            return JsonNormal(new { status = res.Status, code = res.Code, data = res.Data });
        }
        [ActionLog("导入Excel")]
        [HttpPost, Route("importAsync")]
        [ApiActionPermission(ActionPermissionOptions.Import)]
        [ApiExplorerSettings(IgnoreApi = true)]
        public virtual async Task<ActionResult> ImportAsync(List<IFormFile> fileInput)
        {
            var res = await (InvokeService("ImportAsync", [fileInput]) as Task<WebResponseContent>);
            if (!res.Status) return Json(res);
            return JsonNormal(new { status = res.Status, code = res.Code, data = res.Data });
        }

        /// <summary>
        /// 导出文件，返回日期+文件名
        /// </summary>
        /// <param name="loadData"></param>
        /// <returns></returns>
        [ActionLog("导出Excel")]
        [ApiActionPermission(ActionPermissionOptions.Export)]
        [ApiExplorerSettings(IgnoreApi = true)]
        [HttpPost, Route("Export")]
        public virtual ActionResult Export([FromBody] PageDataOptions loadData)
        {
            _baseWebResponseContent = InvokeService("Export", [loadData]) as WebResponseContent;
            return GetExportFile();
        }
        [ActionLog("导出Excel")]
        [ApiActionPermission(ActionPermissionOptions.Export)]
        [ApiExplorerSettings(IgnoreApi = true)]
        [HttpPost, Route("exportAsync")]
        public virtual async Task<ActionResult> ExportAsync([FromBody] PageDataOptions loadData)
        {
            _baseWebResponseContent = await (InvokeService("ExportAsync", [loadData]) as Task<WebResponseContent>);
            return GetExportFile();
        }
        private FileContentResult GetExportFile()
        {
            byte[] bytes = _baseWebResponseContent.Data is byte[]? (byte[])_baseWebResponseContent.Data
             : System.IO.File.ReadAllBytes(_baseWebResponseContent.Data.ToString().MapPath());
            return File(bytes, System.Net.Mime.MediaTypeNames.Application.Octet, "export.xlsx");
        }

        /// <summary>
        /// 通过key删除文件
        /// </summary>
        /// <param name="keys"></param>
        /// <returns></returns>
       // [ActionLog("删除")]
        [ApiActionPermission(ActionPermissionOptions.Delete)]
        [HttpPost, Route("Del")]
        [ApiExplorerSettings(IgnoreApi = true)]
        public virtual ActionResult Del([FromBody] object[] keys)
        {
            _baseWebResponseContent = InvokeService("Del", [keys, true]) as WebResponseContent;
            Logger.Info(LoggerType.Del, keys.Serialize(), _baseWebResponseContent.Status ? "Ok" : _baseWebResponseContent.Message);
            return Json(_baseWebResponseContent);
        }
        //[ActionLog("删除")]
        [ApiActionPermission(ActionPermissionOptions.Delete)]
        [HttpPost, Route("delAsync")]
        [ApiExplorerSettings(IgnoreApi = true)]
        public virtual async Task<ActionResult> DelAsync([FromBody] object[] keys)
        {
            _baseWebResponseContent = await (InvokeService("DelAsync", [keys, true]) as Task<WebResponseContent>);
            Logger.Info(LoggerType.Del, keys.Serialize(), _baseWebResponseContent.Status ? "Ok" : _baseWebResponseContent.Message);
            return Json(_baseWebResponseContent);
        }
        /// <summary>
        /// 审核
        /// </summary>
        /// <param name="keys"></param>
        /// <returns></returns>
        /// [ActionLog("审核")]
        [ApiActionPermission(ActionPermissionOptions.Audit)]
        [HttpPost, Route("Audit")]
        [ApiExplorerSettings(IgnoreApi = true)]
        public virtual ActionResult Audit([FromBody] object[] id, int? auditStatus, string auditReason)
        {
            _baseWebResponseContent = InvokeService("Audit", [id, auditStatus, auditReason]) as WebResponseContent;
            string msg = _baseWebResponseContent.Status ? ("Ok") : _baseWebResponseContent.Message;
            Logger.Info($"审核：{id?.Serialize() + "," + (auditStatus ?? -1) + "," + auditReason};{msg}");
            return Json(_baseWebResponseContent);
        }
        [ApiActionPermission(ActionPermissionOptions.Audit)]
        [HttpPost, Route("auditAsync")]
        [ApiExplorerSettings(IgnoreApi = true)]
        public virtual async Task<ActionResult> AuditAsync([FromBody] object[] id, int? auditStatus, string auditReason)
        {
            _baseWebResponseContent = await (InvokeService("AuditAsync", [id, auditStatus, auditReason]) as Task<WebResponseContent>);
            string msg = _baseWebResponseContent.Status ? ("Ok") : _baseWebResponseContent.Message;
            Logger.Info($"审核：{id?.Serialize() + "," + (auditStatus ?? -1) + "," + auditReason};{msg}");
            return Json(_baseWebResponseContent);
        }

        /// <summary>
        /// 反审核
        /// </summary>
        [ApiActionPermission(ActionPermissionOptions.Audit)]
        [HttpPost, Route("antiAudit")]
        [ApiExplorerSettings(IgnoreApi = true)]
        public virtual ActionResult AntiAudit([FromBody] AntiData antiData)
        {
            _baseWebResponseContent = InvokeService("AntiAudit", [antiData]) as WebResponseContent;
            string msg = _baseWebResponseContent.Status ? ("Ok") : _baseWebResponseContent.Message;
            Logger.Info($"反审核：{antiData.Serialize()};{msg}");
            return Json(_baseWebResponseContent);
        }

        [ApiActionPermission(ActionPermissionOptions.Audit)]
        [HttpPost, Route("antiAuditAsync")]
        [ApiExplorerSettings(IgnoreApi = true)]
        public virtual async Task<ActionResult> AntiAuditAsync([FromBody] AntiData antiData)
        {
            _baseWebResponseContent = await (InvokeService("AntiAuditAsync", [antiData]) as Task<WebResponseContent>);
            string msg = _baseWebResponseContent.Status ? ("Ok") : _baseWebResponseContent.Message;
            Logger.Info($"反审核：{antiData.Serialize()};{msg}");
            return Json(_baseWebResponseContent);
        }

        /// <summary>
        /// 新增支持主子表
        /// </summary>
        /// <param name="saveDataModel"></param>
        /// <returns></returns>
        [ActionLog("新建")]
        [ApiActionPermission(ActionPermissionOptions.Add)]
        [HttpPost, Route("Add")]
        [ApiExplorerSettings(IgnoreApi = true)]
        public virtual ActionResult Add([FromBody] SaveModel saveModel)
        {
            _baseWebResponseContent = InvokeService("Add", [saveModel]) as WebResponseContent;
            WriteLog(LoggerType.Add);
            _baseWebResponseContent.Data = _baseWebResponseContent.Data?.Serialize();
            return Json(_baseWebResponseContent);
        }
        [ActionLog("新建")]
        [ApiActionPermission(ActionPermissionOptions.Add)]
        [HttpPost, Route("addAsync")]
        [ApiExplorerSettings(IgnoreApi = true)]
        public virtual async Task<ActionResult> AddAsync([FromBody] SaveModel saveModel)
        {
            _baseWebResponseContent = await (InvokeService("AddAsync", [saveModel]) as Task<WebResponseContent>);
            WriteLog(LoggerType.Add);
            _baseWebResponseContent.Data = _baseWebResponseContent.Data?.Serialize();
            return Json(_baseWebResponseContent);
        }
        /// <summary>
        /// 编辑支持主子表
        /// [ModelBinder(BinderType =(typeof(ModelBinder.BaseModelBinder)))]可指定绑定modelbinder
        /// </summary>
        /// <param name="saveDataModel"></param>
        /// <returns></returns>
        [ActionLog("编辑")]
        [ApiActionPermission(ActionPermissionOptions.Update)]
        [HttpPost, Route("Update")]
        [ApiExplorerSettings(IgnoreApi = true)]
        public virtual ActionResult Update([FromBody] SaveModel saveModel)
        {
            _baseWebResponseContent = InvokeService("Update", [saveModel]) as WebResponseContent;
            WriteLog(LoggerType.Edit);
            _baseWebResponseContent.Data = _baseWebResponseContent.Data?.Serialize();
            return Json(_baseWebResponseContent);
        }
        [ActionLog("编辑")]
        [ApiActionPermission(ActionPermissionOptions.Update)]
        [HttpPost, Route("updateAsync")]
        [ApiExplorerSettings(IgnoreApi = true)]
        public virtual async Task<ActionResult> UpdateAsync([FromBody] SaveModel saveModel)
        {
            _baseWebResponseContent = await (InvokeService("UpdateAsync", [saveModel]) as Task<WebResponseContent>);
            WriteLog(LoggerType.Edit);
            _baseWebResponseContent.Data = _baseWebResponseContent.Data?.Serialize();
            return Json(_baseWebResponseContent);
        }
        private void WriteLog(LoggerType loggerType)
        {
            Logger.Info(loggerType, null, _baseWebResponseContent.Status ? "Ok" : _baseWebResponseContent.Message);
        }
        /// <summary>
        /// 调用service方法
        /// </summary>
        /// <param name="methodName"></param>
        /// <param name="parameters"></param>
        /// <returns></returns>
        private object InvokeService(string methodName, object[] parameters)
        {
            return Service.GetType().GetMethod(methodName).Invoke(Service, parameters);
        }
    }
}

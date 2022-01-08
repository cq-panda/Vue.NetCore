using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Threading.Tasks;
using VOL.Core.Configuration;
using VOL.Core.Extensions;
using VOL.Core.Filters;
using VOL.Core.Services;
using VOL.Core.Utilities;
using VOL.Entity.DomainModels;

namespace VOL.Core.Controllers.Basic
{
    [JWTAuthorize, ApiController]
    public class ApiBaseController<IServiceBase> : Controller
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
        /// <summary>
        /// 2020.11.21增加json原格式返回数据(默认是驼峰格式)
        /// </summary>
        /// <param name="data"></param>
        /// <param name="serializerSettings"></param>
        /// <returns></returns>
        protected JsonResult JsonNormal(object data, JsonSerializerSettings serializerSettings = null)
        {
            serializerSettings = serializerSettings ?? new JsonSerializerSettings();
            serializerSettings.ContractResolver = null;
            return Json(data, serializerSettings);
        }

        [ApiActionPermission(Enums.ActionPermissionOptions.Search)]
        [HttpPost, Route("GetPageData")]
        public virtual ActionResult GetPageData([FromBody] PageDataOptions loadData)
        {
            return Content(InvokeService("GetPageData", new object[] { loadData }).Serialize());
        }

        /// <summary>
        /// 获取明细grid分页数据
        /// </summary>
        /// <param name="loadData"></param>
        /// <returns></returns>
        [ApiActionPermission(Enums.ActionPermissionOptions.Search)]
        [HttpPost, Route("GetDetailPage")]
        [ApiExplorerSettings(IgnoreApi = true)]
        public virtual ActionResult GetDetailPage([FromBody] PageDataOptions loadData)
        {
            return Content(InvokeService("GetDetailPage", new object[] { loadData }).Serialize());
        }

        /// <summary>
        /// 上传文件
        /// </summary>
        /// <param name="fileInput"></param>
        /// <returns></returns>
        [HttpPost, Route("Upload")]
        [ApiActionPermission(Enums.ActionPermissionOptions.Upload)]
        [ApiExplorerSettings(IgnoreApi = true)]
        public virtual IActionResult Upload(IEnumerable<IFormFile> fileInput)
        {
            return Json(InvokeService("Upload", new object[] { fileInput }));
        }
        /// <summary>
        /// 下载导入Excel模板
        /// </summary>
        /// <returns></returns>
        [HttpGet, Route("DownLoadTemplate")]
        [ApiActionPermission(Enums.ActionPermissionOptions.Import)]
        [ApiExplorerSettings(IgnoreApi = true)]
        public virtual ActionResult DownLoadTemplate()
        {
            _baseWebResponseContent = InvokeService("DownLoadTemplate", new object[] { }) as WebResponseContent;
            if (!_baseWebResponseContent.Status) return Json(_baseWebResponseContent);
            byte[] fileBytes = System.IO.File.ReadAllBytes(_baseWebResponseContent.Data.ToString());
            return File(
                    fileBytes,
                    System.Net.Mime.MediaTypeNames.Application.Octet,
                    Path.GetFileName(_baseWebResponseContent.Data.ToString())
                );
        }
        /// <summary>
        /// 导入表数据Excel
        /// </summary>
        /// <param name="fileInput"></param>
        /// <returns></returns>
        [HttpPost, Route("Import")]
        [ApiActionPermission(Enums.ActionPermissionOptions.Import)]
        [ApiExplorerSettings(IgnoreApi = true)]
        public  virtual ActionResult Import(List<IFormFile> fileInput)
        {
            return Json(InvokeService("Import", new object[] { fileInput }));
        }

        /// <summary>
        /// 导出文件，返回日期+文件名
        /// </summary>
        /// <param name="loadData"></param>
        /// <returns></returns>
        [ApiActionPermission(Enums.ActionPermissionOptions.Export)]
        [ApiExplorerSettings(IgnoreApi = true)]
        [HttpPost, Route("Export")]
        public virtual ActionResult Export([FromBody] PageDataOptions loadData)
        {
           var result= InvokeService("Export", new object[] { loadData }) as WebResponseContent;
            return File(
                   System.IO.File.ReadAllBytes(result.Data.ToString().MapPath()),
                   System.Net.Mime.MediaTypeNames.Application.Octet,
                   Path.GetFileName(result.Data.ToString())
               );
        }
        /// <summary>
        /// 2022.01.08移除原来的导出功能
        /// </summary>
        /// <param name="path"></param>
        /// <returns></returns>
        [Obsolete]
        [ApiActionPermission(Enums.ActionPermissionOptions.Export)]
        [HttpGet, Route("DownLoadFile")]
        [ApiExplorerSettings(IgnoreApi = true)]
        public virtual IActionResult DownLoadFile()
        {
            throw new Exception("原导出方法已停用");
            //string path = HttpContext.Request("path");
            //if (string.IsNullOrEmpty(path)) return Content("未找到文件");
            //try
            //{
            //    path = path.IndexOf("/") == -1 && path.IndexOf("\\") == -1 
            //        ?path.DecryptDES(AppSetting.Secret.ExportFile)
            //        : path.MapPath();
            //    return File(
            //            System.IO.File.ReadAllBytes(path), 
            //            System.Net.Mime.MediaTypeNames.Application.Octet, 
            //            Path.GetFileName(path)
            //        );
            //}
            //catch (Exception ex)
            //{
            //    Logger.Error($"文件下载出错:{path}{ex.Message}");
            //}
            //return Content("");
        }

        /// <summary>
        /// 通过key删除文件
        /// </summary>
        /// <param name="keys"></param>
        /// <returns></returns>
        [ApiActionPermission(Enums.ActionPermissionOptions.Delete)]
        [HttpPost, Route("Del")]
        [ApiExplorerSettings(IgnoreApi = true)]
        public virtual ActionResult Del([FromBody] object[] keys)
        {
            _baseWebResponseContent = InvokeService("Del", new object[] { keys, true }) as WebResponseContent;
            Logger.Info(Enums.LoggerType.Del, keys.Serialize(), _baseWebResponseContent.Status ? "Ok" : _baseWebResponseContent.Message);
            return Json(_baseWebResponseContent);
        }
        /// <summary>
        /// 审核
        /// </summary>
        /// <param name="keys"></param>
        /// <returns></returns>
        [ApiActionPermission(Enums.ActionPermissionOptions.Audit)]
        [HttpPost, Route("Audit")]
        [ApiExplorerSettings(IgnoreApi = true)]
        public virtual ActionResult Audit([FromBody] object[] id, int? auditStatus, string auditReason)
        {
            _baseWebResponseContent =InvokeService("Audit", new object[] { id, auditStatus, auditReason }) as WebResponseContent;
            Logger.Info(Enums.LoggerType.Del, id?.Serialize() + "," + (auditStatus ?? -1) + "," + auditReason, _baseWebResponseContent.Status ? "Ok" : _baseWebResponseContent.Message);
            return Json(_baseWebResponseContent);
        }
        /// <summary>
        /// 新增支持主子表
        /// </summary>
        /// <param name="saveDataModel"></param>
        /// <returns></returns>
        [ApiActionPermission(Enums.ActionPermissionOptions.Add)]
        [HttpPost, Route("Add")]
        [ApiExplorerSettings(IgnoreApi = true)]
        public virtual ActionResult Add([FromBody] SaveModel saveModel)
        {
            _baseWebResponseContent =InvokeService("Add", 
                new Type[] { typeof(SaveModel) }, 
                new object[] { saveModel }) as WebResponseContent;
            Logger.Info(Enums.LoggerType.Add, saveModel.Serialize(), _baseWebResponseContent.Status ? "Ok" : _baseWebResponseContent.Message);
            _baseWebResponseContent.Data = _baseWebResponseContent.Data?.Serialize();
            return Json(_baseWebResponseContent);
        }
        /// <summary>
        /// 编辑支持主子表
        /// [ModelBinder(BinderType =(typeof(ModelBinder.BaseModelBinder)))]可指定绑定modelbinder
        /// </summary>
        /// <param name="saveDataModel"></param>
        /// <returns></returns>
        [ApiActionPermission(Enums.ActionPermissionOptions.Update)]
        [HttpPost, Route("Update")]
        [ApiExplorerSettings(IgnoreApi = true)]
        public virtual ActionResult Update([FromBody] SaveModel saveModel)
        {
            _baseWebResponseContent = InvokeService("Update", new object[] { saveModel }) as WebResponseContent;
            Logger.Info(Enums.LoggerType.Edit, saveModel.Serialize(), _baseWebResponseContent.Status ? "Ok" : _baseWebResponseContent.Message);
            _baseWebResponseContent.Data = _baseWebResponseContent.Data?.Serialize();
            return Json(_baseWebResponseContent);
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
        /// <summary>
        /// 调用service方法
        /// </summary>
        /// <param name="methodName"></param>
        /// <param name="types">为要调用重载的方法参数类型：new Type[] { typeof(SaveDataModel)</param>
        /// <param name="parameters"></param>
        /// <returns></returns>
        private object InvokeService(string methodName, Type[] types, object[] parameters)
        {
            return Service.GetType().GetMethod(methodName, types).Invoke(Service, parameters);
        }
    }
}

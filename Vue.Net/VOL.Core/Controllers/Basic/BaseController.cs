using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using System;
using System.Collections.Generic;
using System.IO;
using System.Threading.Tasks;
using VOL.Core.Configuration;
using VOL.Core.Extensions;
using VOL.Core.Services;
using VOL.Core.Utilities;
using VOL.Entity.DomainModels;

namespace VOL.Core.Controllers.Basic
{
    public class BaseController<IServiceBase> : Controller
    {
        protected IServiceBase Service;
        private readonly string projectName;
        private readonly string folder;
        private readonly string TableName;
        private WebResponseContent ResponseContent { get; set; }
        /// <summary>
        /// 
        /// </summary>
        public BaseController()
        {

        }

        public BaseController(string projectName, string folder, string tablename, IServiceBase service)
        {
            this.projectName = projectName;
            this.folder = folder;
            TableName = tablename;
            Service = service;
        }
        /// <summary>
        /// 
        /// </summary>
        /// <returns></returns>
        [ApiExplorerSettings(IgnoreApi = true)]
        public virtual ActionResult Manager()
        {
            if (System.IO.File.Exists(($"Views\\PageExtension\\{projectName }\\{TableName}Extension.cshtml").MapPath()))
            {
                ViewBag.UrlExtension = $"~/Views/PageExtension/{projectName}/{TableName}Extension.cshtml";
            }
            return View("~/Views/" + projectName + "/" + folder + "/" + TableName + ".cshtml");
        }
        [ApiExplorerSettings(IgnoreApi = true)]
        public virtual async Task<ActionResult> GetPageData(PageDataOptions loadData)
        {
            string pageData = await Task.Run(() => InvokeService("GetPageData", new object[] { loadData }).Serialize());
            return Content(pageData);
        }
        [ApiExplorerSettings(IgnoreApi = true)]
        public virtual async Task<ActionResult> GetDetailPage(PageDataOptions loadData)
        {
            string pageData = await Task.Run(() => InvokeService("GetDetailPage", new object[] { loadData }).Serialize());
            return Content(pageData);
        }

        /// <summary>
        /// 上传文件
        /// </summary>
        /// <param name="fileInput"></param>
        /// <returns></returns>
        [ApiExplorerSettings(IgnoreApi = true)]
        public virtual async Task<ActionResult> Upload(List<IFormFile> fileInput)
        {
            object result = await Task.Run(() => InvokeService("Upload", new object[] { fileInput }));
            return Json(result);
        }


        /// <summary>
        /// 导入表数据Excel
        /// </summary>
        /// <param name="fileInput"></param>
        /// <returns></returns>
        [HttpPost]
        public virtual async Task<ActionResult> Import(List<IFormFile> fileInput)
        {
            object result = await Task.Run(() => InvokeService("Import", new object[] { fileInput }));
            return Json(result);
        }


        [ApiExplorerSettings(IgnoreApi = true)]
        public virtual async Task<ActionResult> Export(PageDataOptions loadData)
        {
            return Json(await Task.Run(() => InvokeService("Export", new object[] { loadData })));
        }

        [ApiExplorerSettings(IgnoreApi = true)]
        public virtual ActionResult DownLoadFile(string path)
        {
            if (string.IsNullOrEmpty(path)) return Content("未找到文件");
            try
            {
                path = path.DecryptDES(AppSetting.Secret.ExportFile);
                string fileName = Path.GetFileName(path);
                return File(System.IO.File.ReadAllBytes(path), System.Net.Mime.MediaTypeNames.Application.Octet, fileName);
            }
            catch (Exception ex)
            {
                Logger.Error($"文件下载出错:{path}{ex.Message}");
            }
            return Content("");
        }

        /// <summary>
        /// 下载Excel导入的模板
        /// </summary>
        /// <param name="fileName"></param>
        /// <returns></returns>
        [HttpGet]
        [ApiExplorerSettings(IgnoreApi = true)]
        public async virtual Task<ActionResult> DownLoadTemplate()
        {
            ResponseContent = await Task.Run(() => InvokeService("DownLoadTemplate", new object[] { })) as WebResponseContent;
            if (!ResponseContent.Status)
            {
                return Json(ResponseContent);
            }
            byte[] fileBytes = System.IO.File.ReadAllBytes(ResponseContent.Data.ToString());
            return File(fileBytes, System.Net.Mime.MediaTypeNames.Application.Octet, Path.GetFileName(ResponseContent.Data.ToString())); 
        }

        [ApiExplorerSettings(IgnoreApi = true)]
        public virtual async Task<ActionResult> Del(object[] keys)
        {
            ResponseContent = await Task.Run(() => InvokeService("Del", new object[] { keys ,true})) as WebResponseContent;
            Logger.Info(Enums.LoggerType.Del, keys.Serialize(), ResponseContent.Status ? "Ok" : ResponseContent.Message);
            return Json(ResponseContent);
        }
        [ApiExplorerSettings(IgnoreApi = true)]
        public virtual async Task<ActionResult> Audit(object[] id, int? auditStatus, string auditReason)
        {
            ResponseContent = await Task.Run(() => InvokeService("Audit", new object[] { id, auditStatus, auditReason })) as WebResponseContent;
            Logger.Info(Enums.LoggerType.Del, id?.Serialize() + "," + (auditStatus ?? -1) + "," + auditReason, ResponseContent.Status ? "Ok" : ResponseContent.Message);
            return Json(ResponseContent);
        }
        [ApiExplorerSettings(IgnoreApi = true)]
        public virtual async Task<WebResponseContent> Add(SaveModel saveModel)
        {
            ResponseContent = await Task.Run(() => InvokeService("Add", new Type[] { typeof(SaveModel) }, new object[] { saveModel })) as WebResponseContent;
            Logger.Info(Enums.LoggerType.Add, saveModel.Serialize(), ResponseContent.Status ? "Ok" : ResponseContent.Message);
            return ResponseContent;
        }
        [ApiExplorerSettings(IgnoreApi = true)]
        public virtual async Task<WebResponseContent> Update(SaveModel saveModel)
        {
            ResponseContent = await Task.Run(() => InvokeService("Update", new object[] { saveModel })) as WebResponseContent;
            Logger.Info(Enums.LoggerType.Edit, saveModel.Serialize(), ResponseContent.Status ? "Ok" : ResponseContent.Message);
            return ResponseContent;
        }

        /// <summary>
        /// 反射调用service方法
        /// </summary>
        /// <param name="methodName"></param>
        /// <param name="parameters"></param>
        /// <returns></returns>
        private object InvokeService(string methodName, object[] parameters)
        {
            return Service.GetType().GetMethod(methodName).Invoke(Service, parameters);
        }
        /// <summary>
        /// 反射调用service方法
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

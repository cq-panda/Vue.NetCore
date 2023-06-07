using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using System.Collections.Generic;
using System.Threading.Tasks;
using VOL.Core.Filters;
using VOL.Entity.DomainModels;

namespace VOL.Core.Controllers.Basic
{
    public class WebBaseController<IServiceBase> : BaseController<IServiceBase>
    {

        public WebBaseController(string projectName, string folder, string tablename, IServiceBase service)
        : base(projectName, folder, tablename, service)
        {
        }
        /// <summary>
        /// 获取grid分页数据
        /// </summary>
        /// <param name="loadData"></param>
        /// <returns></returns>
        [ActionPermission(Enums.ActionPermissionOptions.Search)]
        [HttpPost]
        public override async Task<ActionResult> GetPageData(PageDataOptions loadData)
        {
            return await base.GetPageData(loadData);
        }
        [HttpPost]
        [ActionPermission(Enums.ActionPermissionOptions.Upload)]
        public override async Task<ActionResult> Upload(List<IFormFile> fileInput)
        {
            return await base.Upload(fileInput);
        }

        /// <summary>
        /// 导出文件，返回日期+文件名
        /// </summary>
        /// <param name="loadData"></param>
        /// <returns></returns>
        [ActionPermission(Enums.ActionPermissionOptions.Export)]
        [HttpPost]
        public override async Task<ActionResult> Export(PageDataOptions loadData)
        {
            return await base.Export(loadData);
        }
        /// <summary>
        /// 下载文件
        /// </summary>
        /// <param name="fileName"></param>
        /// <returns></returns>
        [ActionPermission(Enums.ActionPermissionOptions.Export)]
        [HttpGet]
        public override ActionResult DownLoadFile(string fileName)
        {
            return  base.DownLoadFile(fileName);
        }
        /// <summary>
        /// 通过key删除文件
        /// </summary>
        /// <param name="keys"></param>
        /// <returns></returns>
        [ActionPermission(Enums.ActionPermissionOptions.Delete)]
        [HttpPost]
        public override async Task<ActionResult> Del(object[] keys)
        {
            return await base.Del(keys);
        }
        /// <summary>
        /// 审核
        /// </summary>
        /// <param name="keys"></param>
        /// <returns></returns>
        [ActionPermission(Enums.ActionPermissionOptions.Audit)]
        [HttpPost]
        public override async Task<ActionResult> Audit(object[] id, int? auditStatus, string auditReason)
        {
            return await base.Audit(id, auditStatus, auditReason);
        }
        /// <summary>
        /// 新增支持主子表
        /// </summary>
        /// <param name="saveDataModel"></param>
        /// <returns></returns>
        [ActionPermission(Enums.ActionPermissionOptions.Add)]
        [HttpPost]
        public async Task<ActionResult> Add([ModelBinder]Dictionary<string, object> mainData, [ModelBinder] List<Dictionary<string, object>> detailData)
        {
            SaveModel saveModel = new SaveModel() { MainData = mainData, DetailData = detailData };
            return Json(await base.Add(saveModel));
        }
        /// <summary>
        /// 编辑支持主子表
        /// [ModelBinder(BinderType =(typeof(ModelBinder.BaseModelBinder)))]可指定绑定modelbinder
        /// </summary>
        /// <param name="saveDataModel"></param>
        /// <returns></returns>
        [ActionPermission(Enums.ActionPermissionOptions.Update)]
        [HttpPost]
        public async Task<ActionResult> Update([ModelBinder(BinderType = (typeof(ModelBinder.BaseModelBinder)))]Dictionary<string, object> mainData, [ModelBinder] List<Dictionary<string, object>> detailData, [ModelBinder] List<object> delKeys)
        {
            SaveModel saveModel = new SaveModel()
            {
                DelKeys = delKeys,
                MainData = mainData,  
                DetailData = detailData
            };
            var data = await base.Update(saveModel);
            return Json(data);
        }

    }
}

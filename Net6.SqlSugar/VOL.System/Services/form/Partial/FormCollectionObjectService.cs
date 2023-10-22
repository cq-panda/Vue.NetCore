/*
 *所有关于FormCollectionObject类的业务代码应在此处编写
*可使用repository.调用常用方法，获取EF/Dapper等信息
*如果需要事务请使用repository.DbContextBeginTransaction
*也可使用DBServerProvider.手动获取数据库相关信息
*用户信息、权限、角色等使用UserContext.Current操作
*FormCollectionObjectService对增、删、改查、导入、导出、审核业务代码扩展参照ServiceFunFilter
*/
using VOL.Core.BaseProvider;
using VOL.Core.Extensions.AutofacManager;
using VOL.Entity.DomainModels;
using System.Linq;
using VOL.Core.Utilities;
using System.Linq.Expressions;
using VOL.Core.Extensions;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.DependencyInjection;
using Microsoft.AspNetCore.Http;
using VOL.System.IRepositories;
using System.Collections.Generic;
using VOL.Core.Configuration;
using VOL.Core.Services;
using System;
using OfficeOpenXml;
using System.IO;
using OfficeOpenXml.Style;
using System.Drawing;
using VOL.Core.DBManager;

namespace VOL.System.Services
{
    public partial class FormCollectionObjectService
    {
        private readonly IHttpContextAccessor _httpContextAccessor;
        private readonly IFormCollectionObjectRepository _repository;//访问数据库
        private readonly IFormDesignOptionsRepository _designOptionsRepository;
        [ActivatorUtilitiesConstructor]
        public FormCollectionObjectService(
            IFormCollectionObjectRepository dbRepository,
            IHttpContextAccessor httpContextAccessor,
             IFormDesignOptionsRepository designOptionsRepository
            )
        : base(dbRepository)
        {
            _httpContextAccessor = httpContextAccessor;
            _repository = dbRepository;
            _designOptionsRepository = designOptionsRepository;
        }

        public override WebResponseContent Export(PageDataOptions pageData)
        {
            string path = null;
            string fileName = null;
            WebResponseContent webResponse = new WebResponseContent();
            ExportOnExecuting = (List<FormCollectionObject> list, List<string> columns) =>
            {
                var formId = list[0].FormId;
                var data = _designOptionsRepository.FindAsIQueryable(x => x.FormId == formId)
                   .Select(s => new { s.Title, s.FormConfig }).FirstOrDefault();
                try
                {
                    List<FormOptions> formObj = data.FormConfig.DeserializeObject<List<FormOptions>>();
                    List<Dictionary<string, object>> listDic = new List<Dictionary<string, object>>();
                    foreach (var item in list)
                    {
                            Dictionary<string, object> dic = new Dictionary<string, object>();
                            var formData = item.FormData.DeserializeObject<Dictionary<string, string>>();
                            dic.Add("标题", data.Title);
  
                            dic.Add("提交人", item.Creator);
                            dic.Add("提交时间", item.CreateDate.ToString("yyyy-MM-dd HH:mm:sss"));
                            foreach (var obj in formObj)
                            {
                                dic.Add(obj.Title, formData.Where(x => x.Key == obj.Field).Select(s => s.Value).FirstOrDefault());
                            }
                            listDic.Add(dic);
                    }
                    fileName = data.Title + ".xlsx";
                    path = EPPlusHelper.ExportGeneralExcel(listDic, fileName);
                }
                catch (Exception ex)
                {
                    Logger.Error($"解析表单出错：{data.Title},表单配置：{data.FormConfig},{ex.Message}");
                    return webResponse.Error("获取表单出错");
                }
                webResponse.Code = "-1";
                return webResponse.OK(null, path.EncryptDES(AppSetting.Secret.ExportFile));
            };
            return base.Export(pageData);
        } 
    }

    public class FormOptions
    {
        public string Field { get; set; }

        public string Title { get; set; }

        public string Type { get; set; }
    }
}

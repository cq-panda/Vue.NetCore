using Microsoft.AspNetCore.Http;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Linq.Expressions;
using System.Threading.Tasks;
using VOL.Core.CacheManager;
using VOL.Core.Utilities;
using VOL.Core.WorkFlow;
using VOL.Entity.DomainModels;
using VOL.Entity.SystemModels;

namespace VOL.Core.BaseProvider
{
    public interface IService<TEntity> where TEntity : BaseEntity
    {
        ICacheService CacheContext { get; }
        Microsoft.AspNetCore.Http.HttpContext Context { get; }
        string WorkFlowTableName { get; set; }

        IQueryable<TEntity> FindAsIQueryable(Expression<Func<TEntity, bool>> predicate, bool filterDeleted = true);
        IQueryable<TEntity> FindAsIQueryable(PageDataOptions options, bool useTenancy = true, bool logicDel = true);

        Task<PageGridData<TEntity>> GetPageDataAsync(PageDataOptions options);
        PageGridData<TEntity> GetPageData(PageDataOptions options);

        object GetDetailPage(PageDataOptions pageData);
        Task<object> GetDetailPageAsync(PageDataOptions pageData);

        WebResponseContent Add(SaveModel saveDataModel);
        Task<WebResponseContent> AddAsync(SaveModel saveDataModel);

        WebResponseContent Update(SaveModel saveDataModel);
        Task<WebResponseContent> UpdateAsync(SaveModel saveDataModel);

        WebResponseContent Del(object[] keys, bool delList = true);
        Task<WebResponseContent> DelAsync(object[] keys, bool delList = true);

        WebResponseContent Upload(List<IFormFile> files);
        Task<WebResponseContent> UploadAsync(List<IFormFile> files);

        WebResponseContent DownLoadTemplate();
        Task<WebResponseContent> DownLoadTemplateAsync();

        WebResponseContent Import(List<IFormFile> files);
        Task<WebResponseContent> ImportAsync(List<IFormFile> files);

        WebResponseContent Export(PageDataOptions pageData);
        Task<WebResponseContent> ExportAsync(PageDataOptions pageData);

        WebResponseContent Audit(object[] keys, int? auditStatus, string auditReason);
        Task<WebResponseContent> AuditAsync(object[] keys, int? auditStatus, string auditReason);

        WebResponseContent AddProcese(TEntity entity);
        Task<WebResponseContent> AddProceseAsync(TEntity entity);

        WebResponseContent AntiAudit(AntiData antiData);
        Task<WebResponseContent> AntiAuditAsync(AntiData antiData);
    }
}

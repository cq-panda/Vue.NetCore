using Microsoft.AspNetCore.Http;
using SqlSugar;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Linq.Expressions;
using System.Reflection;
using System.Threading.Tasks;
using VOL.Core.DbSqlSugar;
using VOL.Core.Enums;
using VOL.Core.Extensions;
using VOL.Core.Utilities;
using VOL.Core.WorkFlow;
using VOL.Entity.DomainModels;
using VOL.Entity.SystemModels;
using CC = VOL.Core.CacheManager;

namespace VOL.Core.BaseProvider
{
    public abstract class ServiceBase<TEntity, TRepository> : ApplicationServiceBase<TEntity, TRepository>
            where TEntity : BaseEntity, new()
            where TRepository : IRepository<TEntity>
    {
        public ServiceBase() { }
  
        public ServiceBase(TRepository repository) : base(repository) { }
        public string WorkFlowTableName { get; set; }
        public CC.ICacheService CacheContext { get { return Context.GetService<CC.ICacheService>(); } }

        public Microsoft.AspNetCore.Http.HttpContext Context { get { return Utilities.HttpContext.Current; } }
        protected virtual void Init(IRepository<TEntity> repository) { }

        public ISugarQueryable<TEntity> FindAsIQueryable(Expression<Func<TEntity, bool>> predicate, bool filterDeleted = true)
        {
            return repository.FindAsIQueryable(predicate, null, filterDeleted);
        }
        public ISugarQueryable<TEntity> FindAsIQueryable(PageDataOptions options, bool useTenancy = true, bool logicDel = true)
        {
            var (queryable, orderbyDic) = options.BuildPageDataQuery(this, useTenancy, logicDel);
            return queryable = queryable.GetIQueryableOrderBy(orderbyDic);
        }
        public virtual PageGridData<TEntity> GetPageData(PageDataOptions options)
        {
            var (queryable, orderbyDic) = options.BuildPageDataQuery(this, IsMultiTenancy);
            PageGridData<TEntity> pageGridData = new();

            if (options.Export)
            {
                if (Limit > 0)
                {
                    //查询排序，包括多字段排序
                    queryable = queryable.GetIQueryableOrderBy(orderbyDic);
                    queryable = queryable.Take(Limit);
                }
            }
            else
            {
                pageGridData.summary = this.InvokeSummaryExpress(queryable);
                pageGridData.total = queryable.Count();
                queryable = queryable.GetIQueryableOrderBy(orderbyDic);
                queryable = queryable.TakePage(options.Page, options.Rows);
            }
            //字段权限
            pageGridData.rows = queryable.FilterQueryableAuthFields();
            this.InvokeResult(pageGridData);
            return pageGridData;
        }
        public virtual async Task<PageGridData<TEntity>> GetPageDataAsync(PageDataOptions options)
        {
            var (queryable, orderbyDic) = options.BuildPageDataQuery(this, IsMultiTenancy);
            PageGridData<TEntity> pageGridData = new();

            if (options.Export)
            {
                if (Limit > 0)
                {
                    //查询排序，包括多字段排序
                    queryable = queryable.GetIQueryableOrderBy(orderbyDic);
                    queryable = queryable.Take(Limit);
                }
            }
            else
            {
                pageGridData.summary = await this.InvokeSummaryExpressAsync(queryable);//表格合计
                pageGridData.total = await queryable.CountAsync();
                queryable = queryable.GetIQueryableOrderBy(orderbyDic);
                queryable = queryable.TakePage(options.Page, options.Rows);
            }
            //字段权限
            pageGridData.rows = await queryable.FilterQueryableAuthFieldsAsync();
            this.InvokeResult(pageGridData);
            if (GetPageDataOnExecutedAsync != null)
            {
                await GetPageDataOnExecutedAsync.Invoke(pageGridData);
            }
            return pageGridData;
        }
        public virtual object GetDetailPage(PageDataOptions pageData)
        {
            (Type mainType, Type detailType) = typeof(TEntity).GetDetailType<TEntity>(pageData);
            string message = DetailIsNull(detailType, pageData);
            if (message != null) return new { message };
            var method = typeof(ApplicationServiceBaseSearchDetailExtensions)
             .GetMethods(BindingFlags.Public | BindingFlags.Static)
             .First(m => m.Name == nameof(ApplicationServiceBaseSearchDetailExtensions.GetDetailPageData));
            var generic = method.MakeGenericMethod(typeof(TEntity), typeof(TRepository), mainType, detailType);
            return generic.Invoke(null, [pageData, this]);
        }
        public virtual async Task<object> GetDetailPageAsync(PageDataOptions pageData)
        {
            (Type mainType, Type detailType) = typeof(TEntity).GetDetailType<TEntity>(pageData);
            string message = DetailIsNull(detailType, pageData);
            if (message != null) return new { message };

            var method = typeof(ApplicationServiceBaseSearchDetailExtensions)
             .GetMethods(BindingFlags.Public | BindingFlags.Static)
             .First(m => m.Name == nameof(ApplicationServiceBaseSearchDetailExtensions.GetDetailPageDataAsync));
            var generic = method.MakeGenericMethod(typeof(TEntity), typeof(TRepository), mainType, detailType);
            var invoked = generic.Invoke(null, [pageData, this]);
            return await (Task<object>)invoked;
        }

        private static string DetailIsNull(Type detailType, PageDataOptions pageData)
        {
            return detailType == null ? $"未找到配置{pageData.TableName},请检查代码生成器明细表配置及是否生成model" : null;
        }
        public virtual WebResponseContent Add(SaveModel saveDataModel)
        {
            var (res, entity) = saveDataModel.GetAddEntityData(this);
            baseWebResponse = res;
            if (ResponseIsError) return baseWebResponse;
            TEntity mainEntity = entity;

            //这里同样先要做类型转换
            Type detailType = MultipleTableEntity.FirstType();
            object detailRows = MultipleTableEntity.GetAddList(detailType, null);
            if (AddOnExecuting != null)
            {
                baseWebResponse = AddOnExecuting(mainEntity, detailRows);
                if (ResponseIsError) return baseWebResponse;
                MultipleTableEntity.SetAddList(detailType, detailRows);
            }

            baseWebResponse = repository.DbContextBeginTransaction(() =>
            {
                repository.BaseDbContext.InsertNavDetail(mainEntity);
                if (AddOnExecuted != null)
                {
                    baseWebResponse = AddOnExecuted(mainEntity, detailRows);
                }
                return baseWebResponse;
            });
            if (ResponseIsError) return baseWebResponse;
            if (string.IsNullOrEmpty(baseWebResponse.Message))
            {
                baseWebResponse.OK(ResponseType.SaveSuccess);
            }

            //调用审批流程
            AddProcese(mainEntity);
            baseWebResponse.Data = new { data = mainEntity };
            return baseWebResponse;
        }
        public virtual async Task<WebResponseContent> AddAsync(SaveModel saveDataModel)
        {
            var (res, entity) = saveDataModel.GetAddEntityData(this);
            baseWebResponse = res;
            if (ResponseIsError) return baseWebResponse;
            TEntity mainEntity = entity;

            //这里同样先要做类型转换
            Type detailType = MultipleTableEntity.FirstType();
            object detailRows = MultipleTableEntity.GetAddList(detailType, null);
            if (AddOnExecuting != null)
            {
                baseWebResponse = AddOnExecuting(mainEntity, detailRows);
                if (ResponseIsError) return baseWebResponse;
                MultipleTableEntity.SetAddList(detailType, detailRows);
            }
            if (AddOnExecutingAsync != null)
            {
                baseWebResponse = await AddOnExecutingAsync(mainEntity, detailRows);
                if (ResponseIsError) return baseWebResponse;
                MultipleTableEntity.SetAddList(detailType, detailRows);
            }
            baseWebResponse = await repository.DbContextBeginTransactionAsync(async () =>
            {
                await repository.BaseDbContext.InsertNavDetailAsync(mainEntity);
                if (AddOnExecuted != null)
                {
                    baseWebResponse = AddOnExecuted(mainEntity, detailRows);
                    if (ResponseIsError) return baseWebResponse;
                }
                if (AddOnExecutedAsync != null)
                {
                    baseWebResponse = await AddOnExecutedAsync(mainEntity, detailRows);
                }
                return baseWebResponse;
            });
            if (ResponseIsError) return baseWebResponse;
            if (string.IsNullOrEmpty(baseWebResponse.Message))
            {
                baseWebResponse.OK(ResponseType.SaveSuccess);
            }

            //调用审批流程
            await AddProceseAsync(mainEntity);

            baseWebResponse.Data = new { data = mainEntity };
            return baseWebResponse;
        }
        public virtual WebResponseContent Update(SaveModel saveDataModel)
        {
            var (res, entity) = saveDataModel.GetUpdateEntityData(this);
            baseWebResponse = res;
            if (ResponseIsError) return baseWebResponse;

            TEntity mainEntity = entity;
            TEntity orginData = null;

            // detailData?.AddList需要转换类型(兼容老版本及Sys_WorkFlowService中使用了Clear)
            //这里同样先要做类型转换
            Type detailType = MultipleTableEntity.FirstType();
            object addList = MultipleTableEntity.GetAddList(detailType, typeof(TEntity));
            object updateList = MultipleTableEntity.GetUpdateList(detailType, typeof(TEntity));
            var delKeys = MultipleTableEntity.FirstData().DelKeys;
            if (UpdateOnExecuting != null)
            {
                //var addListObj=detailData?.AddList 先转换为List<Detail>
                baseWebResponse = UpdateOnExecuting(mainEntity, addList, updateList, delKeys);
                //执行完成后，再转换替换回去
                if (ResponseIsError) return baseWebResponse;
                MultipleTableEntity.SetAddList(detailType, addList).SetUpdateList(detailType, updateList);
            }
            WebResponseContent SaveData()
            {
                //主表更新
                var updateFields = saveDataModel.MainData.Select(x => x.Key).ToArray();
                repository.Update(mainEntity, updateFields, saveChanges: false);

                //二、三明细表添加、删除、修改操作
                foreach (var item in MultipleTableEntity?.Data)
                {
                    var entityData = item.Value;
                    if (!entityData.InsertDb) continue;
                    entityData.InsertDetail(repository.BaseDbContext, item.Key);
                    entityData.UpdateDetail(repository.BaseDbContext, item.Key);
                    //删除数据(带逻辑删除)
                    repository.BaseDbContext.DeleteWithType(item.Key, entityData.DelKeys);
                    //二级表删除时同时删除三级明细表数据
                }

                //审计日志获取原始数据
                Expression<Func<TEntity, bool>> expression = saveDataModel.GetUpdateBeforeActionLogDbDataFilterExpression<TEntity>();
                if (expression != null)
                {
                    orginData = repository.FindFirst(expression);
                }
                repository.SaveChanges();
                if (UpdateOnExecuted != null)
                {
                    baseWebResponse = UpdateOnExecuted(mainEntity, addList, updateList, delKeys);
                }
                return baseWebResponse;
            }

            baseWebResponse = repository.DbContextBeginTransaction(SaveData);
            if (ResponseIsError) return baseWebResponse;
    
            baseWebResponse.Data = baseWebResponse.Data ?? new { data = mainEntity };
            return baseWebResponse.OK(ResponseType.SaveSuccess);
        }
        public virtual async Task<WebResponseContent> UpdateAsync(SaveModel saveDataModel)
        {
            var (res, entity) = saveDataModel.GetUpdateEntityData(this);
            baseWebResponse = res;
            if (ResponseIsError) return baseWebResponse;

            TEntity mainEntity = entity;
            TEntity orginData = null;
            // detailData?.AddList需要转换类型(兼容老版本及Sys_WorkFlowService中使用了Clear)
            Type detailType = MultipleTableEntity.FirstType();
            object addList = MultipleTableEntity.GetAddList(detailType, typeof(TEntity));
            object updateList = MultipleTableEntity.GetUpdateList(detailType, typeof(TEntity));
            var delKeys = MultipleTableEntity.FirstData().DelKeys;
            if (UpdateOnExecuting != null)
            {
                //var addListObj=detailData?.AddList 先转换为List<Detail>
                baseWebResponse = UpdateOnExecuting(mainEntity, addList, updateList, delKeys);
                //执行完成后，再转换替换回去
                if (ResponseIsError) return baseWebResponse;
                MultipleTableEntity.SetAddList(detailType, addList).SetUpdateList(detailType, updateList);
            }
            if (UpdateOnExecutingAsync != null)
            {
                //同上操作
                baseWebResponse = await UpdateOnExecutingAsync(mainEntity, addList, updateList, delKeys);
                if (ResponseIsError) return baseWebResponse;
                MultipleTableEntity.SetAddList(detailType, addList).SetUpdateList(detailType, updateList);
            }
            async Task<WebResponseContent> SaveData()
            {
                //主表更新
                var updateFields = saveDataModel.MainData.Select(x => x.Key).ToArray();
                repository.Update(mainEntity, updateFields);

                //二、三明细表添加、删除、修改操作
                foreach (var item in MultipleTableEntity?.Data)
                {
                    var entityData = item.Value;
                    if (!entityData.InsertDb) continue; ;
                    await entityData.InsertDetailAsync(repository.BaseDbContext, item.Key);
                    await entityData.UpdateDetailAsync(repository.BaseDbContext, item.Key);
                    //删除数据(带逻辑删除)
                    await repository.BaseDbContext.DeleteWithTypeAsync(item.Key, entityData.DelKeys);
                }
                //审计日志获取原始数据
                Expression<Func<TEntity, bool>> expression = saveDataModel.GetUpdateBeforeActionLogDbDataFilterExpression<TEntity>();
                if (expression != null)
                {
                    orginData = repository.FindFirst(expression);
                }
                await repository.SaveChangesAsync();
                if (UpdateOnExecuted != null)
                {
                    baseWebResponse = UpdateOnExecuted(mainEntity, addList, updateList, delKeys);
                }
                if (UpdateOnExecutedAsync != null)
                {
                    baseWebResponse = await UpdateOnExecutedAsync(mainEntity, addList, updateList, delKeys);
                }
                return baseWebResponse;
            }

            baseWebResponse = await repository.DbContextBeginTransactionAsync(SaveData);
            if (ResponseIsError) return baseWebResponse;
      
            baseWebResponse.Data = baseWebResponse.Data ?? new { data = mainEntity };
            return baseWebResponse.OK(ResponseType.SaveSuccess);
        }
        public virtual WebResponseContent Del(object[] keys, bool delList = true)
        {
            IEnumerable<(bool, string, object)> validation = typeof(TEntity).GetKeyProperty().ValidationValueForDbType(keys);
            if (validation.Any(x => !x.Item1))
                return baseWebResponse.Error(validation.Where(x => !x.Item1).Select(s => s.Item2 + "</br>").Serialize());
            if (DelOnExecuting != null)
            {
                baseWebResponse = DelOnExecuting(keys);
                if (ResponseIsError) return baseWebResponse;
            }
            List<TEntity> orginList = null;
            baseWebResponse = repository.DbContextBeginTransaction(() =>
            {
                var entityType = typeof(TEntity);
                var keyList = keys?.ToList() ?? [];
                ///删除二、级明细表
                repository.BaseDbContext.DeleteAllDetilWithType(entityType, keyList);
                if (IsTableActionLog)
                {
                    //审计日志获取原始删除主表数据(按主键集合查询)
                    orginList = repository.BaseDbContext.QueryOriginListByKeys<TEntity>(keyList);
                }
                //删除主表数据(如果主表是逻辑删除，明细表没有逻辑删除字段时，明细要删除？)
                int count = repository.BaseDbContext.DeleteWithType(entityType, keyList);
                if (DelOnExecuted != null)
                {
                    baseWebResponse = DelOnExecuted(keys);
                    if (ResponseIsError) return baseWebResponse;
                }
   
                return baseWebResponse.OK(ResponseType.DelSuccess);
            });

            //删除进入流程的数据
            string tableName = WorkFlowTableName ?? typeof(TEntity).GetEntityTableName();
            if (!ResponseIsError && WorkFlowManager.Exists(tableName))
            {
                var ids = keys.Select(s => s.ToString()).ToList();
                DbManger.Db.Deleteable<Sys_WorkFlowTable>()
                     .Where(x => x.WorkTable == tableName && ids.Contains(x.WorkTableKey)).ExecuteCommand();
            }
            return baseWebResponse;
        }
        public virtual async Task<WebResponseContent> DelAsync(object[] keys, bool delList = true)
        {
            IEnumerable<(bool, string, object)> validation = typeof(TEntity).GetKeyProperty().ValidationValueForDbType(keys);
            if (validation.Any(x => !x.Item1))
                return baseWebResponse.Error(validation.Where(x => !x.Item1).Select(s => s.Item2 + "</br>").Serialize());

            if (DelOnExecuting != null)
            {
                baseWebResponse = DelOnExecuting(keys);
                if (ResponseIsError) return baseWebResponse;
            }
            if (DelOnExecutingAsync != null)
            {
                baseWebResponse = await DelOnExecutingAsync(keys);
                if (ResponseIsError) return baseWebResponse;
            }
            List<TEntity> orginList = null;
            baseWebResponse = await repository.DbContextBeginTransactionAsync(async () =>
            {
                var entityType = typeof(TEntity);
                var keyList = keys?.ToList() ?? [];
                ///删除二、级明细表
                await repository.BaseDbContext.DeleteAllDetilWithTypeAsync(entityType, keyList);
                if (IsTableActionLog)
                {
                    //审计日志获取原始删除主表数据(按主键集合查询)
                    orginList = await repository.BaseDbContext.QueryOriginListByKeysAsync<TEntity>(keyList);
                }
                //删除主表数据
                int count = await repository.BaseDbContext.DeleteWithTypeAsync(entityType, keyList);
                if (DelOnExecuted != null)
                {
                    baseWebResponse = DelOnExecuted(keys);
                    if (ResponseIsError) return baseWebResponse;
                }
                if (DelOnExecutedAsync != null)
                {
                    baseWebResponse = await DelOnExecutedAsync(keys);
                    if (ResponseIsError) return baseWebResponse;
                }
                return baseWebResponse.OK(ResponseType.DelSuccess);
            });
 
            //删除进入流程的数据
            string tableName = WorkFlowTableName ?? typeof(TEntity).GetEntityTableName();
            if (!ResponseIsError && WorkFlowManager.Exists(tableName))
            {
                var ids = keys.Select(s => s.ToString()).ToList();
                //await DBServerProvider.DbContext.Set<Sys_WorkFlowTable>()
                //     .Where(x => x.WorkTable == tableName && ids.Contains(x.WorkTableKey))
                //     .Include(x => x.Sys_WorkFlowTableStep).ExecuteDeleteAsync();
                await DbManger.Db.Deleteable<Sys_WorkFlowTable>()
                     .Where(x => x.WorkTable == tableName && ids.Contains(x.WorkTableKey)).ExecuteCommandAsync();
            }
            return baseWebResponse;
        }
        public virtual WebResponseContent Upload(List<IFormFile> files)
        {
            if (files == null || files.Count == 0) return baseWebResponse.Error("请上传文件");
            string filePath = files.Save<TEntity>(UploadFolder, Utilities.HttpContext.Current.Request("fileName"));
            return baseWebResponse.OK("文件上传成功", filePath);
        }
        public virtual async Task<WebResponseContent> UploadAsync(List<IFormFile> files)
        {
            if (files == null || files.Count == 0) return baseWebResponse.Error("请上传文件");
            string filePath = await files.SaveAsync<TEntity>(UploadFolder, Utilities.HttpContext.Current.Request("fileName"));
            return baseWebResponse.OK("文件上传成功", filePath);
        }
        public virtual WebResponseContent DownLoadTemplate()
        {
            byte[] bytes = EPPlusHelper.ExportTemplateBytes(DownLoadTemplateColumns, ApplicationServiceBaseConfig.IgnoreTemplate(), ExcelHeaderMap);
            return baseWebResponse.OK(null, bytes);
        }
        public virtual async Task<WebResponseContent> DownLoadTemplateAsync()
        {
            return await Task.FromResult(DownLoadTemplate());
        }
        public virtual WebResponseContent Import(List<IFormFile> files)
        {
            var (dicPath, importFileName, validateRes) = files.ValidationImportFile<TEntity>();
            if (!validateRes.Status)
            {
                baseWebResponse = validateRes;
                return baseWebResponse;
            }
            files.Save(dicPath, importFileName);
            string filePath = dicPath + importFileName;
            baseWebResponse = EPPlusHelper.ReadToDataTable(filePath, DownLoadTemplateColumns,
                    ApplicationServiceBaseConfig.IgnoreTemplate(),
                    readValue: ImportOnReadCellValue,
                    ExcelHeaderMap, ImportStartRowIndex,
                    ImportIgnoreSelectValidationColumns);
            if (ResponseIsError) return baseWebResponse;

            List<TEntity> list = baseWebResponse.Data as List<TEntity>;
            list.SetLogicDelListValue().SetPrimaryKeyDefaultListValue();
            if (ImportOnExecuting != null)
            {
                baseWebResponse = ImportOnExecuting.Invoke(list);
                if (ResponseIsError) return baseWebResponse;
            }
            baseWebResponse = repository.DbContextBeginTransaction(() =>
            {
                //明细表导入
                if (Utilities.HttpContext.Current.Request.Query.ContainsKey("table"))
                {
                    baseWebResponse.Data = list;
                }
                else
                {
                    repository.AddRange(list, true);
                }
                if (ImportOnExecuted != null)
                {
                    baseWebResponse = ImportOnExecuted.Invoke(list);
                    if (ResponseIsError) return baseWebResponse;
                }
                return baseWebResponse;
            });
            if (baseWebResponse.Status && string.IsNullOrEmpty(baseWebResponse.Message))
            {
                baseWebResponse.Message = "文件上传成功";
            }
            return baseWebResponse;
        }
        public virtual async Task<WebResponseContent> ImportAsync(List<IFormFile> files)
        {
            var (dicPath, importFileName, validateRes) = files.ValidationImportFile<TEntity>();
            if (!validateRes.Status)
            {
                return validateRes;
            }
            await files.SaveAsync(dicPath, importFileName);
            string filePath = dicPath + importFileName;
            baseWebResponse = EPPlusHelper.ReadToDataTable(filePath, DownLoadTemplateColumns,
                    ApplicationServiceBaseConfig.IgnoreTemplate(),
                    readValue: ImportOnReadCellValue,
                    ExcelHeaderMap, ImportStartRowIndex,
                    ImportIgnoreSelectValidationColumns);
            if (ResponseIsError) return baseWebResponse;

            var list = baseWebResponse.Data as List<TEntity>;
            list.SetLogicDelListValue().SetPrimaryKeyDefaultListValue();
            if (ImportOnExecuting != null)
            {
                baseWebResponse = ImportOnExecuting.Invoke(list);
                if (ResponseIsError) return baseWebResponse;
            }

            if (ImportOnExecutingAsync != null)
            {
                baseWebResponse = await ImportOnExecutingAsync.Invoke(list);
                if (ResponseIsError) return baseWebResponse;
            }
            baseWebResponse = await repository.DbContextBeginTransactionAsync(async () =>
            {
                //明细表导入
                if (Utilities.HttpContext.Current.Request.Query.ContainsKey("table"))
                {
                    baseWebResponse.Data = list;
                }
                else
                {
                    repository.AddRange(list, true);
                }
                if (ImportOnExecuted != null)
                {
                    baseWebResponse = ImportOnExecuted.Invoke(list);
                    if (ResponseIsError) return baseWebResponse;
                }
                if (ImportOnExecutedAsync != null)
                {
                    baseWebResponse = await ImportOnExecutedAsync.Invoke(list);
                }
                return baseWebResponse;
            });
            if (baseWebResponse.Status && string.IsNullOrEmpty(baseWebResponse.Message))
            {
                baseWebResponse.Message = "文件上传成功";
            }
            return baseWebResponse;
        }
        public virtual WebResponseContent Export(PageDataOptions pageData)
        {
            pageData.Export = true;
            List<TEntity> list = GetPageData(pageData).rows;
            List<string> ignoreColumn = [];
            if (ExportOnExecuting != null)
            {
                baseWebResponse = ExportOnExecuting(list, ignoreColumn);
                if (ResponseIsError) return baseWebResponse;
            }
            return ExportBytes(pageData, list, ignoreColumn);
        }
        public virtual async Task<WebResponseContent> ExportAsync(PageDataOptions pageData)
        {
            pageData.Export = true;
            List<TEntity> list = (await GetPageDataAsync(pageData)).rows;
            List<string> ignoreColumn = [];
            if (ExportOnExecuting != null)
            {
                baseWebResponse = ExportOnExecuting(list, ignoreColumn);
                if (ResponseIsError) return baseWebResponse;
            }
            if (ExportOnExecutingAsync != null)
            {
                baseWebResponse = await ExportOnExecutingAsync(list, ignoreColumn);
                if (ResponseIsError) return baseWebResponse;
            }
            return ExportBytes(pageData, list, ignoreColumn);
        }
        private WebResponseContent ExportBytes(PageDataOptions pageData, List<TEntity> list, List<string> ignoreColumn)
        {
            var exportFields = ExportColumns?.GetExpressionToArray() ?? [];
            if ((exportFields?.Length ?? 0) == 0 && (pageData.Columns?.Length ?? 0) > 0)
            {
                exportFields = pageData.Columns;
            }
           
            if (ignoreColumn.Count > 0)
            {
                ignoreColumn = ignoreColumn.Distinct().ToList();
            }
            byte[] bytes = EPPlusHelper.ExportBytes(list, exportFields, ignoreColumn, ExcelHeaderMap);
            return baseWebResponse.OK(null,bytes);
        }

        public virtual WebResponseContent Audit(object[] keys, int? auditStatus, string auditReason)
        {
            return keys.ProcessWorkflow(auditStatus, auditReason, this);
        }
        public virtual async Task<WebResponseContent> AuditAsync(object[] keys, int? auditStatus, string auditReason)
        {
            return await keys.ProcessWorkflowAsync(auditStatus, auditReason, this);
        }
        /// <summary>
        /// 手动调用写入流程
        /// </summary>
        /// <param name="entity"></param>
        /// <returns></returns>
        public WebResponseContent AddProcese(TEntity entity)
        {
            return entity.AddAuditProcese(this);
        }
        public async Task<WebResponseContent> AddProceseAsync(TEntity entity)
        {
            return await entity.AddAuditProceseAsync(this);
        }

        /// <summary>
        /// 反审
        /// </summary>
        public virtual WebResponseContent AntiAudit(AntiData antiData)
        {
            return antiData.AntiAudit(this);
        }

        public virtual async Task<WebResponseContent> AntiAuditAsync(AntiData antiData)
        {
            TEntity entity = antiData.GetAntiAuditEntity(this);
            if (entity != null && AntiAuditOnExecutingAsync != null)
            {
                baseWebResponse = await AntiAuditOnExecutingAsync(entity);
                if (!baseWebResponse.Status) return baseWebResponse;
            }
            baseWebResponse = antiData.AntiAudit(this, entity);
            if (ResponseIsError) return baseWebResponse;
            if (AntiAuditOnExecutedAsync != null)
            {
                baseWebResponse = await AntiAuditOnExecutedAsync(entity);
                if (!baseWebResponse.Status) return baseWebResponse;
            }
            return baseWebResponse;
        }
    }
}

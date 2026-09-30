using System;
using System.Collections.Generic;
using System.Linq;
using System.Linq.Expressions;
using System.Reflection;
using VOL.Core.Enums;
using VOL.Core.Extensions;
using VOL.Core.ManageUser;
using VOL.Core.WorkFlow;
using VOL.Entity.DomainModels;
using VOL.Entity.SystemModels;
using VOL.Core.Utilities;
using System.Threading.Tasks;

namespace VOL.Core.BaseProvider
{
    public static class ApplicationServiceBaseWrokflowExtensions
    {
        public static WebResponseContent ProcessWorkflow<TEntity, TRepository>(this object[] keys,
            int? auditStatus,
            string auditReason,
            ServiceBase<TEntity, TRepository> service)
          where TEntity : BaseEntity where TRepository : IRepository<TEntity>
        {
            (List<TEntity> auditList, List<string> updateFileds, bool isFlow, WebResponseContent baseWebResponse) = ValidationFlow(keys, auditStatus, auditReason, service);
            if (!baseWebResponse.Status)
            {
                return baseWebResponse;
            }
            if (!isFlow && service.AuditOnExecuting != null)
            {
                baseWebResponse = service.AuditOnExecuting(auditList);
                if (!baseWebResponse.Status) return baseWebResponse;
            }
            baseWebResponse = service.repository.DbContextBeginTransaction(() =>
            {
                if (!isFlow && auditList != null && updateFileds?.Count > 0)
                {
                    service.repository.UpdateRange(auditList, updateFileds.ToArray(), true);
                    service.repository.DetachedRange(auditList);
                }
                if (!isFlow && service.AuditOnExecuted != null)
                {
                    baseWebResponse = service.AuditOnExecuted(auditList);
                    if (!baseWebResponse.Status) return baseWebResponse;
                }
                WorkFlowManager.AddAuditLog<TEntity>(keys, auditStatus, auditReason);
                return baseWebResponse.OK();
            });
            if (baseWebResponse.Status)
            {
                return baseWebResponse.OK(ResponseType.AuditSuccess);
            }
            return baseWebResponse.Error(baseWebResponse.Message);
        }

        public static async Task<WebResponseContent> ProcessWorkflowAsync<TEntity, TRepository>(this object[] keys,
           int? auditStatus,
           string auditReason,
           ServiceBase<TEntity, TRepository> service)
         where TEntity : BaseEntity where TRepository : IRepository<TEntity>
        {
            (List<TEntity> auditList, List<string> updateFileds, bool isFlow, WebResponseContent baseWebResponse) = ValidationFlow(keys, auditStatus, auditReason, service);
            if (!baseWebResponse.Status)
            {
                return baseWebResponse;
            }
            if (service.AuditOnExecuting != null)
            {
                baseWebResponse = service.AuditOnExecuting(auditList);
                if (!baseWebResponse.Status) return baseWebResponse;
            }
            if (service.AuditOnExecutingAsync != null)
            {
                baseWebResponse = await service.AuditOnExecutingAsync(auditList);
                if (!baseWebResponse.Status) return baseWebResponse;
            }

            baseWebResponse = await service.repository.DbContextBeginTransactionAsync(async () =>
            {
                var entity = auditList[0];
                bool isLast = false;

                AuditStatus status = (AuditStatus)Enum.Parse(typeof(AuditStatus), auditStatus.ToString());
                if (isFlow && (service.AuditWorkFlowExecutingAsync != null || service.AuditWorkFlowExecutedAsync != null))
                {
                    var flowTable = entity.GetTableWorkflow();
                    if (flowTable != null && flowTable.Sys_WorkFlowTableStep != null)
                    {
                        isLast = flowTable.Sys_WorkFlowTableStep.Any(x => x.StepId == flowTable.CurrentStepId && x.StepAttrType != StepType.end.ToString());
                    }

                }
                if (isFlow && service.AuditWorkFlowExecutingAsync != null)
                {
                    baseWebResponse = await service.AuditWorkFlowExecutingAsync(auditList[0], status, isLast);
                    if (!baseWebResponse.Status) return baseWebResponse;
                }

                if (!isFlow && auditList != null && updateFileds?.Count > 0)
                {
                    service.repository.UpdateRange(auditList, updateFileds.ToArray(), true);
                    service.repository.DetachedRange(auditList);
                }
                if (!isFlow && service.AuditOnExecuted != null)
                {
                    baseWebResponse = service.AuditOnExecuted(auditList);
                    if (!baseWebResponse.Status) return baseWebResponse;
                }
                if (!isFlow && service.AuditOnExecutedAsync != null)
                {
                    baseWebResponse = await service.AuditOnExecutedAsync(auditList);
                    if (!baseWebResponse.Status) return baseWebResponse;
                }

                if (isFlow && service.AuditWorkFlowExecutedAsync != null)
                {
                    List<int> userIds = entity.GetTableCurrentStepAuditUserIds();
                    baseWebResponse = await service.AuditWorkFlowExecutedAsync(auditList[0], status, userIds, isLast);
                    if (!baseWebResponse.Status) return baseWebResponse;
                }

                await WorkFlowManager.AddAuditLogAysnc<TEntity>(keys, auditStatus, auditReason);
                return baseWebResponse.OK();
            });
            if (baseWebResponse.Status)
            {
                return baseWebResponse.OK(ResponseType.AuditSuccess);
            }
            return baseWebResponse.Error(baseWebResponse.Message);
        }

        private static (List<TEntity> auditList, List<string> updateFileds, bool isFlow, WebResponseContent webResponse) ValidationFlow<TEntity, TRepository>(
            object[] keys,
            int? auditStatus,
            string auditReason,
            ServiceBase<TEntity, TRepository> service)
          where TEntity : BaseEntity where TRepository : IRepository<TEntity>
        {
            WebResponseContent baseWebResponse = new WebResponseContent();
            Expression<Func<TEntity, bool>> whereExpression = typeof(TEntity).GetKeyName().CreateExpression<TEntity>(keys[0], LinqExpressionType.Equal);
            TEntity entity = service.repository.FindAsIQueryable(whereExpression).FirstOrDefault();
            if (entity == null)
            {
                return (null, null, false, baseWebResponse.Error($"未查到数据或者数据已被删除,id:{keys[0]}"));
            }
            var auditProperty = typeof(TEntity).GetAuditFieldPropertyInfo();
            if (auditProperty == null)
            {
                return (null, null, false, baseWebResponse.Error("表缺少审核状态字段：AuditStatus"));
            }
            //进入流程审批
            if (WorkFlowManager.Exists(entity, service.WorkFlowTableName))
            {
                AuditStatus status = (AuditStatus)Enum.Parse(typeof(AuditStatus), auditStatus.ToString());
                int val = auditProperty.GetValue(entity).GetInt();
                if (!(val == (int)AuditStatus.待审核 || val == (int)AuditStatus.审核中))
                {
                    return (null, null, false, baseWebResponse.Error("只能审批[待审核或审核中]的数据"));
                }
                baseWebResponse = service.repository.DbContextBeginTransaction(() =>
                {
                    return WorkFlowManager.Audit(service.repository.DbContext, entity, status, auditReason, auditProperty, service.AuditWorkFlowExecuting, service.AuditWorkFlowExecuted, workFlowTableName: service.WorkFlowTableName);
                });
                if (baseWebResponse.Status)
                {
                    return (new List<TEntity>() { entity }, null, true, baseWebResponse.OK(ResponseType.AuditSuccess));
                }
                return (null, null, false, baseWebResponse.Error(baseWebResponse.Message ?? "审批失败"));
            }
            //获取主键
            PropertyInfo property = typeof(TEntity).GetKeyProperty();
            if (property == null)
                return (null, null, false, baseWebResponse.Error("没有配置好主键!"));

            UserInfo userInfo = UserContext.Current.UserInfo;

            List<string> updateFileds = null;
            List<TEntity> auditList = new();
            foreach (var value in keys)
            {
                object convertVal = value.ToString().ChangeType(property.PropertyType);
                if (convertVal == null) continue;

                entity = Activator.CreateInstance<TEntity>();
                property.SetValue(entity, convertVal);
                updateFileds = WorkFlowGeneric.UpdateAuditInfo<TEntity>(entity, auditStatus ?? 0, auditReason);
                auditList.Add(entity);
            }
            return (auditList, updateFileds, false, baseWebResponse.OK());
        }
      

        public static WebResponseContent AddAuditProcese<TEntity, TRepository>(this TEntity entity, ServiceBase<TEntity, TRepository> service)
          where TEntity : BaseEntity
          where TRepository : IRepository<TEntity>
        {
            WebResponseContent webResponse = new WebResponseContent();
            if (!WorkFlowManager.Exists<TEntity>(service.WorkFlowTableName))
            {
                return webResponse.Error("表没有配置流程");
            }
            if (service.AddWorkFlowExecuting != null && !service.AddWorkFlowExecuting.Invoke(entity))
                return webResponse.Error();
            //写入流程
            var res = WorkFlowManager.AddProcese(entity, addWorkFlowExecuted: null, workFlowTableName: service.WorkFlowTableName);
            if (res.Status && (service.AddWorkFlowExecuted != null))
            {
                List<int> userIds = entity.GetTableCurrentStepAuditUserIds(service.WorkFlowTableName);
                service.AddWorkFlowExecuted?.Invoke(entity, userIds);
            }
            return webResponse.OK();
        }

        public static async Task<WebResponseContent> AddAuditProceseAsync<TEntity, TRepository>(this TEntity entity, ServiceBase<TEntity, TRepository> service)
         where TEntity : BaseEntity
         where TRepository : IRepository<TEntity>
        {
            WebResponseContent webResponse = new WebResponseContent();
            if (!WorkFlowManager.Exists<TEntity>(service.WorkFlowTableName))
            {
                return webResponse.Error("表没有配置流程");
            }
            if (service.AddWorkFlowExecuting != null && !service.AddWorkFlowExecuting.Invoke(entity))
                return webResponse.Error();
            if (service.AddWorkFlowExecutingAsync != null && !await service.AddWorkFlowExecutingAsync.Invoke(entity))
                return webResponse.Error();
            //写入流程
            var res = WorkFlowManager.AddProcese(entity, addWorkFlowExecuted: null, workFlowTableName: service.WorkFlowTableName);
            if (res.Status && (service.AddWorkFlowExecuted != null || service.AddWorkFlowExecutedAsync != null))
            {
                List<int> userIds = entity.GetTableCurrentStepAuditUserIds(service.WorkFlowTableName);
                service.AddWorkFlowExecuted?.Invoke(entity, userIds);
                if (service.AddWorkFlowExecutedAsync != null)
                {
                    await service.AddWorkFlowExecutedAsync.Invoke(entity, userIds);
                }
            }
            return webResponse.OK();
        }

        /// <summary>
        /// 获取反审的实体类数据
        /// </summary>
        public static TEntity GetAntiAuditEntity<TEntity, TRepository>(this AntiData antiData, ServiceBase<TEntity, TRepository> service)
           where TEntity : BaseEntity where TRepository : IRepository<TEntity>
        {
            Expression<Func<TEntity, bool>> whereExpression = typeof(TEntity).GetKeyName().CreateExpression<TEntity>(antiData.IsFlow ? antiData.Key : antiData.Key.ToString().Split(",")[0], LinqExpressionType.Equal);
            TEntity entity = service.repository.FindAsIQueryable(whereExpression).FirstOrDefault();
            return entity;
        }

        /// <summary>
        /// 反审
        /// </summary>
        public static WebResponseContent AntiAudit<TEntity, TRepository>(this AntiData antiData, ServiceBase<TEntity, TRepository> service, TEntity entity = null)
             where TEntity : BaseEntity where TRepository : IRepository<TEntity>
        {
            WebResponseContent baseWebResponse = new WebResponseContent();
            if (antiData.Key == null)
                return baseWebResponse.Error("未获取到参数!");
            entity = entity ?? antiData.GetAntiAuditEntity(service);
            if (entity == null)
            {
                return baseWebResponse.Error($"未查到数据,或者数据已被删除,id:{antiData.Key}");
            }
            var auditProperty = typeof(TEntity).GetAuditFieldPropertyInfo();
            if (auditProperty == null)
            {
                return baseWebResponse.Error("表缺少审核状态字段：AuditStatus");
            }
            antiData.IsFlow = WorkFlowManager.Exists<TEntity>(entity);
            if (!antiData.IsFlow)
            {
                int val = auditProperty.GetValue(entity).GetInt();
                if ((val == (int)AuditStatus.待审核 || val == (int)AuditStatus.草稿 || val == (int)AuditStatus.待提交))
                {
                    return baseWebResponse.Error("只能选择已审核数据");
                }
            }
            if (service.AntiAuditOnExecuting != null)
            {
                baseWebResponse = service.AntiAuditOnExecuting(entity);
                if (!baseWebResponse.Status) return baseWebResponse;
            }
            baseWebResponse = service.repository.DbContextBeginTransaction(() =>
            {
                if (antiData.IsFlow)
                {
                    baseWebResponse = WorkFlowManager.AntiAudit<TEntity>(antiData, service.repository.DbContext, entity, service.WorkFlowTableName);
                    if (!baseWebResponse.Status)
                        return baseWebResponse;
                }
                else
                {
                    var updateFileds = WorkFlowGeneric.UpdateAuditInfo<TEntity>(entity, (int)AuditStatus.待审核, antiData.AuditReason);
                    service.repository.Update(entity, updateFileds.ToArray(), true);
                    WorkFlowManager.AddAuditLog<TEntity>(new object[] { antiData.Key }, (int)AuditStatus.待审核, "反审：" + (antiData.AuditReason ?? ""));
                }
                if (service.AntiAuditOnExecuted != null)
                {
                    baseWebResponse = service.AntiAuditOnExecuted(entity);
                    if (!baseWebResponse.Status) return baseWebResponse;
                }
                return baseWebResponse.OK();
            });
            if (baseWebResponse.Status && string.IsNullOrEmpty(baseWebResponse.Message))
            {
                baseWebResponse.Message = "反审成功";
            }
            return baseWebResponse;
        }
    }
}

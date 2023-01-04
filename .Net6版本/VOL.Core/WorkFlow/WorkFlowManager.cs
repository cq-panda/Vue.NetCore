using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Reflection;
using System.Text;
using VOL.Core.DBManager;
using VOL.Core.Extensions;
using VOL.Core.ManageUser;
using VOL.Core.Utilities;
using VOL.Entity.DomainModels;

namespace VOL.Core.WorkFlow
{
    public static class WorkFlowManager
    {
        public static bool Exists<T>()
        {
            return WorkFlowContainer.Exists<T>();
        }

        public static bool Exists<T>(T entity)
        {
            return WorkFlowContainer.Exists<T>() && GetAuditStatusValue<T>(typeof(T).GetKeyProperty().GetValue(entity).ToString()) != null;
        }
        public static bool Exists(string table)
        {
            return WorkFlowContainer.Exists(table);
        }

        public static int GetAuditStatus<T>(string value)
        {
            return GetAuditStatusValue<T>(value) ?? 0;
        }

        public static int? GetAuditStatusValue<T>(string value)
        {
            return DBServerProvider.DbContext.Set<Sys_WorkFlowTable>()
                   .Where(x => x.WorkTable == typeof(T).GetEntityTableName() && x.WorkTableKey == value)
                   .Select(s => s.CurrentOrderId)
                   .FirstOrDefault();
        }

        private static void Rewrite<T>(T entity, Sys_WorkFlow workFlow, bool changeTableStatus) where T : class
        {
            var autditProperty = typeof(T).GetProperties().Where(x => x.Name.ToLower() == "auditstatus").FirstOrDefault();
            if (autditProperty == null)
            {
                return;
            }

            string value = typeof(T).GetKeyProperty().GetValue(entity).ToString();

            var dbContext = DBServerProvider.DbContext;


            var workTable = dbContext.Set<Sys_WorkFlowTable>().Where(x => x.WorkTableKey == value && x.WorkFlow_Id == workFlow.WorkFlow_Id)
                   .AsNoTracking()
                  .Include(x => x.Sys_WorkFlowTableStep).FirstOrDefault();
            if (workTable == null || workFlow.Sys_WorkFlowStep == null)
            {
                Console.WriteLine($"未查到流程数据，id：{ workFlow.WorkFlow_Id}");
                return;
            }
            workTable.CurrentOrderId = 1;
            workTable.AuditStatus = (int)AuditStatus.审核中;
            workTable.Sys_WorkFlowTableStep.ForEach(item =>
            {
                item.Enable = 0;
            });

            if (changeTableStatus)
            {
                dbContext.Entry(entity).State = EntityState.Detached;
                autditProperty.SetValue(entity, 0);
                dbContext.Entry(entity).Property(autditProperty.Name).IsModified = true;
            }

            var wlowTableStep = workFlow.Sys_WorkFlowStep.OrderBy(x => x.OrderId).Select(s => new Sys_WorkFlowTableStep()
            {
                Sys_WorkFlowTableStep_Id = Guid.NewGuid(),
                WorkFlowTable_Id = workTable.WorkFlowTable_Id,
                WorkFlow_Id = s.WorkFlow_Id,
                StepId = s.StepId,
                StepName = s.StepName,
                AuditId = s.StepType == (int)AuditType.用户审批 ? s.StepValue : null,
                StepType = s.StepType,
                StepValue = s.StepValue,
                OrderId = s.OrderId,
                Enable = 1,
                CreateDate = DateTime.Now,
            }).ToList();
            dbContext.Entry(workTable).State = EntityState.Detached;
            dbContext.Update(workTable);
            dbContext.AddRange(wlowTableStep);
            dbContext.SaveChanges();

        }
        /// <summary>
        /// 写入流程
        /// </summary>
        /// <typeparam name="T"></typeparam>
        /// <param name="entity"></param>
        /// <param name="rewrite">是否重新生成流程</param>
        /// <param name="changeTableStatus">是否修改原表的审批状态</param>
        public static void AddProcese<T>(T entity, bool rewrite = false, bool changeTableStatus = true) where T : class
        {
            string workTable = typeof(T).GetEntityTableName();

            Sys_WorkFlow workFlow = DBServerProvider.DbContext.Set<Sys_WorkFlow>()
                .Where(x => x.WorkTable == workTable)
                 .Include(x => x.Sys_WorkFlowStep)
                .FirstOrDefault();

            if (workFlow == null || workFlow.Sys_WorkFlowStep.Count == 0) return;
            //重新生成流程
            if (rewrite)
            {
                Rewrite(entity, workFlow, changeTableStatus);
                return;
            }

            var userInfo = UserContext.Current.UserInfo;
            Guid workFlowTable_Id = Guid.NewGuid();
            Sys_WorkFlowTable workFlowTable = new Sys_WorkFlowTable()
            {
                WorkFlowTable_Id = workFlowTable_Id,
                AuditStatus = (int)AuditStatus.审核中,
                CurrentOrderId = 1,
                Enable = 1,
                WorkFlow_Id = workFlow.WorkFlow_Id,
                WorkName = workFlow.WorkName,
                WorkTable = workTable,
                WorkTableKey = typeof(T).GetKeyProperty().GetValue(entity).ToString(),
                WorkTableName = workFlow.WorkTableName,
                CreateID = userInfo.User_Id,
                CreateDate = DateTime.Now,
                Creator = userInfo.UserTrueName,
                Sys_WorkFlowTableStep = workFlow.Sys_WorkFlowStep.OrderBy(x => x.OrderId).Select(s => new Sys_WorkFlowTableStep()
                {
                    Sys_WorkFlowTableStep_Id = Guid.NewGuid(),
                    WorkFlowTable_Id = workFlowTable_Id,
                    WorkFlow_Id = s.WorkFlow_Id,
                    StepId = s.StepId,
                    StepName = s.StepName,
                    AuditId = s.StepType == (int)AuditType.用户审批 ? s.StepValue : null,
                    StepType = s.StepType,
                    StepValue = s.StepValue,
                    OrderId = s.OrderId,
                    Enable = 1,
                    CreateDate = DateTime.Now,
                }).ToList()
            };
            DBServerProvider.DbContext.Set<Sys_WorkFlowTable>().Add(workFlowTable);
            DBServerProvider.DbContext.SaveChanges();
        }


        /// <summary>
        /// 进入流程审核
        /// </summary>
        /// <typeparam name="T"></typeparam>
        /// <param name="entity"></param>
        /// <param name="status"></param>
        /// <param name="remark"></param>
        /// <param name="autditProperty"></param>
        /// <param name="workFlowExecuting"></param>
        /// <param name="workFlowExecuted"></param>
        /// <returns></returns>
        public static WebResponseContent Audit<T>(T entity, AuditStatus status, string remark,
            PropertyInfo autditProperty,
             Func<T, AuditStatus, bool, WebResponseContent> workFlowExecuting,
             Func<T, AuditStatus, List<int>, bool, WebResponseContent> workFlowExecuted,
             bool init = false,
             Action<T, List<int>> initInvoke = null
            ) where T : class
        {
            WebResponseContent webResponse = new WebResponseContent(true);
            if (init)
            {
                if (!WorkFlowContainer.Exists<T>())
                {
                    return webResponse;
                }
            }
            var dbContext = DBServerProvider.DbContext;
            var query = dbContext.Set<T>();

            var keyProperty = typeof(T).GetKeyProperty();
            string key = keyProperty.GetValue(entity).ToString();
            string workTable = typeof(T).GetEntityTableName();

            Sys_WorkFlowTable workFlow = dbContext.Set<Sys_WorkFlowTable>()
                       .Where(x => x.WorkTable == workTable && x.WorkTableKey == key)
                        .Include(x => x.Sys_WorkFlowTableStep)
                       .FirstOrDefault();

            if (init)
            {
                if (workFlow.Sys_WorkFlowTableStep.Count == 0)
                {
                    return webResponse;
                }
                var step = workFlow.Sys_WorkFlowTableStep.Where(x => x.OrderId == 1).Select(s => new { s.StepType, s.StepValue }).FirstOrDefault();
                if (step != null)
                {
                    initInvoke?.Invoke(entity, GetAuditUserIds(step.StepType ?? 0, step.StepValue ?? 0));
                }

                return webResponse;
            }

            workFlow.AuditStatus = (int)status;
            if (workFlow == null || workFlow.Sys_WorkFlowTableStep.Count == 0)
            {
                autditProperty.SetValue(entity, (int)status);
                query.Update(entity);
                dbContext.SaveChanges();
                return webResponse;
            }

            var currnetStep = workFlow.Sys_WorkFlowTableStep.Where(x => x.OrderId == workFlow.CurrentOrderId).FirstOrDefault();
            if (currnetStep == null)
            {
                autditProperty.SetValue(entity, (int)status);
                query.Update(entity);
                dbContext.SaveChanges();
                return webResponse;
            }

            var nextStep = workFlow.Sys_WorkFlowTableStep.Where(x => x.OrderId == workFlow.CurrentOrderId + 1).FirstOrDefault();

            //指向下一个人审批
            if (nextStep != null && status == AuditStatus.审核通过)
            {
                workFlow.CurrentOrderId = nextStep.OrderId;
                //原表显示审核中状态
                autditProperty.SetValue(entity, (int)AuditStatus.审核中);
                workFlow.AuditStatus = (int)AuditStatus.审核中;
            }
            else
            {
                autditProperty.SetValue(entity, (int)status);
            }
            bool isLast = nextStep == null;

            if (workFlowExecuting != null)
            {
                webResponse = workFlowExecuting.Invoke(entity, status, isLast);
                if (!webResponse.Status)
                {
                    return webResponse;
                }
            }

            query.Update(entity);

            var user = UserContext.Current.UserInfo;
            currnetStep.AuditId = user.User_Id;
            currnetStep.Auditor = user.UserTrueName;
            currnetStep.AuditDate = DateTime.Now;
            currnetStep.AuditStatus = (int)status;
            currnetStep.Remark = remark;


            //dbContext.Entry(workFlow).Property("CurrentOrderId").IsModified = true;
            //dbContext.Entry(workFlow).Property("AuditStatus").IsModified = true;


            dbContext.Set<Sys_WorkFlowTable>().Update(workFlow);

            dbContext.SaveChanges();
            dbContext.Entry(workFlow).State = EntityState.Detached;
            if (workFlowExecuted != null)
            {
                webResponse = workFlowExecuted.Invoke(entity, status, GetAuditUserIds(nextStep?.StepType ?? 0, nextStep?.StepValue ?? 0), isLast);
            }
            return webResponse;
        }
        /// <summary>
        /// 获取审批人的id
        /// </summary>
        /// <param name="stepType"></param>
        /// <returns></returns>
        private static List<int> GetAuditUserIds(int stepType, int nextId = 0)
        {
            List<int> userIds = new List<int>();
            if (stepType == 0 || nextId == 0)
            {
                return userIds;
            }
            if (stepType == (int)AuditType.角色审批)
            {
                userIds = DBServerProvider.DbContext.Set<Sys_User>().Where(s => s.Role_Id == stepType).Take(50).Select(s => s.User_Id).ToList();
            }
            //else if (nextStep.StepType == (int)AuditType.部门审批)
            //{
            //    //部门审批待完
            //    // users = DBServerProvider.DbContext.Set<Sys_User>().Where(s => s.Role_Id == nextStep.StepValue).Take(50).Select(s => s.User_Id).ToList();
            //}
            else
            {
                userIds.Add(nextId);
            }
            return userIds;
        }
    }
}

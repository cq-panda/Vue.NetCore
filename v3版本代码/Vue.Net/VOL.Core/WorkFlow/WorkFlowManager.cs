using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Internal;
using OfficeOpenXml.FormulaParsing.Excel.Functions.Text;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Reflection;
using System.Text;
using System.Threading.Tasks;
using VOL.Core.DBManager;
using VOL.Core.EFDbContext;
using VOL.Core.Extensions;
using VOL.Core.Infrastructure;
using VOL.Core.ManageUser;
using VOL.Core.Services;
using VOL.Core.Utilities;
using VOL.Entity.DomainModels;
using static Npgsql.PostgresTypes.PostgresCompositeType;

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
            return WorkFlowContainer.Exists<T>() && GetAuditFlowTable<T>(typeof(T).GetKeyProperty().GetValue(entity).ToString()) != null;
        }
        public static bool Exists(string table)
        {
            return WorkFlowContainer.Exists(table);
        }
        /// <summary>
        /// 获取审批的数据
        /// </summary>
        public static async Task<object> GetAuditFormDataAsync(string tableKey, string table)
        {
            Type type = WorkFlowContainer.GetType(table);
            if (type == null)
            {
                return Array.Empty<object>();
            }
          
            var obj = typeof(WorkFlowManager).GetMethod("GetFormDataAsync").MakeGenericMethod(new Type[] { type })
                .Invoke(null, new object[] { tableKey, table }) as Task<object>;
            return await obj;
        }
        /// <summary>
        /// 审批表单数据查询与数据源转换
        /// </summary>
        /// <typeparam name="T"></typeparam>
        /// <param name="tableKey"></param>
        /// <param name="table"></param>
        /// <returns></returns>
        public static async Task<object> GetFormDataAsync<T>(string tableKey, string table) where T : class
        {
            string[] fields = WorkFlowContainer.GetFormFields(table);
            if (fields == null || fields.Length == 0)
            {
                return Array.Empty<object>();
            }
            var tableOptions = await DBServerProvider.DbContext.Set<Sys_TableColumn>().Where(c => c.TableName == table && fields.Contains(c.ColumnName))
                   .Select(s => new { s.ColumnName, s.ColumnCnName, s.DropNo, isDate = s.IsImage == 4 }).ToListAsync();

            var condition = typeof(T).GetKeyName().CreateExpression<T>(tableKey, Enums.LinqExpressionType.Equal);
            //动态分库应该查询对应的数据库
            var data = await DBServerProvider.DbContext.Set<T>().Where(condition).FirstOrDefaultAsync();
            if (data==null)
            {
                Console.WriteLine($"未查到数据,表：{table},id:{tableKey}");
                return Array.Empty<object>();
            }

            List<Sys_Dictionary> dictionaries = new List<Sys_Dictionary>();
            var dicNos = tableOptions.Select(s => s.DropNo).ToList();
            if (dicNos.Count > 0)
            {
                dictionaries = DictionaryManager.GetDictionaries(dicNos, true).ToList();
            }

            List<object> list = new List<object>();
            var properties = typeof(T).GetProperties();

            foreach (var field in fields)
            {
                var property = properties.Where(c => c.Name == field).FirstOrDefault();
                string value = property.GetValue(data)?.ToString();

                var option = tableOptions.Where(c => c.ColumnName == field).FirstOrDefault();
                string name = option?.ColumnCnName;
                if (string.IsNullOrEmpty(name))
                {
                    name = property.GetDisplayName();
                }
                if (option == null || string.IsNullOrEmpty(value))
                {
                    list.Add(new
                    {
                        name,
                        value = value ?? ""
                    });
                    continue;
                }
                if (option.isDate)
                {
                    value = value.GetDateTime().Value.ToString("yyyy-MM-dd");
                }
                else if (!string.IsNullOrEmpty(option.DropNo))
                {
                    string val = dictionaries.Where(c => c.DicNo == option.DropNo).FirstOrDefault()
                         ?.Sys_DictionaryList
                         //这里多选的暂时没处理
                         ?.Where(c => c.DicValue == value)?.Select(s => s.DicName)
                         .FirstOrDefault();
                    if (!string.IsNullOrEmpty(val))
                    {
                        value = val;
                    }
                }
                list.Add(new
                {
                    name,
                    value
                });
            }
            return list;
        }

        public static int GetAuditStatus<T>(string value)
        {
            return GetAuditFlowTable<T>(value)?.AuditStatus ?? 0;
        }

        public static Sys_WorkFlowTable GetAuditFlowTable<T>(string workTableKey)
        {
            var table = DBServerProvider.DbContext.Set<Sys_WorkFlowTable>()
                   .Where(x => x.WorkTable == typeof(T).GetEntityTableName() && x.WorkTableKey == workTableKey)
                   // .Select(s => new { s.CurrentStepId,s.AuditStatus})
                   .FirstOrDefault();
            return table;
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
            if (workTable == null || workFlow.Sys_WorkFlowStep == null || workFlow.Sys_WorkFlowStep.Count == 0)
            {
                Console.WriteLine($"未查到流程数据，id：{workFlow.WorkFlow_Id}");
                return;
            }
            //  workTable.CurrentOrderId = 1;

            //这里还未处理回退到上一个节点

            //重新设置第一个节点(有可能是返回上一个节点)
            string startStepId = workTable.Sys_WorkFlowTableStep.Where(x => x.StepAttrType == StepType.start.ToString())
                 .Select(s => s.StepId).FirstOrDefault();

            workTable.CurrentStepId = workTable.Sys_WorkFlowTableStep.Where(x => x.ParentId == startStepId).Select(s => s.StepId).FirstOrDefault();

            workTable.AuditStatus = (int)AuditStatus.待审核;
            workTable.Sys_WorkFlowTableStep.ForEach(item =>
            {
                item.Enable = 0;
                item.AuditId = null;
                item.Auditor = null;
                item.AuditDate = null;
                item.Remark = null;
            });

            if (changeTableStatus)
            {
                dbContext.Entry(entity).State = EntityState.Detached;
                autditProperty.SetValue(entity, 0);
                dbContext.Entry(entity).Property(autditProperty.Name).IsModified = true;
            }

            dbContext.Entry(workTable).State = EntityState.Detached;
            dbContext.Update(workTable);
            dbContext.SaveChanges();

        }
        /// <summary>
        /// 新建时写入流程
        /// </summary>
        /// <typeparam name="T"></typeparam>
        /// <param name="entity"></param>
        /// <param name="rewrite">是否重新生成流程</param>
        /// <param name="changeTableStatus">是否修改原表的审批状态</param>
        public static void AddProcese<T>(T entity, bool rewrite = false, bool changeTableStatus = true, Action<T, List<int>> addWorkFlowExecuted = null) where T : class
        {
            WorkFlowTableOptions workFlow = WorkFlowContainer.GetFlowOptions(entity);
            //没有对应的流程信息
            if (workFlow == null || workFlow.FilterList.Count == 0)
            {
                return;
            }
            workFlow.WorkTableName = WorkFlowContainer.GetName<T>();
            string workTable = typeof(T).GetEntityTableName();

            ////重新生成流程
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
                AuditStatus = (int)AuditStatus.待审核,
                Enable = 1,
                WorkFlow_Id = workFlow.WorkFlow_Id,
                WorkName = workFlow.WorkName,
                WorkTable = workTable,
                WorkTableKey = typeof(T).GetKeyProperty().GetValue(entity).ToString(),
                WorkTableName = workFlow.WorkTableName,
                CreateID = userInfo.User_Id,
                CreateDate = DateTime.Now,
                Creator = userInfo.UserTrueName
            };
            //生成流程的下一步
            var steps = workFlow.FilterList.Where(x => x.StepAttrType == StepType.start.ToString()).Select(s => new Sys_WorkFlowTableStep()
            {
                Sys_WorkFlowTableStep_Id = Guid.NewGuid(),
                WorkFlowTable_Id = workFlowTable_Id,
                WorkFlow_Id = workFlow.WorkFlow_Id,
                StepId = s.StepId,
                StepName = s.StepName ?? "流程开始",
                StepAttrType = s.StepAttrType,
                NextStepId = null,
                ParentId = null,
                StepType = s.StepType,
                StepValue = s.StepValue,
                OrderId = 0,
                Enable = 1,
                CreateDate = DateTime.Now,
                Creator = userInfo.UserTrueName,
                CreateID = userInfo.User_Id
            }).ToList();

            var entities = new List<T>() { entity };
            for (int i = 0; i < steps.Count; i++)
            {
                var item = steps[i];
                //查找下一个满足条件的节点数据
                FilterOptions filter = workFlow.FilterList.Where(c => c.ParentIds.Contains(item.StepId)
                                                                && c.Expression != null
                                                                && entities.Any(((Func<T, bool>)c.Expression))
                                                                ).FirstOrDefault();
                //未找到满足条件的找无条件的节点
                if (filter == null)
                {
                    filter = workFlow.FilterList.Where(c => c.ParentIds.Contains(item.StepId) && c.Expression == null).FirstOrDefault();
                }
                if (filter != null)
                {
                    var setp = workFlow.Sys_WorkFlowStep.Where(x => x.StepId == filter.StepId).Select(s => new Sys_WorkFlowTableStep()
                    {
                        Sys_WorkFlowTableStep_Id = Guid.NewGuid(),
                        WorkFlowTable_Id = workFlowTable_Id,
                        WorkFlow_Id = s.WorkFlow_Id,

                        StepId = s.StepId,
                        StepName = s.StepName,
                        StepAttrType = s.StepAttrType,
                        NextStepId = null,
                        ParentId = item.StepId,
                        StepType = s.StepType,
                        StepValue = s.StepValue,
                        OrderId = i + 1,
                        Enable = 1,
                        CreateDate = DateTime.Now,
                    }).FirstOrDefault();

                    //显示后续部门与角色审批人待完

                    //设置下个审核节点
                    item.NextStepId = setp.StepId;
                    if (!steps.Any(x => x.StepId == setp.StepId))
                    {
                        steps.Add(setp);
                    }
                }
                else
                {
                    //找不到满足条件的节点，直接结束流程
                    var end = workFlow.Sys_WorkFlowStep.Where(c => c.StepAttrType == StepType.end.ToString()).ToList();

                    if (end.Count > 0)
                    {
                        item.NextStepId = end[0].StepId;
                        steps.Add(end.Select(s => new Sys_WorkFlowTableStep()
                        {
                            Sys_WorkFlowTableStep_Id = Guid.NewGuid(),
                            WorkFlowTable_Id = workFlowTable_Id,
                            WorkFlow_Id = s.WorkFlow_Id,
                            StepId = s.StepId,
                            StepName = s.StepName,
                            StepAttrType = s.StepAttrType,
                            NextStepId = null,
                            ParentId = item.StepId,
                            StepType = s.StepType,
                            StepValue = s.StepValue,
                            OrderId = i + 1,
                            Enable = 1,
                            CreateDate = DateTime.Now,
                        }).FirstOrDefault());
                        i = steps.Count + 1;
                    }
                }
            }

            //foreach (var setp in steps)
            //{
            //    if (setp.StepType == (int)AuditType.用户审批)
            //    {
            //        setp.AuditId = setp.StepValue.GetInt();
            //    }
            //}

            //没有满足流程的数据不走流程
            int count = steps.Where(x => x.StepAttrType != StepType.start.ToString() && x.StepAttrType != StepType.end.ToString()).Count();
            if (count == 0)
            {
                return;
            }

            //设置进入流程后的第一个审核节点,(开始节点的下一个节点)
            var nodeInfo = steps.Where(x => x.ParentId == steps[0].StepId).Select(s => new { s.StepId, s.StepName,s.StepType,s.StepValue }).FirstOrDefault();
            workFlowTable.CurrentStepId = nodeInfo.StepId;
            workFlowTable.StepName = nodeInfo.StepName;

            workFlowTable.Sys_WorkFlowTableStep = steps;

            //写入日志
            var log = new Sys_WorkFlowTableAuditLog()
            {
                Id = Guid.NewGuid(),
                WorkFlowTable_Id = workFlowTable.WorkFlowTable_Id,
                CreateDate = DateTime.Now,
                AuditStatus = (int)AuditStatus.待审核,
                Remark = $"[{userInfo.UserTrueName}]提交了数据"
            };
            var dbContext = DBServerProvider.DbContext;
            dbContext.Set<Sys_WorkFlowTable>().Add(workFlowTable);
            dbContext.Set<Sys_WorkFlowTableAuditLog>().Add(log);
            dbContext.SaveChanges();

            if (addWorkFlowExecuted!=null)
            {
                var userIds = GetAuditUserIds(nodeInfo.StepType ?? 0, nodeInfo.StepValue);
                addWorkFlowExecuted.Invoke(entity, userIds);
            }
        }


        /// <summary>
        /// 审核
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
            dbContext.QueryTracking = true; ;
            var query = dbContext.Set<T>();

            var keyProperty = typeof(T).GetKeyProperty();
            string key = keyProperty.GetValue(entity).ToString();
            string workTable = typeof(T).GetEntityTableName();

            Sys_WorkFlowTable workFlow = dbContext.Set<Sys_WorkFlowTable>()
                       .Where(x => x.WorkTable == workTable && x.WorkTableKey == key)
                        .Include(x => x.Sys_WorkFlowTableStep)
                       .FirstOrDefault();

            if (workFlow == null)
            {
                return webResponse.Error("未查到流程信息,请检查数据是否被删除");
            }


            workFlow.AuditStatus = (int)status;

            var currentStep = workFlow.Sys_WorkFlowTableStep.Where(x => x.StepId == workFlow.CurrentStepId).FirstOrDefault();

            if (currentStep == null)
            {
                return webResponse.Error($"未查到流程陈点[workFlow.CurrentStepId]信息,请检查数据是否被删除");
            }
            Sys_WorkFlowTableStep nextStep = null;
            //获取下一步审核id
            var nextStepId = currentStep.NextStepId;

            nextStep = workFlow.Sys_WorkFlowTableStep.Where(x => x.StepId == nextStepId).FirstOrDefault();

            var user = UserContext.Current.UserInfo;
            //生成审核记录
            var log = new Sys_WorkFlowTableAuditLog()
            {
                Id = Guid.NewGuid(),
                StepId = currentStep.StepId,
                WorkFlowTable_Id = currentStep.WorkFlowTable_Id,
                WorkFlowTableStep_Id = currentStep.Sys_WorkFlowTableStep_Id,
                AuditDate = DateTime.Now,
                AuditId = user.User_Id,
                Auditor = user.UserTrueName,
                AuditResult = remark,
                Remark = remark,
                AuditStatus = (int)status,
                CreateDate = DateTime.Now,
                StepName = currentStep.StepName
            };
            var filterOptions = WorkFlowContainer.GetFlowOptions(x => x.WorkFlow_Id == workFlow.WorkFlow_Id)
                 .FirstOrDefault()
                 ?.FilterList
                 ?.Where(x => x.StepId == currentStep.StepId)
                 ?.FirstOrDefault();
            if (filterOptions != null)
            {
                //审核未通过或者驳回
                if (!CheckAuditStatus(workFlow, filterOptions, currentStep, status))
                {
                    //记录日志
                    dbContext.Set<Sys_WorkFlowTableAuditLog>().Add(log);

                    string msg = null;
                    if (AuditStatus.审核未通过 == status)
                    {
                        if (filterOptions.AuditRefuse == (int)AuditRefuse.返回上一节点)
                        {
                            msg = "审批未通过,返回上一节点";
                        }
                        else if (filterOptions.AuditRefuse == (int)AuditRefuse.流程重新开始)
                        {
                            msg = "审批未通过,流程重新开始";
                        }
                    }
                    else if (AuditStatus.驳回 == status)
                    {
                        if (filterOptions.AuditBack == (int)AuditBack.返回上一节点)
                        {
                            msg = "审批被驳回,返回上一节点";
                        }
                        else if (filterOptions.AuditBack == (int)AuditBack.流程重新开始)
                        {
                            msg = "审批被驳回,流程重新开始";
                        }
                    }
                    if (msg!=null)
                    {
                        var auditLog = new Sys_WorkFlowTableAuditLog()
                        {
                            Id = Guid.NewGuid(),
                            StepId = currentStep.StepId,
                            WorkFlowTable_Id = currentStep.WorkFlowTable_Id,
                            WorkFlowTableStep_Id = currentStep.Sys_WorkFlowTableStep_Id,
                            AuditDate = DateTime.Now,
                            AuditId = user.User_Id,
                            Auditor = user.UserTrueName,
                            AuditResult = remark,
                            Remark = msg,
                            AuditStatus = (int)status,
                            CreateDate = DateTime.Now,
                            StepName = currentStep.StepName
                        };
                        dbContext.Set<Sys_WorkFlowTableAuditLog>().Add(auditLog);
                    }
                    //autditProperty.SetValue(entity, (int)status);
                    //query.Update(entity);
                    //修改状态
                    dbContext.Set<Sys_WorkFlowTable>().Update(workFlow);
                    dbContext.SaveChanges();
                    dbContext.Entry(workFlow).State = EntityState.Detached;

                    //发送邮件(appsettings.json配置文件里添加邮件信息)
                    SendMail(workFlow, filterOptions, nextStep, dbContext);

                    if (workFlowExecuted != null)
                    {
                        webResponse = workFlowExecuted.Invoke(entity, status, GetAuditUserIds(nextStep?.StepType ?? 0, nextStep?.StepValue), false);
                    }
                    return webResponse;
                }
            }


            if (autditProperty == null)
            {
                autditProperty = typeof(T).GetProperties().Where(s => s.Name.ToLower() == "auditstatus").FirstOrDefault();
            }
            bool isLast = false;


            //更新明细记录
            workFlow.Sys_WorkFlowTableStep.ForEach(x =>
            {
                if (workFlow.CurrentStepId == x.StepId)
                {
                    x.AuditId = user.User_Id;
                    x.Auditor = user.UserTrueName;
                    x.AuditDate = DateTime.Now;
                    //如果审核拒绝或驳回并退回上一步，待完
                    x.AuditStatus = (int)status;
                    x.Remark = remark;
                }
            });

            //没有找到下一步审批，审核完成
            if ((nextStep == null || nextStep.StepAttrType == StepType.end.ToString()))
            {
                if (status == AuditStatus.审核通过)
                {
                    workFlow.CurrentStepId = "审核完成";
                }
                else
                {
                    workFlow.CurrentStepId = "流程结束";
                }
                workFlow.AuditStatus = (int)status;

                //发送邮件(appsettings.json配置文件里添加邮件信息)
                SendMail(workFlow, filterOptions, nextStep, dbContext);

                autditProperty.SetValue(entity, (int)status);
                dbContext.Set<Sys_WorkFlowTable>().Update(workFlow);
                query.Update(entity);
                dbContext.Set<Sys_WorkFlowTableAuditLog>().Add(log);
                dbContext.SaveChanges();

                if (workFlowExecuted != null)
                {
                    webResponse = workFlowExecuted.Invoke(entity, status, GetAuditUserIds(nextStep?.StepType ?? 0, nextStep?.StepValue), true);
                }

                return webResponse;
            }

            //指向下一个人审批
            if (nextStep != null && status == AuditStatus.审核通过)
            {
                workFlow.CurrentStepId = nextStep.StepId;
                //原表显示审核中状态
                autditProperty.SetValue(entity, (int)AuditStatus.审核中);
                workFlow.AuditStatus = (int)AuditStatus.审核中;
            }
            else
            {
                autditProperty.SetValue(entity, (int)status);
            }


            //下一个节点=null或节下一个节点为结束节点，流程结束
            if (nextStep == null || workFlow.Sys_WorkFlowTableStep.Exists(c => c.StepId == nextStep.StepId && c.StepAttrType == StepType.end.ToString()))
            {
                isLast = true;
            }

            if (workFlowExecuting != null)
            {
                webResponse = workFlowExecuting.Invoke(entity, status, isLast);
                if (!webResponse.Status)
                {
                    return webResponse;
                }
            }

            query.Update(entity);
            dbContext.Set<Sys_WorkFlowTable>().Update(workFlow);
            dbContext.Set<Sys_WorkFlowTableAuditLog>().Add(log);

            dbContext.SaveChanges();
            dbContext.Entry(workFlow).State = EntityState.Detached;
            if (workFlowExecuted != null)
            {
                webResponse = workFlowExecuted.Invoke(entity, status, GetAuditUserIds(nextStep?.StepType ?? 0, nextStep?.StepValue), isLast);
            }
            SendMail(workFlow, filterOptions, nextStep, dbContext);
            return webResponse;

        }

        private static bool CheckAuditStatus(Sys_WorkFlowTable workFlow, FilterOptions filterOptions, Sys_WorkFlowTableStep currentStep, AuditStatus status)
        {
            //如果审核拒绝或驳回并退回上一步，待完
            //重新配置流程待完
            if (status != AuditStatus.审核未通过 && status != AuditStatus.驳回)
            {
                return true;
            }
            if (filterOptions.AuditRefuse == (int)AuditRefuse.返回上一节点 || filterOptions.AuditBack == (int)AuditBack.返回上一节点)
            {
                var preStep = workFlow.Sys_WorkFlowTableStep.Where(x => x.NextStepId == currentStep.StepId && x.StepAttrType == StepType.node.ToString()).FirstOrDefault();
                if (preStep != null)
                {
                    preStep.AuditStatus = null;
                    preStep.AuditId = null;
                    preStep.AuditDate = null;
                    preStep.Auditor = null;

                    workFlow.CurrentStepId = preStep.StepId;
                    workFlow.AuditStatus = (int)AuditStatus.审核中;

                    DBServerProvider.DbContext.Update(preStep);
                }

                return false;
            }
            else if (filterOptions.AuditRefuse == (int)AuditRefuse.流程重新开始 || filterOptions.AuditBack == (int)AuditBack.流程重新开始)
            {
                //重新开始
                var steps = workFlow.Sys_WorkFlowTableStep.Where(x => x.StepAttrType == StepType.node.ToString() && (x.AuditStatus >= 0)).ToList();
                if (steps.Count > 0)
                {
                    foreach (var item in steps)
                    {
                        item.AuditStatus = null;
                        item.AuditId = null;
                        item.AuditDate = null;
                        item.Auditor = null;
                    }
                    //重新指向第一个节点
                    workFlow.CurrentStepId = steps.OrderBy(c => c.OrderId).Select(c => c.StepId).FirstOrDefault();
                    workFlow.AuditStatus = (int)AuditStatus.审核中;

                    DBServerProvider.DbContext.UpdateRange(steps);
                }
                return false;
            }
            return true;
        }

        private static void SendMail(Sys_WorkFlowTable workFlow, FilterOptions filterOptions, Sys_WorkFlowTableStep nextStep, VOLContext dbContext)
        {
            if (filterOptions.SendMail != 1)
            {
                return;
            }
            if (nextStep == null)
            {
                nextStep = new Sys_WorkFlowTableStep() { };
            }
            //审核发送邮件通知待完
            var userIds = GetAuditUserIds(nextStep.StepType ?? 0, nextStep.StepValue);
            if (userIds.Count == 0)
            {
                return;
            }
            var emails = dbContext.Set<Sys_User>()
                 .Where(x => userIds.Contains(x.User_Id) && x.Email != null & x.Email != "").Select(s => s.Email)
                .ToList();
            Task.Run(() =>
            {
                string msg = "";
                try
                {
                    string title = $"有新的任务待审批：流程【{workFlow.WorkName}】,任务【{nextStep.StepName}】";
                    MailHelper.Send(title, title, string.Join(";", emails));
                    msg = $"审批流程发送邮件,流程名称：{workFlow.WorkName},流程id:{workFlow.WorkFlow_Id},步骤:{nextStep.StepName},步骤Id:{nextStep.StepId},收件人:{string.Join(";", emails)}";
                    Logger.AddAsync(msg);
                }
                catch (Exception ex)
                {
                    msg += "邮件发送异常：";
                    Logger.AddAsync(msg, ex.Message + ex.StackTrace);
                }
            });
        }

        /// <summary>
        /// 获取审批人的id
        /// </summary>
        /// <param name="stepType"></param>
        /// <returns></returns>
        private static List<int> GetAuditUserIds(int stepType, string nextId = null)
        {
            List<int> userIds = new List<int>();
            if (stepType == 0 || string.IsNullOrEmpty(nextId))
            {
                return userIds;
            }
            if (stepType == (int)AuditType.角色审批)
            {
                int roleId = nextId.GetInt();
                userIds = DBServerProvider.DbContext.Set<Sys_User>().Where(s => s.Role_Id == roleId).Take(50).Select(s => s.User_Id).ToList();
            }
            else if (stepType == (int)AuditType.部门审批)
            {
                Guid departmentId = nextId.GetGuid() ?? Guid.Empty;
                userIds = DBServerProvider.DbContext.Set<Sys_UserDepartment>().Where(s => s.DepartmentId == departmentId && s.Enable == 1).Take(50).Select(s => s.UserId).ToList();
            }
            else
            {
                return nextId.Split(",").Select(c => c.GetInt()).ToList();
            }
            return userIds;
        }
    }
}

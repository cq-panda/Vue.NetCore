using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Internal;
using Microsoft.Extensions.Primitives;
using OfficeOpenXml.FormulaParsing.Excel.Functions.Math;
using OfficeOpenXml.FormulaParsing.Excel.Functions.Text;
using SkiaSharp;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Net;
using System.Reflection;
using System.Text;
using System.Threading.Tasks;
using VOL.Core.Configuration;
using VOL.Core.DBManager;
using VOL.Core.EFDbContext;
using VOL.Core.Extensions;
using VOL.Core.Infrastructure;
using VOL.Core.ManageUser;
using VOL.Core.Services;
using VOL.Core.UserManager;
using VOL.Core.Utilities;
using VOL.Entity.DomainModels;


namespace VOL.Core.WorkFlow
{
    public static class WorkFlowManager
    {
        public static bool Exists<T>(string workFlowTableName = null)
        {
            return WorkFlowContainer.Exists<T>(workFlowTableName);
        }

        public static bool Exists<T>(T entity, string workFlowTableName = null)
        {
            return WorkFlowContainer.Exists<T>(workFlowTableName) && GetAuditFlowTable<T>(typeof(T).GetKeyProperty().GetValue(entity).ToString(), workFlowTableName) != null;
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
            var detailOptions = WorkFlowContainer.GetDetail(type).FirstOrDefault();


            var obj = typeof(WorkFlowManager).GetMethod("GetFormDataAsync").MakeGenericMethod(new Type[] { type, detailOptions?.Type ?? type })
                .Invoke(null, new object[] { tableKey, table, detailOptions }) as Task<object>;
            return await obj;
        }
        /// <summary>
        /// 审批表单数据查询与数据源转换
        /// </summary>
        /// <typeparam name="T"></typeparam>
        /// <param name="tableKey"></param>
        /// <param name="table"></param>
        /// <returns></returns>
        public static async Task<object> GetFormDataAsync<T, Detail>(string tableKey, string table, WorkFlowFormDetails flowFormDetails)
            where T : class where Detail : class
        {
            string[] fields = WorkFlowContainer.GetFormFields(table);
            if (fields == null || fields.Length == 0)
            {
                return Array.Empty<object>();
            }

            string keyName = typeof(T).GetKeyName();
            var condition = keyName.CreateExpression<T>(tableKey, Enums.LinqExpressionType.Equal);
            //动态分库应该查询对应的数据库


            var data = await DBServerProvider.DbContext.Set<T>().Where(condition).FirstOrDefaultAsync();
            if (data == null)
            {
                Console.WriteLine($"未查到数据,表：{table},id:{tableKey}");
                return Array.Empty<object>();
            }

            var mainObj = typeof(WorkFlowManager).GetMethod("GetFormData")
                .MakeGenericMethod(new Type[] { typeof(T) })
              .Invoke(null, new object[] { new List<T>() { data }, fields });


            var mainList = (List<object>)mainObj;

            if (mainList.Count == 0)
            {
                string msg = $"未查到审核流程表【{typeof(T).Name}】id【{tableKey}】数据";
                Console.WriteLine(msg);
                Logger.Error(msg);
                return new
                {
                    data = mainList[0]
                };
            }

            //获取明细表配置
            if (flowFormDetails != null)
            {
                var detailCondition = keyName.CreateExpression<Detail>(tableKey, Enums.LinqExpressionType.Equal);
                var detailData = await DBServerProvider.DbContext.Set<Detail>().Where(detailCondition)
                    .FlowQuery<Detail>()
                    .ToListAsync();

                var detailObj = typeof(WorkFlowManager).GetMethod("GetFormData")
                                       .MakeGenericMethod(new Type[] { typeof(Detail) })
                                       .Invoke(null, new object[] { detailData, flowFormDetails.FormFields });
                return new
                {
                    key = keyName,
                    data = mainList[0],
                    detail = new
                    {
                        name = typeof(Detail).GetEntityTableCnName(),
                        data = detailObj
                    }
                };
            }

            return new
            {
                key = keyName,
                data = mainList[0]
            };
        }
        public static List<object> GetFormData<T>(List<T> enities, string[] fields) where T : class
        {
            string table = typeof(T).Name;
            var tableOptions = DBServerProvider.DbContext.Set<Sys_TableColumn>()
                .Where(c => c.TableName == table && fields.Contains(c.ColumnName))
                           .Select(s => new
                           {
                               s.ColumnName,
                               s.ColumnCnName,
                               s.DropNo,
                               isDate = s.IsImage == 4,
                               s.ColumnType,
                               s.EditRowNo,
                               s.EditType,
                               s.IsNull
                           }).ToList();

            List<Sys_Dictionary> dictionaries = new List<Sys_Dictionary>();

            var dicNos = tableOptions.Select(s => s.DropNo).ToList();
            if (dicNos.Count > 0)
            {
                dictionaries = DictionaryManager.GetDictionaries(dicNos, true).ToList();
            }
            string[] editFormFeilds = WorkFlowContainer.GetEditFields(table) ?? new string[] { };
            List<object> list = new List<object>();
            var properties = typeof(T).GetProperties();
            string[] editType = new string[] { "file", "img", "excel", "editor" };
            int index = 0;
            foreach (var data in enities)
            {
                index++;
                Dictionary<string, object> item = new Dictionary<string, object>();
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
                        if (editFormFeilds.Contains(field))
                        {
                            item[field] = new
                            {
                                name = name,
                                field = field,
                                value = value,
                                isEdit = true,
                                editRow = option?.EditRowNo,
                                editType = option?.EditType,
                                formType = option?.EditType,
                                require = option?.IsNull == 1 ? false : true,
                                dropNo = option?.DropNo
                            };
                        }
                        else
                        {
                            item[field] = new
                            {
                                name = name,
                                field = field,
                                value = value,
                                formType = option.EditType,
                                dropNo = option.DropNo
                            };
                        }
                        continue;
                    }
                    string orgVal = value;
                    if (option.isDate)
                    {
                        value = value.GetDateTime().Value.ToString("yyyy-MM-dd");
                    }
                    else if (option.ColumnType == "DateTime")
                    {
                        value = value.GetDateTime().Value.ToString("yyyy-MM-dd HH:mm:sss");
                    }
                    else if (!string.IsNullOrEmpty(option.DropNo))
                    {
                        string val = null;
                        if (option.EditType == "selectList" || option.EditType == "checkbox" || option.EditType == "treeSelect")
                        {
                            string[] arr = value.Split(",");
                            arr = dictionaries.Where(c => c.DicNo == option.DropNo).FirstOrDefault()
                                   ?.Sys_DictionaryList
                                   ?.Where(c => arr.Contains(c.DicValue))?.Select(s => s.DicName)
                                   .ToArray();
                            val = string.Join(",", arr);
                        }
                        else
                        {
                            val = dictionaries.Where(c => c.DicNo == option.DropNo).FirstOrDefault()
                             ?.Sys_DictionaryList
                             ?.Where(c => c.DicValue == value)?.Select(s => s.DicName)
                             .FirstOrDefault();
                        }
                        if (!string.IsNullOrEmpty(val))
                        {
                            value = val;
                        }
                    }
                    if (editFormFeilds.Contains(field))
                    {
                        item[field] = new
                        {
                            name = name,
                            field = field,
                            value = value,
                            orgVal,
                            isEdit = true,
                            formType = option.EditType,
                            editRow = option.EditRowNo,
                            editType = option.EditType,
                            require = option?.IsNull == 1 ? false : true,
                            dropNo = option.DropNo
                        };
                    }
                    else
                    {
                        item[field] = new
                        {
                            name = name,
                            field = field,
                            value = value,
                            orgVal,
                            formType = option.EditType,
                            dropNo = option.DropNo
                        };
                    }

                }
                list.Add(item);
            }
            return list;
        }



        public static int GetAuditStatus<T>(string value, string workFlowTableName)
        {
            return GetAuditFlowTable<T>(value, workFlowTableName)?.AuditStatus ?? 0;
        }

        public static Sys_WorkFlowTable GetAuditFlowTable<T>(string workTableKey, string workFlowTableName = null)
        {
            var table = DBServerProvider.DbContext.Set<Sys_WorkFlowTable>()
                   .Where(x => x.WorkTable == (workFlowTableName ?? typeof(T).GetEntityTableName()) && x.WorkTableKey == workTableKey)
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
                  .Include(x => x.Sys_WorkFlowTableStep).ToList().FirstOrDefault();
            if (workTable == null || workFlow.Sys_WorkFlowStep == null || workFlow.Sys_WorkFlowStep.Count == 0)
            {
                Console.WriteLine($"未查到流程数据，id：{workFlow.WorkFlow_Id}");
                return;
            }
            //  workTable.CurrentOrderId = 1;
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
        public static void AddProcese<T>(T entity, bool rewrite = false, bool changeTableStatus = true,
            Action<T, List<int>> addWorkFlowExecuted = null, bool checkId = false,
            string workFlowTableName = null) where T : class
        {
            WorkFlowTableOptions workFlow = WorkFlowContainer.GetFlowOptions(entity, workFlowTableName);
            //没有对应的流程信息
            if (workFlow == null || workFlow.FilterList.Count == 0)
            {
                return;
            }
            workFlow.WorkTableName = WorkFlowContainer.GetName<T>(workFlowTableName);
            string workTable = workFlowTableName ?? typeof(T).GetEntityTableName();

            ////重新生成流程
            if (rewrite)
            {
                Rewrite(entity, workFlow, changeTableStatus);
                return;
            }

            var auditProperty = typeof(T).GetProperties().Where(x => x.Name.ToLower() == "auditstatus").FirstOrDefault();
            if (auditProperty == null)
            {
                Console.WriteLine("表缺少审核状态字段：AuditStatus");
            }
            int auditStatus = (int)workFlow.DefaultAuditStatus;
            string tableKey = typeof(T).GetKeyProperty().GetValue(entity).ToString();

            List<Sys_WorkFlowTableAuditLog> logHis = null;
            //提交的草稿直接删除
            if (checkId)
            {
                var list = DBServerProvider.DbContext.Set<Sys_WorkFlowTable>()
                     .Where(x => x.WorkTable == workTable && x.WorkTableKey == tableKey)
                     .Include(c => c.Sys_WorkFlowTableStep)
                     .AsNoTracking()
                     .ToList();
                if (list.Count > 0)
                {
                    DBServerProvider.DbContext.Set<Sys_WorkFlowTable>().RemoveRange(list);
                    DBServerProvider.DbContext.SaveChanges();
                    logHis = DBServerProvider.DbContext.Set<Sys_WorkFlowTableAuditLog>()
                        .Where(x => x.WorkFlowTable_Id == list[0].WorkFlowTable_Id)
                        .ToList();
                    foreach (var item in logHis)
                    {
                        item.Id = Guid.NewGuid();
                    }
                }
                auditStatus = (int)AuditStatus.待审核;
            }


            auditProperty.SetValue(entity, auditStatus);

            var userInfo = UserContext.Current.UserInfo;
            Guid workFlowTable_Id = Guid.NewGuid();
            Sys_WorkFlowTable workFlowTable = new Sys_WorkFlowTable()
            {
                WorkFlowTable_Id = workFlowTable_Id,
                AuditStatus = auditStatus,//(int)AuditStatus.待审核,
                Enable = 1,
                WorkFlow_Id = workFlow.WorkFlow_Id,
                WorkName = workFlow.WorkName,
                WorkTable = workTable,
                WorkTableKey = tableKey,
                WorkTableName = workFlow.WorkTableName,
                CreateID = userInfo.User_Id,
                CreateDate = DateTime.Now,
                Creator = userInfo.UserTrueName
            };
            //生成标题模板
            WorkFlowGeneric.CreateTitleTemplate(entity, workFlowTable, workFlow);
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
            FilterOptions filterOption = null;
            for (int i = 0; i < steps.Count; i++)
            {
                var item = steps[i];
                //查找下一个满足条件的节点数据
                //2024.01.22优化表达式条件判断
                FilterOptions filter = workFlow.FilterList
                    .Where(c => c.ParentIds.Contains(item.StepId) && c.FieldFilters.CheckFilter(entities, c.Expression))
                    .FirstOrDefault();
                //&& c.Expression != null
                //&& entities.Any(((Func<T, bool>)c.Expression))

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
                        //2023.10.24生成多个节点
                        if (!string.IsNullOrEmpty(setp.StepValue) && setp.StepValue.Contains(","))
                        {
                            var ids = setp.StepValue.Split(",");
                            foreach (string id in ids)
                            {
                                steps.Add(new Sys_WorkFlowTableStep()
                                {
                                    Sys_WorkFlowTableStep_Id = Guid.NewGuid(),
                                    WorkFlowTable_Id = setp.WorkFlowTable_Id,
                                    WorkFlow_Id = setp.WorkFlow_Id,

                                    StepId = setp.StepId,
                                    StepName = setp.StepName,
                                    StepAttrType = setp.StepAttrType,
                                    NextStepId = null,
                                    ParentId = setp.ParentId,
                                    StepType = setp.StepType,
                                    StepValue = id,// setp.StepValue,
                                    OrderId = setp.OrderId,
                                    Enable = 1,
                                    CreateDate = DateTime.Now,
                                });
                            }
                        }
                        else
                        {
                            steps.Add(setp);
                        }
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

                if (i == 1)
                {
                    filterOption = filter;
                }

            }
            //2023移除默认审批人
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
            string stepMsg = null;
            if (steps.Exists(x => x.StepType == (int)AuditType.提交人上级部门审批))
            {
                //获取提交人上级审批部门
                string parentDeptIds = GetStepValueWithParentDeptId(entity);
                if (parentDeptIds == null)
                {
                    stepMsg = "数据找不到提交人的上级部门,流程不能正常进行";
                    string msg = $"表【{workFlow.WorkTableName}】数据找不到提交人的上级部门,提交数据:{entity.Serialize()}";
                    Console.WriteLine(msg);
                    Logger.Error(msg);
                }
                foreach (var item in steps)
                {
                    if (item.StepType == (int)AuditType.提交人上级部门审批)
                    {
                        item.StepType = (int)AuditType.部门审批;
                        item.StepValue = parentDeptIds;
                        item.Remark = stepMsg;
                    }
                }
            }
            if (steps.Exists(x => x.StepType == (int)AuditType.提交人自己))
            {
                string parentDeptIds = GetStepValueWithParentDeptId(entity);
                var property = typeof(T).GetProperties().Where(x => x.Name == AppSetting.CreateMember.UserIdField).FirstOrDefault();
                int userId = 0;
                if (property != null)
                {
                    userId = property.GetValue(entity).GetInt();
                }
                foreach (var item in steps)
                {
                    if (item.StepType == (int)AuditType.提交人自己)
                    {
                        item.StepType = (int)AuditType.用户审批;
                        item.StepValue = userId.ToString();
                        item.Remark = stepMsg;
                    }
                }
            }


            //设置进入流程后的第一个审核节点,(开始节点的下一个节点)
            var nodeInfo = steps.Where(x => x.ParentId == steps[0].StepId).Select(s => new
            {
                s.StepId,
                s.StepName,
                s.StepType,
                s.StepValue
            }).FirstOrDefault();
            workFlowTable.CurrentStepId = nodeInfo.StepId;
            workFlowTable.StepName = nodeInfo.StepName;

            workFlowTable.Sys_WorkFlowTableStep = steps;

            var entityContext = DBServerProvider.DbContext;
            entityContext.Entry(entity).Property(auditProperty.Name).IsModified = true;
            entityContext.SaveChanges();

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
            if (workFlow.DefaultAuditStatus != AuditStatus.草稿 && workFlow.DefaultAuditStatus != AuditStatus.待提交)
            {
                dbContext.Set<Sys_WorkFlowTableAuditLog>().Add(log);
            }
            //流程提交历史数据写入新的记录数据
            if (logHis != null)
            {
                foreach (var item in logHis)
                {
                    item.WorkFlowTable_Id = workFlowTable.WorkFlowTable_Id;
                }
                dbContext.Set<Sys_WorkFlowTableAuditLog>().AddRange(logHis);
            }
            dbContext.SaveChanges();
            dbContext.Set<Sys_WorkFlowTable>().Entry(workFlowTable).State = EntityState.Detached;
            if (addWorkFlowExecuted != null)
            {
                var userIds = GetAuditUserIds(nodeInfo.StepType ?? 0, nodeInfo.StepValue);
                addWorkFlowExecuted.Invoke(entity, userIds);
            }
            if (auditStatus == (int)AuditStatus.待审核)
            {
                //发送邮件(appsettings.json配置文件里添加邮件信息)
                var nextStep = workFlowTable.Sys_WorkFlowTableStep.Where(x => x.StepAttrType != StepType.start.ToString()).OrderBy(x => x.OrderId).FirstOrDefault(); ;

                SendMail(workFlowTable, filterOption, nextStep, dbContext);
            }
        }


        private static string GetStepValueWithParentDeptId<T>(T entity)
        {
            var property = typeof(T).GetProperties().Where(x => x.Name == AppSetting.CreateMember.UserIdField).FirstOrDefault();
            if (property != null)
            {
                int userId = property.GetValue(entity).GetInt();
                var deptIds = DBServerProvider.DbContext.Set<Sys_UserDepartment>().Where(x => x.Enable == 1 && x.UserId == userId)
                      .Select(s => s.DepartmentId).ToList();

                deptIds = DBServerProvider.DbContext.Set<Sys_Department>()
                    .Where(s => deptIds.Contains(s.DepartmentId) && s.ParentId != null)
                    .Select(s => (Guid)s.ParentId).Distinct().ToList();
                return string.Join(",", deptIds);
            }
            return null;
        }

        private static string GetStepValueWithParentRoleId<T>(T entity)
        {
            var property = typeof(T).GetProperties().Where(x => x.Name == AppSetting.CreateMember.UserIdField).FirstOrDefault();
            if (property != null)
            {
                int userId = property.GetValue(entity).GetInt();
                var roleId = DBServerProvider.DbContext.Set<Sys_User>().Where(x => x.Enable == 1 && x.User_Id == userId)
                      .Select(s => s.Role_Id).FirstOrDefault();

                var roleIds = DBServerProvider.DbContext.Set<Sys_Role>()
                      .Where(s => roleId == s.Role_Id && s.ParentId > 0)
                      .Select(s => s.ParentId).Distinct().ToList();
                return string.Join(",", roleIds);
            }
            return null;
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
        //public static WebResponseContent Audit<T>(T entity, AuditStatus status, string remark,
        //    PropertyInfo autditProperty,
        //     Func<T, AuditStatus, bool, WebResponseContent> workFlowExecuting,
        //     Func<T, AuditStatus, List<int>, bool, WebResponseContent> workFlowExecuted,
        //     bool init = false,
        //     Action<T, List<int>> initInvoke = null
        //    ) where T : class

        public static WebResponseContent Audit<T>(VOLContext tableDbContext, T entity, AuditStatus status, string remark,
           PropertyInfo autditProperty = null,
           Func<T, AuditStatus, bool, WebResponseContent> workFlowExecuting = null,
           Func<T, AuditStatus, List<int>, bool, WebResponseContent> workFlowExecuted = null,
           bool init = false,
           Action<T, List<int>> initInvoke = null,
           FlowWriteState flowWriteState = FlowWriteState.审批,
            string workFlowTableName = null
          ) where T : class
        {
            if (string.IsNullOrEmpty(workFlowTableName))
            {
                workFlowTableName = typeof(T).GetEntityTableName();
            }
            WebResponseContent webResponse = new WebResponseContent(true);
            if (init)
            {
                if (!WorkFlowContainer.Exists<T>(workFlowTableName))
                {
                    return webResponse;
                }
            }
            var dbContext = DBServerProvider.DbContext;
            dbContext.QueryTracking = true; ;
            var queryDbSet = dbContext.Set<T>();

            var keyProperty = typeof(T).GetKeyProperty();
            string key = keyProperty.GetValue(entity).ToString();
            string workTable = workFlowTableName;
            Sys_WorkFlowTable workFlow = dbContext.Set<Sys_WorkFlowTable>()
                       .Where(x => x.WorkTable == workTable && x.WorkTableKey == key)
                        .Include(x => x.Sys_WorkFlowTableStep)
                       .ToList().FirstOrDefault();

            if (workFlow == null)
            {
                string entityName = typeof(T).GetEntityTableName();
                if (entityName != workFlowTableName)
                {
                    workFlow = dbContext.Set<Sys_WorkFlowTable>()
                      .Where(x => x.WorkTable == entityName && x.WorkTableKey == key)
                       .Include(x => x.Sys_WorkFlowTableStep)
                      .ToList().FirstOrDefault();

                }
                if (workFlow == null)
                {
                    return webResponse.Error("未查到流程信息,请检查数据是否被删除");
                }
                workFlowTableName = entityName;
                workTable = entityName;
            }

            workFlow.AuditStatus = (int)status;

            var currentStep = workFlow.Sys_WorkFlowTableStep.Where(x => x.StepId == workFlow.CurrentStepId).FirstOrDefault();

            if (currentStep == null)
            {
                return webResponse.Error($"未查到流程节点[{workFlow.CurrentStepId}]信息,请检查数据是否被删除");
            }
            Sys_WorkFlowTableStep nextStep = null;
            //获取下一步审核id
            string nextStepId = null;

            //多人审批
            //多人并签、或签时只更新当前用户节点(不更新所有节点)
            bool isMultiAudit = workFlow.Sys_WorkFlowTableStep
                .Where(x => x.StepId == workFlow.CurrentStepId
                   && (x.AuditStatus == null || x.AuditStatus == (int)AuditStatus.待审核)
                ).Count() > 1;


            //2023.07.11修复流程存在多个配置时查不到数据的问题
            var filterOptions = WorkFlowContainer.GetFlowOptions(x => x.WorkFlow_Id == workFlow.WorkFlow_Id)
                 .FirstOrDefault()
                 ?.FilterList
                 ?.Where(x => x.StepId == currentStep.StepId)
                 ?.FirstOrDefault();


            var user = UserContext.Current.UserInfo;

            //多人审批时启用并签功能,如果还有两个节点未审批(包括当前正在审批的节点)，设置下一个节点还是当前节点
            if (isMultiAudit && filterOptions?.AuditMethod == 1)
            {
                nextStepId = currentStep.StepId;
                nextStep = currentStep;
            }
            else
            {
                nextStepId = currentStep.NextStepId;
                nextStep = workFlow.Sys_WorkFlowTableStep.Where(x => x.StepId == nextStepId).FirstOrDefault();
            }
            if (nextStep != null)
            {
                workFlow.StepName = nextStep.StepName;
            }

            Sys_WorkFlowTableStep item = null;
            //并签与或签匹配
            //if (isMultiAudit)
            //{
            item = workFlow.Sys_WorkFlowTableStep.Where(x => workFlow.CurrentStepId == x.StepId
                    && (x.AuditStatus == null || x.AuditStatus == (int)AuditStatus.待审核)
                    //找到当前满足条件的数据，只更新一条
                    && CheckAuditUserValue(x.StepType, x.StepValue)
            ).FirstOrDefault();
            //}
            //else
            //{
            //    item = workFlow.Sys_WorkFlowTableStep.Where(x => workFlow.CurrentStepId == x.StepId).FirstOrDefault();
            //}
            //更新明细记录
            if (item != null)
            {
                item.AuditId = user.User_Id;
                item.Auditor = user.UserTrueName;
                item.AuditDate = DateTime.Now;
                //如果审核拒绝或驳回并退回上一步，待完
                item.AuditStatus = (int)status;
                item.Remark = remark;
            }

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

            if (filterOptions != null)
            {
                //审核未通过或者驳回
                if (flowWriteState != FlowWriteState.审批 || status == AuditStatus.审核未通过 || status == AuditStatus.驳回)
                {
                    List<int> userIds = null;
                    switch (flowWriteState)
                    {
                        case FlowWriteState.回退上一级节点:
                            log.AuditStatus = (int)AuditStatus.审核中;
                            break;
                        case FlowWriteState.重新开始:
                            log.AuditStatus = (int)AuditStatus.待审核;
                            break;
                        case FlowWriteState.终止:
                            log.AuditStatus = (int)AuditStatus.终止;
                            break;
                    }
                    //记录日志
                    dbContext.Set<Sys_WorkFlowTableAuditLog>().Add(log);
                    autditProperty.SetValue(entity, (int)status);
                    //修改审批各节点状态
                    UpdateAuditStatus<T>(tableDbContext, entity, workFlow, filterOptions, currentStep, status, remark, flowWriteState, isMultiAudit, workFlowTableName);

                    var userPro = typeof(T).GetProperty(AppSetting.CreateMember.UserIdField);
                    if (userPro != null)
                    {
                        userIds = new List<int>() { userPro.GetValue(entity).GetInt() };
                        //发送给提交人
                        string msg = $"【{workFlow.WorkName}】审批流程【{flowWriteState.ToString()}】,审批结果：【{remark ?? ""}】";
                        SendMail(workFlow, filterOptions, currentStep, dbContext, userIds, msg);

                    }
                    //重新获取当前节点
                    currentStep = workFlow.Sys_WorkFlowTableStep.Where(x => x.StepId == workFlow.CurrentStepId).FirstOrDefault() ?? currentStep;

                    //不是终止的，同时发给上一个审批人
                    if (flowWriteState == FlowWriteState.回退上一级节点
                         || (status == AuditStatus.审核未通过 && filterOptions.AuditRefuse == (int)AuditRefuse.返回上一节点)
                         || (status == AuditStatus.驳回 && filterOptions.AuditBack == (int)AuditBack.返回上一节点)
                         //|| (status == AuditStatus.审核未通过 && filterOptions.AuditRefuse == (int)AuditRefuse.流程重新开始)
                         //|| (status == AuditStatus.驳回 && filterOptions.AuditBack == (int)AuditBack.流程重新开始)
                         )
                    {
                        //发送邮件(appsettings.json配置文件里添加邮件信息)
                        SendMail(workFlow, filterOptions, currentStep, dbContext);
                    }
                    dbContext.Entry(workFlow).State = EntityState.Detached;
                    tableDbContext.Entry(entity).State = EntityState.Detached;
                    if (workFlowExecuted != null)
                    {
                        webResponse = workFlowExecuted.Invoke(entity, status, GetAuditUserIds(currentStep?.StepType ?? 0, currentStep?.StepValue), false);
                    }
                    return webResponse;
                }
            }


            if (autditProperty == null)
            {
                autditProperty = typeof(T).GetProperties().Where(s => s.Name.ToLower() == "auditstatus").FirstOrDefault();
            }
            bool isLast = false;


            //没有找到下一步审批，审核完成
            if ((nextStep == null || nextStep.StepAttrType == StepType.end.ToString()))
            {
                if (status == AuditStatus.审核通过)
                {
                    workFlow.CurrentStepId = "审核完成";
                    var dateProperty = typeof(T).GetProperties().Where(x => x.Name.ToLower() == "auditdate").FirstOrDefault();
                    if (dateProperty != null)
                    {
                        dateProperty.SetValue(entity, DateTime.Now);
                    }
                }
                else
                {
                    workFlow.CurrentStepId = "流程结束";
                }
                workFlow.AuditStatus = (int)status;
                if (workFlowExecuting != null)
                {
                    webResponse = workFlowExecuting.Invoke(entity, status, true);
                    if (!webResponse.Status)
                    {
                        return webResponse;
                    }
                }
                //发送邮件(appsettings.json配置文件里添加邮件信息)
                SendMail(workFlow, filterOptions, nextStep, dbContext);

                autditProperty.SetValue(entity, (int)status);

                UpdateDb<T>(dbContext, workFlow, entity, autditProperty, log);


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

            UpdateDb<T>(dbContext, workFlow, entity, autditProperty, log);

            if (workFlowExecuted != null)
            {
                webResponse = workFlowExecuted.Invoke(entity, status, GetAuditUserIds(nextStep?.StepType ?? 0, nextStep?.StepValue), isLast);
            }
            SendMail(workFlow, filterOptions, nextStep, dbContext);
            return webResponse;

        }

        private static WebResponseContent UpdateAuditStatus<T>(
            VOLContext tableDbContext,
             T entity,
            Sys_WorkFlowTable workFlow,
            FilterOptions filterOptions,
            Sys_WorkFlowTableStep currentStep,
            AuditStatus status,
            string remark,
            FlowWriteState flowWriteState,
            bool isMultiAudit,
            string workFlowTableName = null
            ) where T : class
        {
            WebResponseContent webResponse = new WebResponseContent(true);
            var auditProperty = typeof(T).GetProperties().Where(x => x.Name.ToLower() == "auditstatus").FirstOrDefault();
            if (auditProperty == null)
            {
                return webResponse.Error("表缺少审核状态字段：AuditStatus");
            }
            var dbContext = DBServerProvider.DbContext;
            if (flowWriteState == FlowWriteState.终止)
            {
                status = AuditStatus.终止;
                workFlow.AuditStatus = (int)status;
                auditProperty.SetValue(entity, (int)status);
            }
            else if (flowWriteState == FlowWriteState.回退上一级节点
                || (status == AuditStatus.审核未通过 && filterOptions.AuditRefuse == (int)AuditRefuse.返回上一节点)
                || (status == AuditStatus.驳回 && filterOptions.AuditBack == (int)AuditBack.返回上一节点))
            {
                //2023.12.01修复审批驳回到退到第一个节后无法审批的问题
                var preSteps = workFlow.Sys_WorkFlowTableStep.Where(x => x.NextStepId == currentStep.StepId && x.StepAttrType == StepType.node.ToString()).ToList();
                if (preSteps.Count > 0)
                {
                    foreach (var preStep in preSteps)
                    {
                        preStep.AuditStatus = null;
                        preStep.AuditId = null;
                        preStep.AuditDate = null;
                        preStep.Auditor = null;
                        preStep.Remark = null;

                        //workFlow.AuditStatus = (int)AuditStatus.审核中;
                        dbContext.Update(preStep);
                    }
                    workFlow.CurrentStepId = preSteps[0].StepId;
                    workFlow.StepName = preSteps[0].StepName;
                }
                else
                {
                    //没有找到上一个节点，默认当前节点就是第一个节点
                    workFlow.CurrentStepId = currentStep.StepId;
                    workFlow.StepName = currentStep.StepName;
                }
                //清空当前节点的审批信息(2024.05.21)
                workFlow.Sys_WorkFlowTableStep.ForEach(x =>
                {
                    if (x.StepId == currentStep.StepId)
                    {
                        x.AuditStatus = null;
                        x.AuditId = null;
                        x.AuditDate = null;
                        x.Auditor = null;
                        x.Remark = null;
                        dbContext.Update(x);
                    }
                });

                //if (preSteps.Count == 0 || currentStep.StepId != preSteps[0]?.StepId)
                //{
                //    currentStep.AuditStatus = null;
                //    currentStep.AuditId = null;
                //    currentStep.AuditDate = null;
                //    currentStep.Auditor = null;
                //    currentStep.Remark = null;
                //    if (preSteps.Count == 0)
                //    {
                //        workFlow.CurrentStepId = currentStep.StepId;
                //    }
                //    dbContext.Update(currentStep);
                //}
                workFlow.AuditStatus = (int)AuditStatus.审核中;

                auditProperty.SetValue(entity, (int)AuditStatus.审核中);
            }
            else if (flowWriteState == FlowWriteState.重新开始
                || (status == AuditStatus.审核未通过 && filterOptions.AuditRefuse == (int)AuditRefuse.流程重新开始)
                || (status == AuditStatus.驳回 && filterOptions.AuditBack == (int)AuditBack.流程重新开始))
            {
                //2024.01.22设置重新审批的流程为初始化配置的状态
                var auditStatus = WorkFlowContainer.GetFlowOptions(entity, workFlowTableName)?.DefaultAuditStatus;
                //2024.04.16处理待提交流程判断
                if (auditStatus == null)
                {
                    auditStatus = WorkFlowContainer.GetFlowOptions(c => c.WorkTable == workFlowTableName).Select(s => s.DefaultAuditStatus).FirstOrDefault();
                }
                bool defaultAuditStatus = false;
                if (auditStatus == AuditStatus.草稿 || auditStatus == AuditStatus.待提交)
                {
                    defaultAuditStatus = true;
                    auditProperty.SetValue(entity, (int)auditStatus);
                }
                else
                {
                    auditProperty.SetValue(entity, (int)AuditStatus.待审核);
                }
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
                    workFlow.AuditStatus = defaultAuditStatus ? (int)auditStatus : (int)AuditStatus.审核中;
                    DBServerProvider.DbContext.UpdateRange(steps);
                }
            }
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
                else
                {
                    workFlow.CurrentStepId = null;
                    workFlow.StepName = "流程结束";
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
                else
                {
                    workFlow.CurrentStepId = null;
                    workFlow.StepName = "流程结束";
                }
            }
            var user = UserContext.Current.UserInfo;
            if (msg != null)
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

            //修改状态
            UpdateDb<T>(dbContext, workFlow, entity, auditProperty);
            return webResponse.OK();
        }


        private static void SendMail(Sys_WorkFlowTable workFlow, FilterOptions filterOptions, Sys_WorkFlowTableStep nextStep, VOLContext dbContext, List<int> userIds = null, string title = null)
        {
            if (userIds == null && nextStep != null)
            {
                userIds = new List<int>();
                foreach (var item in workFlow.Sys_WorkFlowTableStep)
                {
                    if (item.StepId == nextStep.StepId)
                    {
                        nextStep = item;
                        userIds.AddRange(GetAuditUserIds(nextStep.StepType ?? 0, nextStep.StepValue));
                    }
                }
                if (userIds.Count == 0)
                {
                    return;
                }
            }
            if (filterOptions == null || filterOptions.SendMail != 1)
            {
                return;
            }
            if (nextStep == null)
            {
                nextStep = new Sys_WorkFlowTableStep() { };
            }

            if (userIds == null)
            {
                return;
            }
            var emails = dbContext.Set<Sys_User>()
                 .Where(x => userIds.Contains(x.User_Id) && x.Email != "").Select(s => s.Email)
                .ToArray();
            Task.Run(() =>
            {
                string msg = "";
                try
                {

                    MailHelper.Send(title, title, emails);
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
                userIds = DBServerProvider.DbContext.Set<Sys_User>().Where(s => s.Role_Id == roleId && s.Enable == 1)
                    .Take(200).Select(s => s.User_Id).ToList();
            }
            else if (stepType == (int)AuditType.部门审批)
            {
                Guid departmentId = nextId.GetGuid() ?? Guid.Empty;
                userIds = DBServerProvider.DbContext.Set<Sys_UserDepartment>().Where(s => s.DepartmentId == departmentId && s.Enable == 1).Take(200).Select(s => s.UserId).ToList();
            }
            else
            {
                return nextId.Split(",").Select(c => c.GetInt()).ToList();
            }
            return userIds;
        }
        /// <summary>
        /// 验证节节点是否满足当前用户
        /// </summary>
        /// <param name="stepType"></param>
        /// <param name="stepValue"></param>
        /// <returns></returns>
        public static bool CheckAuditUserValue(int? stepType, string stepValue = null)
        {
            switch (stepType)
            {
                case (int)AuditType.角色审批:
                    return UserContext.Current.RoleId == stepValue.GetInt();
                case (int)AuditType.部门审批:
                    return UserContext.Current.DeptIds.Contains((Guid)stepValue.GetGuid());
                default:
                    return UserContext.Current.UserId == stepValue.GetInt();
            }
        }
        /// <summary>
        /// 增加审批记录
        /// </summary>
        /// <param name="keys"></param>
        /// <param name="auditStatus"></param>
        /// <param name="auditReason"></param>
        public static void AddAuditLog<T>(object[] keys, int? auditStatus, string auditReason) where T : class
        {
            var user = UserContext.Current.UserInfo; ;
            var logs = keys.Select(id => new Sys_WorkFlowTableAuditLog()
            {
                Id = Guid.NewGuid(),
                StepId = id?.ToString(),
                StepName = typeof(T).Name,//.GetEntityTableName(false),
                Auditor = user.UserTrueName,
                AuditDate = DateTime.Now,
                AuditId = user.User_Id,
                CreateDate = DateTime.Now,
                AuditStatus = auditStatus,
                AuditResult = auditReason,
                Remark = auditReason
            }).ToList();
            DBServerProvider.DbContext.AddRange(logs);
            DBServerProvider.DbContext.SaveChanges();
        }

        /// <summary>
        /// 替换现有流程数据
        /// </summary>
        /// <param name="workFlow"></param>
        /// <param name="add"></param>
        public static void UpdateFlowData(Sys_WorkFlow workFlow, List<Sys_WorkFlowStep> add)
        {
            if (workFlow.AuditingEdit != 1)
            {
                return;
            }
            if (add == null || add.Count == 0)
            {
                return;
            }

            var flowStep = DBServerProvider.DbContext.Set<Sys_WorkFlowStep>().Where(x => x.WorkFlow_Id == workFlow.WorkFlow_Id).ToList();
            foreach (var item in flowStep)
            {
                item.NextStepIds = flowStep.Where(c => c.ParentId == item.StepId).Select(c => c.StepId).FirstOrDefault();
            }
            foreach (var item in add)
            {
                item.NextStepIds = flowStep.Where(c => c.StepId == item.StepId).Select(c => c.NextStepIds).FirstOrDefault();
            }
            add = add.Where(x => x.StepAttrType == StepType.node.ToString()).ToList();
            var flowTable = DBServerProvider.DbContext.Set<Sys_WorkFlowTable>()
                 .Where(x => x.WorkFlow_Id == workFlow.WorkFlow_Id
                 && (x.AuditStatus == (int)AuditStatus.待审核 || x.AuditStatus == (int)AuditStatus.审核中)
                 ).Include(x => x.Sys_WorkFlowTableStep).ToList();
            List<Guid> updateFlowIds = new List<Guid>();
            List<Guid> ingroFlowIds = new List<Guid>();
            foreach (var workFlowTable in flowTable)
            {
                for (int i = 0; i < workFlowTable.Sys_WorkFlowTableStep.Count; i++)
                {
                    var step = workFlowTable.Sys_WorkFlowTableStep[i];

                    //记录父级点节点变更
                    string parentStepId = add.Where(x => x.NextStepIds == step.StepId).Select(c => c.StepId).FirstOrDefault();
                    if (!string.IsNullOrEmpty(parentStepId))
                    {
                        step.ParentId = parentStepId;
                        // updateStepIds.Add(step.Sys_WorkFlowTableStep_Id);
                    }
                    //第三次增加节点时，添加到开始后面，节点orderid没有值，下一个节点也不对
                    //找出新加的节点前一个节点(上级)
                    var addItems = add.Where(x => x.ParentId == step.StepId && !workFlowTable.Sys_WorkFlowTableStep.Any(c => c.StepId == x.StepId && x.StepValue == c.StepValue)).ToList();
                    if (addItems.Count > 0)
                    {
                        //设置原有节点的下一个流程
                        step.NextStepId = addItems[0].StepId;
                        //记录变更的节点,重新指向了下一个节点
                        // updateStepIds.Add(step.Sys_WorkFlowTableStep_Id);
                        //找最后一个节点
                        if (addItems[0].NextStepIds == null)
                        {
                            addItems[0].NextStepIds = workFlowTable.Sys_WorkFlowTableStep.Where(x => x.StepAttrType == StepType.end.ToString()).Select(c => c.StepId).FirstOrDefault();
                        }
                        workFlowTable.Sys_WorkFlowTableStep.AddRange(addItems.Select(s => new Sys_WorkFlowTableStep()
                        {
                            WorkFlow_Id = s.WorkFlow_Id,
                            StepId = s.StepId,
                            StepName = s.StepName,
                            StepType = s.StepType,
                            StepValue = s.StepValue,
                            StepAttrType = s.StepAttrType,
                            WorkFlowTable_Id = workFlowTable.WorkFlowTable_Id,
                            Enable = 1,
                            NextStepId = s.NextStepIds,
                            OrderId = null,
                            ParentId = s.ParentId,
                            CreateDate = DateTime.Now
                        }));
                    }
                }

                //找不到上下级的节点可能已被删除，忽略不处理
                bool b = workFlowTable.Sys_WorkFlowTableStep
                 .Exists(x => (x.StepAttrType != StepType.start.ToString() && !workFlowTable.Sys_WorkFlowTableStep.Any(c => c.StepId == x.ParentId))
                      || (x.StepAttrType != StepType.end.ToString() && !workFlowTable.Sys_WorkFlowTableStep.Any(c => c.StepId == x.NextStepId)));
                if (b)
                {
                    ingroFlowIds.Add(workFlowTable.WorkFlowTable_Id);
                    continue;
                }

                string parentStep = workFlowTable.Sys_WorkFlowTableStep.Where(x => x.StepAttrType == StepType.start.ToString()).Select(c => c.StepId).FirstOrDefault();

                //重新排序
                int index = 1;


                foreach (var item in workFlowTable.Sys_WorkFlowTableStep)
                {
                    var list = workFlowTable.Sys_WorkFlowTableStep.Where(x => x.ParentId == parentStep).ToList();
                    if (list.Count > 0)
                    {
                        foreach (var item2 in list)
                        {
                            item2.OrderId = index;
                            index++;
                        }
                        parentStep = list[0].StepId;
                    }
                }

                //设置当前审批节点
                string currentId = workFlowTable.Sys_WorkFlowTableStep
                    .Where(x => x.StepAttrType != StepType.start.ToString() && (x.AuditStatus == null || x.AuditStatus == (int)AuditStatus.待审核)
                          //当前审批节点=没有审批过的节点，并且节点后台不存在已经审批的数据
                          && !workFlowTable.Sys_WorkFlowTableStep.Exists(c => c.OrderId > x.OrderId && c.AuditStatus > (int)AuditStatus.待审核))
                    .OrderBy(x => x.OrderId)
                    .Select(s => s.StepId)
                    .FirstOrDefault();
                if (!string.IsNullOrEmpty(currentId) && currentId != workFlowTable.CurrentStepId)
                {
                    workFlowTable.CurrentStepId = currentId;
                    updateFlowIds.Add(workFlowTable.WorkFlowTable_Id);
                }
            }

            if (updateFlowIds.Count > 0)
            {
                var updateList = flowTable.Where(x => updateFlowIds.Contains(x.WorkFlowTable_Id)).ToList();
                DBServerProvider.DbContext.UpdateRange(updateList);
            }

            var steps = flowTable.SelectMany(x => x.Sys_WorkFlowTableStep).Where(c => c.Sys_WorkFlowTableStep_Id == Guid.Empty && c.OrderId > 0).ToList();
            for (int s = 0; s < steps.Count; s++)
            {
                var item = steps[s];
                if (item.StepValue != null && item.StepValue.Contains(","))
                {
                    var stepValues = item.StepValue.Split(",");
                    item.StepValue = stepValues[0];
                    for (int i = 1; i < stepValues.Length; i++)
                    {
                        var cloneItem = item.Serialize().DeserializeObject<Sys_WorkFlowTableStep>();
                        cloneItem.StepValue = stepValues[i];
                        cloneItem.Sys_WorkFlowTableStep_Id = Guid.NewGuid();
                        steps.Add(cloneItem);
                    }
                }
                item.Sys_WorkFlowTableStep_Id = Guid.NewGuid();
            }

            DBServerProvider.DbContext.AddRange(steps);

            var updateSteps = flowTable.Where(x => !ingroFlowIds.Contains(x.WorkFlowTable_Id))
                .SelectMany(x => x.Sys_WorkFlowTableStep).Where(x => x.Sys_WorkFlowTableStep_Id != Guid.Empty).ToList();

            if (updateSteps.Count > 0)
            {
                DBServerProvider.DbContext.UpdateRange(updateSteps);
            }
            DBServerProvider.DbContext.SaveChanges();
        }

        /// <summary>
        /// 获取实体类的审批信息
        /// </summary>
        /// <typeparam name="T"></typeparam>
        /// <param name="entity"></param>
        /// <returns></returns>
        public static Sys_WorkFlowTable GetWorkFlowTable<T>(this T entity) where T : class
        {
            string table = typeof(T).GetEntityTableName();
            string key = typeof(T).GetKeyProperty().GetValue(entity).ToString();
            var flow = DBServerProvider.DbContext.Set<Sys_WorkFlowTable>().AsNoTracking()
                  .Where(x => x.WorkTable == table && x.WorkTableKey == key)
                  .Include(s => s.Sys_WorkFlowTableStep)
                  .FirstOrDefault();
            return flow;
        }


        private static void UpdateDb<T>(VOLContext dbContext, Sys_WorkFlowTable workFlow, T entity,
              PropertyInfo autditProperty, Sys_WorkFlowTableAuditLog log = null)
        {
            var entry = dbContext.Entry(entity);
            entry.Property(autditProperty.Name).IsModified = true;
            dbContext.SaveChanges();
            entry.State = EntityState.Detached;
            if (log != null)
            {
                dbContext.Set<Sys_WorkFlowTableAuditLog>().Add(log);
            }
            dbContext.Set<Sys_WorkFlowTable>().Update(workFlow);
            dbContext.SaveChanges();
            dbContext.Entry(workFlow).State = EntityState.Detached;
        }
    }

    public enum FlowWriteState
    {
        审批 = 0,
        重新开始,
        回退上一级节点,
        终止
    }
}

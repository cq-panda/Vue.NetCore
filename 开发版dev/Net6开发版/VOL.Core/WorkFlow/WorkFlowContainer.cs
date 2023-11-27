using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.DependencyInjection;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Linq.Expressions;
using System.Reflection;
using System.Text;
using System.Threading.Tasks;
using VOL.Core.DBManager;
using VOL.Core.EFDbContext;
using VOL.Core.Extensions;
using VOL.Core.Utilities;
using VOL.Entity.DomainModels;

namespace VOL.Core.WorkFlow
{
    public class WorkFlowContainer
    {
        private static WorkFlowContainer _instance;
        private static Dictionary<string, string> _container = new Dictionary<string, string>();
        private static Dictionary<string, string[]> _filterFields = new Dictionary<string, string[]>();

        private static Dictionary<string, string[]> _formFields = new Dictionary<string, string[]>();

        private static List<Type> _types = new List<Type>();

        public static WorkFlowContainer Instance
        {
            get
            {
                if (_instance != null)
                {
                    return _instance;

                }
                _instance = new WorkFlowContainer();
                return _instance;
            }
        }
        /// <summary>
        /// 
        /// </summary>
        /// <typeparam name="T"></typeparam>
        /// <param name="name">流程实例名称</param>
        /// <param name="filterFields">流程配置可筛选条件字段</param>
        ///<param name="formFields">审批界面要显示字段</param>
        /// <returns></returns>
        public WorkFlowContainer Use<T>(string name = null, Expression<Func<T, object>> filterFields = null, Expression<Func<T, object>> formFields = null)
        {
            Type type = typeof(T);
            if (_types.Contains(type))
            {
                return _instance;
            }

            _container[type.Name] = name ?? typeof(T).GetEntityTableCnName();
            if (filterFields != null)
            {
                _filterFields[type.Name] = filterFields.GetExpressionToArray();
            }
            if (formFields != null)
            {
                _formFields[type.Name] = formFields.GetExpressionToArray();
            }
            _types.Add(type);
            return _instance;
        }

        public void Run()
        {

            Task.Run(() =>
            {
                try
                {
                    List<Sys_WorkFlow> list = null;
                    List<string> tables = _container.Select(s => s.Key).ToList();
                    using (VOLContext contenxt = new VOLContext())
                    {
                        list = contenxt.Set<Sys_WorkFlow>().Where(c => tables.Contains(c.WorkTable)).Include(x => x.Sys_WorkFlowStep).ToList();
                    }
                    foreach (var item in list.GroupBy(x => x.WorkTable))
                    {
                        Type type = _types.Where(x => x.Name == item.Key).FirstOrDefault();
                        InitOptions(type, item.ToList());
                    }
                }
                catch (Exception ex)
                {
                    Console.WriteLine($"初始化流程调用数据库异常,异常信息{ex.Message}");
                }
            });
        }

        public static Type GetType(string tableName)
        {
            return _types.Where(c => c.Name == tableName).FirstOrDefault();
        }

        public static string[] GetFilterFields(string tableName)
        {
            _filterFields.TryGetValue(tableName, out string[] fields);
            return fields;
        }

        public static string[] GetFormFields(string tableName)
        {
            _formFields.TryGetValue(tableName, out string[] fields);
            return fields;
        }

        public static object GetDic()
        {
            return _container.Select(s => new { key = s.Key, value = s.Value }).ToList();
        }

        public static bool Exists<T>()
        {
            return Exists(typeof(T).GetEntityTableName());
        }

        public static bool Exists(string table)
        {
            return _container.ContainsKey(table);
        }

        private WorkFlowContainer InitOptions(Type type, List<Sys_WorkFlow> list)
        {
            string tableName = type.GetEntityTableName();

            foreach (var workFlow in list)
            {
                try
                {
                    var obj = typeof(WorkFlowContainer).GetMethod("Add").MakeGenericMethod(new Type[] { type });
                    obj.Invoke(this, new object[] { workFlow, workFlow.Sys_WorkFlowStep, true });
                }
                catch (Exception e)
                {
                    Console.WriteLine($"初始化流程配置信息异常,表:【{tableName}】,异常信息{e.Message}");
                }
            }

            if (list.Count > 0)
            {
                Console.WriteLine($"初始化流程表:【{tableName}】成功");
            }

            return _instance;
        }

        public static IEnumerable<WorkFlowTableOptions> GetFlowOptions(Func<WorkFlowTableOptions, bool> func)
        {
            return _workFlowTableOptions.Where(func);
        }

        public static WorkFlowTableOptions GetFlowOptions<T>(T entity)
        {
            string tableName = typeof(T).GetEntityTableName();
            if (!Exists(tableName) || !_workFlowTableOptions.Any(c => c.WorkTable == tableName))
            {
                return null;
            }
            string key = typeof(T).GetKeyProperty().GetValue(entity).ToString();

            var flowTable = DBServerProvider.DbContext.Set<Sys_WorkFlowTable>().Include(c => c.Sys_WorkFlowTableStep)
                  .Where(c => c.WorkTableKey == key && c.WorkTable == tableName)
                  .OrderByDescending(x => x.CreateDate)
                  .FirstOrDefault();

            var entities = new List<T>() { entity };

            //还未进入流程，找到满足流程的配置
            if (flowTable == null)
            {
                //优先判断满足条件的
                var filter = _workFlowTableOptions.Where(x => x.WorkTable == tableName
                                             && x.FilterList.Any(c => c.StepAttrType == StepType.start.ToString()
                                             && c.Expression != null && entities.Any(((Func<T, bool>)c.Expression))))
                      .OrderByDescending(x => x.Weight)
                      .FirstOrDefault();
                if (filter != null)
                {
                    return filter;
                }
                //没有找到满足条件的用无条件的流程

                return _workFlowTableOptions.Where(x => x.WorkTable == tableName
                                        && x.FilterList.Any(c => c.StepAttrType == StepType.start.ToString()
                                        && c.Expression == null))
                    .OrderByDescending(x => x.Weight)
                    .FirstOrDefault();
            }
            return null;
        }

        private static readonly List<WorkFlowTableOptions> _workFlowTableOptions = new List<WorkFlowTableOptions>();
        private static object _wk_object = new object();


        public WebResponseContent AddTable(Sys_WorkFlow workFlow, List<Sys_WorkFlowStep> flowSteps, bool showError = true)
        {
            WebResponseContent webResponse = new WebResponseContent();
            Type type = _types.Where(x => x.GetEntityTableName() == workFlow.WorkTable).FirstOrDefault();
            if (type == null)
            {
                return webResponse.Error($"{workFlow.WorkTableName}未注册");
            }

            Del(workFlow.WorkFlow_Id);

            var obj = typeof(WorkFlowContainer).GetMethod("Add").MakeGenericMethod(new Type[] { type });
            webResponse = obj.Invoke(this, new object[] { workFlow, flowSteps, true }) as WebResponseContent;
            if (webResponse.Status && string.IsNullOrEmpty(webResponse.Message))
            {
                webResponse.Message = "流程创建成功";
            }
            return webResponse;
        }

        public static WebResponseContent Add<T>(Sys_WorkFlow workFlow, List<Sys_WorkFlowStep> flowSteps, bool showError = true) where T : class
        {
            WebResponseContent webResponse = new WebResponseContent();
            lock (_wk_object)
            {
                WorkFlowTableOptions options = new WorkFlowTableOptions()
                {
                    WorkFlow_Id = workFlow.WorkFlow_Id,
                    WorkTable = workFlow.WorkTable,
                    WorkName = workFlow.WorkName,
                    Weight=workFlow.Weight,
                    FilterList = new List<FilterOptions>()
                };
                bool success = true;
                //结束节点不生成条件
                foreach (var item in flowSteps.Where(c => c.StepAttrType != StepType.end.ToString()))
                {
                    var filters = item.Filters.DeserializeObject<List<FieldFilter>>();
                    try
                    {
                        Expression<Func<T, bool>> expression = WorkFlowFilter.Create<T>(filters);
                        options.FilterList.Add(new FilterOptions()
                        {
                            StepId = item.StepId,
                            ParentId = item.ParentId,
                            NextStepIds = item.NextStepIds,
                            StepAttrType = item.StepAttrType,
                            Expression = expression?.Compile(),
                            AuditBack = item.AuditBack,
                            AuditRefuse = item.AuditRefuse,
                            AuditMethod = item.AuditMethod,
                            SendMail = item.SendMail,
                            WorkFlow_Id = item.WorkFlow_Id,
                            WorkStepFlow_Id = item.WorkStepFlow_Id,
                            StepType = item.StepType,
                            StepValue = item.StepValue
                        });
                    }
                    catch (Exception ex)
                    {

                        string message = $"流程:【{workFlow.WorkName}】,节点:【{item.StepName}】条件异常,请检查【值】与【字段的类型】是否匹配,节点配置：{item.Filters}";

                        Console.WriteLine(message + ex.Message);
                        if (showError)
                        {
                            //  throw new Exception(message);
                            return webResponse.Error(message);
                        }
                        success = false;
                    }
                }
                if (success)
                {
                    if (options.Sys_WorkFlowStep == null)
                    {
                        options.Sys_WorkFlowStep = flowSteps;
                    }

                    var data = _workFlowTableOptions.Where(x => x.WorkFlow_Id == workFlow.WorkFlow_Id).FirstOrDefault();
                    if (data != null)
                    {
                        data.WorkTable = options.WorkTable;
                        data.WorkName = options.WorkName;
                        data.FilterList = options.FilterList;
                    }
                    else
                    {
                        if (options.FilterList != null)
                        {
                            foreach (var item in options.FilterList)
                            {
                                if (item.ParentId != null)
                                {
                                    item.ParentIds = item.ParentId.Split(",");
                                }
                                else
                                {
                                    item.ParentIds = new string[] { };
                                }
                            }
                        }

                        _workFlowTableOptions.Add(options);
                    }
                }
                return webResponse.OK();
            }
        }

        public static string GetName<T>()
        {
            Type type = typeof(T);
            if (_container.TryGetValue(type.Name, out string name))
            {
                return name;
            }
            return type.GetEntityTableCnName();
        }
        public static void Del(Guid workFlowId)
        {
            int index = _workFlowTableOptions.FindIndex(x => x.WorkFlow_Id == workFlowId);
            if (index != -1)
            {
                _workFlowTableOptions.RemoveAt(index);
            }
        }

        public static void DelRange(Guid[] workFlowId)
        {
            foreach (var id in workFlowId)
            {
                Del(id);
            }
        }
    }
}

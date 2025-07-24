using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.DependencyInjection;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Linq.Expressions;
using System.Reflection;
using System.Text;
using System.Threading.Tasks;
using VOL.Core.Configuration;
using VOL.Core.DBManager;
using VOL.Core.EFDbContext;
using VOL.Core.Extensions;
using VOL.Core.ManageUser;
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

        private static List<WorkFlowFormDetails> _formDetailFields = new List<WorkFlowFormDetails> { };

        private static List<Type> _types = new List<Type>();


        private static List<WorkFlowFormOptions> _flowFormOptions = new List<WorkFlowFormOptions>();
        private static Dictionary<string, string[]> _editFields = new Dictionary<string, string[]>();

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
        ///<param name="editFields">可以编辑的字段</param>
        /// <returns></returns>
        public WorkFlowContainer Use<T>(string name = null,
            Expression<Func<T, object>> filterFields = null,
            Expression<Func<T, object>> formFields = null,
            AuditStatus defaultAduitStatus = AuditStatus.待审核,
            Expression<Func<T, object>> editFields = null)
        {
            return _instance.Use<T, T>(name, filterFields, formFields, null, defaultAduitStatus, editFields);
        }

        public WorkFlowContainer Use<T, Detail>(string name = null,
            Expression<Func<T, object>> filterFields = null,
            Expression<Func<T, object>> formFields = null,
            Expression<Func<Detail, object>> formDetailFields = null,
            AuditStatus defaultAduitStatus = AuditStatus.待审核,
            Expression<Func<T, object>> editFields = null)
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
            //可以编辑的字段
            if (editFields != null)
            {
                _editFields[type.Name] = editFields.GetExpressionToArray();
            }
            if (formDetailFields != null)
            {
                var dic = new WorkFlowFormDetails()
                {
                    MainTable = type.Name,
                    Type = typeof(Detail),
                    FormFields = formDetailFields.GetExpressionToArray()
                };
                _formDetailFields.Add(dic);
            }
            _types.Add(type);
            _flowFormOptions.Add(new WorkFlowFormOptions()
            {
                TableName = type.Name,
                Type = type,
                DefaultAuditStatus = defaultAduitStatus
            });
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
                    using (var contenxt = new VOLContext())
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
        /// <summary>
        /// 获取明细表配置
        /// </summary>
        /// <typeparam name="T"></typeparam>
        /// <returns></returns>
        public static List<WorkFlowFormDetails> GetDetail(Type mainType)
        {
            return _formDetailFields.Where(c => c.MainTable == mainType.Name).ToList();
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
        public static string[] GetEditFields(string tableName)
        {
            _editFields.TryGetValue(tableName, out string[] fields);
            return fields;
        }

        public static bool Exists<T>(string workFlowTableName = null)
        {
            return Exists(workFlowTableName ?? typeof(T).GetEntityTableName());
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

        public static WorkFlowTableOptions GetFlowOptions<T>(T entity, string tableName = null) where T : class
        {
            tableName = tableName ?? typeof(T).GetEntityTableName();
            if (!Exists(tableName) || !_workFlowTableOptions.Any(c => c.WorkTable == tableName))
            {
                return null;
            }
            if ( !_workFlowTableOptions.Any(c => c.WorkTable == tableName))
            {
                return null;
            }

            string key = typeof(T).GetKeyProperty().GetValue(entity).ToString();

            var flowTable = DBServerProvider.DbContext.Set<Sys_WorkFlowTable>().Include(c => c.Sys_WorkFlowTableStep)
                  .Where(c => c.WorkTableKey == key && c.WorkTable == tableName && (c.AuditStatus != (int)AuditStatus.草稿 && c.AuditStatus != (int)AuditStatus.待提交))
                  .OrderByDescending(x => x.CreateDate)
                  .ToList().FirstOrDefault();

            var entities = new List<T>() { entity };

            //还未进入流程，找到满足流程的配置
            if (flowTable == null)
            {
                //优先判断满足条件的
                var filter = _workFlowTableOptions.Where(x =>x.WorkTable == tableName
                                             && x.FilterList.Any(c => c.StepAttrType == StepType.start.ToString()
                                             && c.FieldFilters.CheckFilter<T>(entities, c.Expression)))
                      //  && c.Expression != null && entities.Any(((Func<T, bool>)c.Expression))))
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
                    Weight = workFlow.Weight,
                    //2023.11.12增加默认状态
                    DefaultAuditStatus = _flowFormOptions.Where(x => x.TableName == workFlow.WorkTable).Select(s => s.DefaultAuditStatus).FirstOrDefault(),
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
                            ParentIds = new string[] { },
                            SendMail = item.SendMail,
                            WorkFlow_Id = item.WorkFlow_Id,
                            WorkStepFlow_Id = item.WorkStepFlow_Id,
                            StepType = item.StepType,
                            StepValue = item.StepValue,
                            FieldFilters = filters
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

        public static string GetName<T>(string workTableName)
        {
            if (!string.IsNullOrEmpty(workTableName) && _container.TryGetValue(workTableName, out string name))
            {
                return name;
            }
            Type type = typeof(T);
            if (_container.TryGetValue(type.Name, out name))
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

        private static bool CheckTenancy()
        {
            return false;
        }
    }

    public class WorkFlowFormOptions
    {
        public string TableName { get; set; }
        public Type Type { get; set; }
        public AuditStatus DefaultAuditStatus { get; set; }
    }

    public class WorkFlowFormDetails
    {
        public string MainTable { get; set; }
        public Type Type { get; set; }

        public string[] FormFields { get; set; }
    }
}

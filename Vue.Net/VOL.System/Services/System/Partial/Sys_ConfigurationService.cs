/*
 *所有关于Sys_Configuration类的业务代码应在此处编写
*可使用repository.调用常用方法，获取EF/Dapper等信息
*如果需要事务请使用repository.DbContextBeginTransaction
*也可使用DBServerProvider.手动获取数据库相关信息
*用户信息、权限、角色等使用UserContext.Current操作
*Sys_ConfigurationService对增、删、改查、导入、导出、审核业务代码扩展参照ServiceFunFilter
*/
using Microsoft.Extensions.Configuration;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Linq.Expressions;
using System.Threading.Tasks;
using VOL.Core.Configuration;
using VOL.Core.Configuration.ConfigModel;
using VOL.Core.Extensions;
using VOL.Core.Extensions.AutofacManager;
using VOL.Core.Utilities;
using VOL.Entity.DomainModels;
using VOL.Entity.DomainModels.System;
using VOL.System.IRepositories;
using VOL.System.IServices;

namespace VOL.System.Services
{
    public partial class Sys_ConfigurationService
    {
        /// <summary>
        /// 含有了实例的配置描述符集合
        /// </summary>
        private static readonly IConfigCollection ConfigWidthInstanceCollection = new ConfigCollection();

        private readonly IConfigCollection _configs;
        private readonly IServiceProvider _serviceProvider;
        private readonly IConfiguration _cfg;
        public ISys_ConfigurationRepository _repository { get; set; }

        public Sys_ConfigurationService(ISys_ConfigurationRepository repository, IConfigCollection configs, IServiceProvider serviceProvider, IConfiguration cfg)
             : base(repository)
        {
            _repository = repository;
            _configs = configs;
            _serviceProvider = serviceProvider;
            _cfg = cfg;
            Init(repository);
        }

        public static ISys_ConfigurationService Instance
        {
            get { return AutofacContainerModule.GetService<ISys_ConfigurationService>(); }
        }

        public async Task<WebResponseContent> GetAsync(int id)
        {
            WebResponseContent webResponse = new WebResponseContent();
            Expression<Func<Sys_Configuration, bool>> predicate = config => config.Id == id;
            var result = await repository.FindAsyncFirst(predicate);
            if (result == null)
            {
                return webResponse.Error("配置获取失败");
            }
            return webResponse.OK("配置获取成功", new
            {
                result.Id,
                result.Name,
                result.Code,
                Value = JsonConvert.DeserializeObject(result.Value)
            });
        }

        public async Task<WebResponseContent> UpdateAsync(ConfigInfo configInfo)
        {
            WebResponseContent webResponse = new WebResponseContent();
            try
            {
                var result = await repository.FindAsyncFirst(f => f.Id == configInfo.Id);
                //实例化相应的设置类
                var descriptor = GetDescriptor(m => m.Code.EqualsIgnoreCase(result.Code));
                descriptor.Instance = (IConfig)JsonConvert.DeserializeObject(configInfo.Json, descriptor.ImplementType);
                //保存
                await SetAsync(descriptor.Code, JsonConvert.SerializeObject(descriptor.Instance));
                result = await repository.FindAsyncFirst(f => f.Id == configInfo.Id);
                return webResponse.OK("保存成功", new { result.Id, result.Name, result.Code, Value = JsonConvert.DeserializeObject(result.Value) });
            }
            catch (Exception e)
            {
                return webResponse.Error(e.Message);
            }
        }

        public async Task<WebResponseContent> GetTableDataAsync()
        {
            WebResponseContent webResponse = new WebResponseContent();
            var config = await repository.FindAsyncFirst(f => f.Code == "TableExport");
            try
            {
                //查询最新的数据结构
                var tableLists = (repository.DbContext.Set<Sys_TableInfo>().AsQueryable()
                 .Where(w => w.TableTrueName != null)
                 .Select(s => new TableList
                 {
                     TableId = s.Table_Id,
                     TableName = (s.CnName.Length > 0 ? s.CnName : s.TableTrueName),
                     TableColumns = s.TableColumns.Select(tc => new TableColumn
                     {
                         ColumnId = tc.ColumnId,
                         ColumnName = tc.ColumnCnName.Length > 0 ? tc.ColumnCnName : tc.ColumnName
                     }).ToList()
                 })).ToList();
                
                //验证数据结构
                var dbConfig = JsonConvert.DeserializeObject<TableExportConfig>(config.Value);
                tableLists = dbConfig.SynchronizeData(dbConfig.Tables, tableLists);
                var tableConfig = new TableExportConfig
                {
                    Tables = tableLists,
                    ModifyDate = config.ModifyDate
                };

                //更新
                config.Value = JsonConvert.SerializeObject(tableConfig);
                repository.Update(config, true);

                return webResponse.OK("获取成功", new
                {
                    config.Id,
                    config.Name,
                    config.Code,
                    Value = JsonConvert.DeserializeObject(config.Value)
                });
            }
            catch (Exception e)
            {
                return webResponse.Error(e.Message);
            }
        }

        public async Task<WebResponseContent> UpdateExportColumnsAsync(ConfigInfo configInfo)
        {
            WebResponseContent webResponse = new WebResponseContent();
            var config = await repository.FindFirstAsync(f => f.Id == configInfo.Id);
            try
            {
                var tableConfig = JsonConvert.DeserializeObject<TableExportConfig>(config.Value);
                var sourceTable = JsonConvert.DeserializeObject<TableList>(configInfo.Json);
                tableConfig.Tables = tableConfig.SynchronizeData(new List<TableList> { sourceTable }, tableConfig.Tables);
                tableConfig.ModifyDate = DateTime.Now;
                //更新
                config.Value = JsonConvert.SerializeObject(tableConfig);
                repository.Update(config, true);
                return webResponse.OK("更新成功", new
                {
                    config.Id,
                    config.Name,
                    config.Code,
                    Value = JsonConvert.DeserializeObject(config.Value)
                });
            }
            catch (Exception e)
            {
                return webResponse.Error(e.Message);
            }
        }

        public WebResponseContent GetConfigList()
        {
            WebResponseContent webResponse = new WebResponseContent();
            var config = repository.FindAsIQueryable(f => true).OrderBy(o => o.CreateDate);
            var result = config.Select(s => new { s.Id, s.Code, s.Name }).ToList();
            return webResponse.OK("获取成功", result);
        }

        private async Task<bool> SetAsync(string code, string json)
        {
            if (json.IsNull())
                return false;

            var descriptor = GetDescriptor(m => m.Code.EqualsIgnoreCase(code));
            //旧实例
            var oldInstance = descriptor.Instance;
            //新实例
            descriptor.Instance = (IConfig)JsonConvert.DeserializeObject(json, descriptor.ImplementType);
            //更新时间
            descriptor.Instance.ModifyDate = DateTime.Now;
            json = JsonConvert.SerializeObject(descriptor.Instance);
            //持久化
            await _repository.SaveJson(descriptor.Code, json);

            #region ==触发变更事件==

            foreach (var changeEventType in descriptor.ChangeEvents)
            {
                var eventInstance = _serviceProvider.GetService(changeEventType);
                var method = changeEventType.GetMethod("OnChanged");
                if (method != null)
                {
                    method.Invoke(eventInstance, new object[] { descriptor.Instance, oldInstance });
                }
            }

            #endregion

            return true;
        }

        private ConfigDescriptor GetDescriptor(Func<ConfigDescriptor, bool> predicate)
        {
            var descriptor = ConfigWidthInstanceCollection.FirstOrDefault(predicate);
            if (descriptor == null)
            {
                descriptor = _configs.Where(predicate).Select(m => new ConfigDescriptor
                {
                    Code = m.Code,
                    ImplementType = m.ImplementType,
                    ChangeEvents = m.ChangeEvents
                }).FirstOrDefault();

                ConfigWidthInstanceCollection.Add(descriptor);
            }

            if (descriptor == null)
                throw new NullReferenceException("指定类型的配置实例不存在");

            return descriptor;
        }

    }
}

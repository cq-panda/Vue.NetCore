/*
 *所有关于Sys_QuartzOptions类的业务代码应在此处编写
*可使用repository.调用常用方法，获取EF/Dapper等信息
*如果需要事务请使用repository.DbContextBeginTransaction
*也可使用DBServerProvider.手动获取数据库相关信息
*用户信息、权限、角色等使用UserContext.Current操作
*Sys_QuartzOptionsService对增、删、改查、导入、导出、审核业务代码扩展参照ServiceFunFilter
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
using VOL.Core.Quartz;
using Quartz;
using System;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace VOL.System.Services
{
    public partial class Sys_QuartzOptionsService
    {
        private readonly IHttpContextAccessor _httpContextAccessor;
        private readonly ISys_QuartzOptionsRepository _repository;//访问数据库
        private readonly ISchedulerFactory _schedulerFactory;
        [ActivatorUtilitiesConstructor]
        public Sys_QuartzOptionsService(
            ISys_QuartzOptionsRepository dbRepository,
            IHttpContextAccessor httpContextAccessor,
            ISchedulerFactory schedulerFactory
            )
        : base(dbRepository)
        {
            _httpContextAccessor = httpContextAccessor;
            _repository = dbRepository;
            _schedulerFactory = schedulerFactory;
            //多租户会用到这init代码，其他情况可以不用
            //base.Init(dbRepository);
        }
        WebResponseContent webResponse = new WebResponseContent();
        public override WebResponseContent Add(SaveModel saveDataModel)
        {
            AddOnExecuting = (Sys_QuartzOptions options, object list) =>
            {
                options.Status = (int)TriggerState.Paused;
                return webResponse.OK();
            };
            AddOnExecuted = (Sys_QuartzOptions options, object list) =>
            {
                return webResponse.OK();
            };
            return base.Add(saveDataModel);
        }

        public override WebResponseContent Del(object[] keys, bool delList = true)
        {
            var ids = keys.Select(s => (Guid)(s.GetGuid())).ToArray();
            repository.FindAsIQueryable(x => ids.Contains(x.Id)).ToList().ForEach(options =>
            {
                _schedulerFactory.Remove(options).GetAwaiter().GetResult();
            });

            return base.Del(keys, delList);
        }

        public override WebResponseContent Update(SaveModel saveModel)
        {
            UpdateOnExecuted = (Sys_QuartzOptions options, object addList, object updateList, List<object> delKeys) =>
            {
                _schedulerFactory.Update(options).GetAwaiter().GetResult();
                return webResponse.OK(); 
            };
            return base.Update(saveModel);
        }

        /// <summary>
        /// 手动执行一次
        /// </summary>
        /// <param name="taskOptions"></param>
        /// <returns></returns>
        public async Task<object> Run(Sys_QuartzOptions taskOptions)
        {
            return await _schedulerFactory.Run(taskOptions);
        }
        /// <summary>
        /// 开启任务
        /// </summary>
        /// <param name="schedulerFactory"></param>
        /// <param name="taskOptions"></param>
        /// <returns></returns>
        public async Task<object> Start(Sys_QuartzOptions taskOptions)
        {
            var result = await _schedulerFactory.Start(taskOptions);
            if (taskOptions.Status != (int)TriggerState.Normal)
            {
                taskOptions.Status = (int)TriggerState.Normal;
                _repository.Update(taskOptions, x => new { x.Status }, true);
            }
            return result;
        }

        /// <summary>
        /// 暂停任务
        /// </summary>
        /// <param name="schedulerFactory"></param>
        /// <param name="taskOptions"></param>
        /// <returns></returns>
        public async Task<object> Pause(Sys_QuartzOptions taskOptions)
        {
            var result = await _schedulerFactory.Remove(taskOptions);
            taskOptions.Status = (int)TriggerState.Paused;
            _repository.Update(taskOptions, x => new { x.Status }, true);
            return result;
        }
    }
}

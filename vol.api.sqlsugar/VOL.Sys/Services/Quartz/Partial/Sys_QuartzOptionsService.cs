using Microsoft.AspNetCore.Http;
using Microsoft.Extensions.DependencyInjection;
using Quartz;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using VOL.Core.Extensions;
using VOL.Core.Utilities;
using VOL.Entity.DomainModels;
using VOL.Sys.IRepositories;
using VOL.Core.Quartz;
using VOL.Core.DBManager;

namespace VOL.Sys.Services
{
    public partial class Sys_QuartzOptionsService
    {
        private readonly IHttpContextAccessor _httpContextAccessor;
        private readonly ISys_QuartzOptionsRepository _repository;
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
        }

        WebResponseContent webResponse = new WebResponseContent();

        public override WebResponseContent Add(SaveModel saveDataModel)
        {
            AddOnExecuting = (Sys_QuartzOptions options, object list) =>
            {
                // 新建默认暂停，需手动「恢复」后才按 Cron 执行
                options.Status = (int)TriggerState.Paused;
                return webResponse.OK();
            };

            Sys_QuartzOptions ops = null;
            AddOnExecuted = (Sys_QuartzOptions options, object list) =>
            {
                ops = options;
                return webResponse.OK();
            };

            var result = base.Add(saveDataModel);
            if (result.Status && ops != null)
            {
                ops.AddJob(_schedulerFactory).GetAwaiter().GetResult();
            }
            return result;
        }

        public override WebResponseContent Del(object[] keys, bool delList = true)
        {
            var ids = keys.Select(s => (Guid)(s.GetGuid())).ToArray();
            var list = repository.FindAsIQueryable(x => ids.Contains(x.Id)).ToList();
            foreach (var options in list)
            {
                _schedulerFactory.Remove(options).GetAwaiter().GetResult();
            }
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
        /// 手动执行一次（暂停中也可执行）
        /// </summary>
        public async Task<object> Run(Sys_QuartzOptions taskOptions)
        {
            taskOptions = await EnsureFullOptionsAsync(taskOptions).ConfigureAwait(false);
            return await _schedulerFactory.Run(taskOptions).ConfigureAwait(false);
        }

        /// <summary>
        /// 开启 / 恢复任务
        /// </summary>
        public async Task<object> Start(Sys_QuartzOptions taskOptions)
        {
            taskOptions = await EnsureFullOptionsAsync(taskOptions).ConfigureAwait(false);
            var result = await _schedulerFactory.Start(taskOptions).ConfigureAwait(false);
            if (IsActionSuccess(result))
            {
                taskOptions.Status = (int)TriggerState.Normal;
                _repository.Update(taskOptions, x => new { x.Status }, true);
            }
            return result;
        }

        /// <summary>
        /// 暂停任务
        /// </summary>
        public async Task<object> Pause(Sys_QuartzOptions taskOptions)
        {
            taskOptions = await EnsureFullOptionsAsync(taskOptions).ConfigureAwait(false);
            var result = await _schedulerFactory.Pause(taskOptions).ConfigureAwait(false);
            if (IsActionSuccess(result))
            {
                taskOptions.Status = (int)TriggerState.Paused;
                _repository.Update(taskOptions, x => new { x.Status }, true);
            }
            return result;
        }

        private async Task<Sys_QuartzOptions> EnsureFullOptionsAsync(Sys_QuartzOptions taskOptions)
        {
            if (taskOptions == null || taskOptions.Id == Guid.Empty)
                return taskOptions;

            var dbOptions = await _repository.FindAsIQueryable(x => x.Id == taskOptions.Id)
                .FirstOrDefaultAsync();

            return dbOptions ?? taskOptions;
        }

        private static bool IsActionSuccess(object result)
        {
            if (result == null)
                return false;

            var statusProp = result.GetType().GetProperty("status");
            if (statusProp == null)
                return true;

            object value = statusProp.GetValue(result);
            return value is bool b && b;
        }
    }
}

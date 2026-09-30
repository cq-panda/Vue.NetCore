using Microsoft.AspNetCore.Builder;
using Microsoft.AspNetCore.Hosting;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.DependencyInjection;
using Microsoft.Extensions.Hosting;
using Quartz;
using Quartz.Impl.Triggers;
using Quartz.Spi;
using System;
using System.Collections.Concurrent;
using System.Collections.Generic;
using System.Linq;
using System.Threading;
using System.Threading.Tasks;
using VOL.Core.EFDbContext;
using VOL.Entity.DomainModels;

namespace VOL.Core.Quartz
{
    /// <summary>
    /// Quartz 定时任务扩展：初始化、增删改、启停、立即执行。
    /// Status 与 Quartz.TriggerState 对齐：0=Normal(运行), 1=Paused(暂停)。
    /// </summary>
    public static class QuartzNETExtension
    {
        private const string DefaultGroup = "group";
        private const string JobDataTaskId = "TaskId";

        private static readonly ConcurrentDictionary<Guid, Sys_QuartzOptions> TaskCache = new();
        private static readonly SemaphoreSlim SchedulerLock = new(1, 1);

        private static ISchedulerFactory _schedulerFactory;
        private static IJobFactory _jobFactory;

        public static IApplicationBuilder UseQuartz(this IApplicationBuilder applicationBuilder, IWebHostEnvironment env)
        {
            var services = applicationBuilder.ApplicationServices;
            Initialize(
                services.GetRequiredService<ISchedulerFactory>(),
                services.GetRequiredService<IJobFactory>());

            var lifetime = services.GetRequiredService<IHostApplicationLifetime>();
            lifetime.ApplicationStarted.Register(() => _ = StartJobsAsync(lifetime.ApplicationStopping));
            lifetime.ApplicationStopping.Register(() =>
                ShutdownQuartzAsync().ConfigureAwait(false).GetAwaiter().GetResult());
            return applicationBuilder;
        }

        internal static void Initialize(ISchedulerFactory schedulerFactory, IJobFactory jobFactory)
        {
            _schedulerFactory = schedulerFactory;
            _jobFactory = jobFactory;
        }

        /// <summary>
        /// 从数据库加载任务并注册到调度器
        /// </summary>
        internal static async Task StartJobsAsync(CancellationToken cancellationToken = default)
        {
            try
            {
                await using var context = new VOLContext();
                List<Sys_QuartzOptions> tasks = await context.Set<Sys_QuartzOptions>()
                    .ToListAsync(cancellationToken)
                    .ConfigureAwait(false);

                foreach (Sys_QuartzOptions options in tasks)
                {
                    cancellationToken.ThrowIfCancellationRequested();
                    await options.AddJob(_schedulerFactory, _jobFactory).ConfigureAwait(false);
                }

                IScheduler scheduler = await GetSchedulerAsync(_schedulerFactory, _jobFactory).ConfigureAwait(false);
                await EnsureStartedAsync(scheduler).ConfigureAwait(false);
                Console.WriteLine($"Quartz 启动完成，共注册 {tasks.Count} 个作业");
            }
            catch (OperationCanceledException)
            {
                Console.WriteLine("Quartz 启动已取消");
            }
            catch (Exception ex)
            {
                Console.WriteLine($"作业启动异常:{ex.Message}{ex.StackTrace}");
                QuartzFileHelper.Error($"作业启动异常:{ex.Message}{ex.StackTrace}");
            }
        }

        public static async Task ShutdownQuartzAsync()
        {
            if (_schedulerFactory == null)
                return;

            try
            {
                IScheduler scheduler = await _schedulerFactory.GetScheduler().ConfigureAwait(false);
                if (scheduler != null && !scheduler.IsShutdown)
                {
                    await scheduler.Shutdown(waitForJobsToComplete: false).ConfigureAwait(false);
                    Console.WriteLine("Quartz 调度器已关闭");
                }
            }
            catch (Exception ex)
            {
                Console.WriteLine($"Quartz Shutdown 异常:{ex.Message}");
            }
        }

        /// <summary>
        /// 添加（或覆盖）作业。Status=1 加入后暂停；Status=0 保持运行。
        /// </summary>
        public static async Task<object> AddJob(
            this Sys_QuartzOptions taskOptions,
            ISchedulerFactory schedulerFactory,
            IJobFactory jobFactory = null)
        {
            if (taskOptions == null || taskOptions.Id == Guid.Empty)
                return Fail("任务参数无效");

            (bool valid, string validMsg) = taskOptions.CronExpression.IsValidExpression();
            if (!valid)
                return Fail(validMsg);

            await SchedulerLock.WaitAsync().ConfigureAwait(false);
            try
            {
                IScheduler scheduler = await GetSchedulerAsync(schedulerFactory, jobFactory).ConfigureAwait(false);
                await ScheduleOrReplaceJobAsync(scheduler, taskOptions, pauseAfterSchedule: IsPausedStatus(taskOptions.Status))
                    .ConfigureAwait(false);
                await EnsureStartedAsync(scheduler).ConfigureAwait(false);

                string msg = $"作业注册成功:{taskOptions.TaskName}, Status={taskOptions.Status}";
                QuartzFileHelper.OK(msg);
                return Ok(msg);
            }
            catch (Exception ex)
            {
                string msg = $"作业注册异常:{taskOptions.TaskName},{ex.Message}";
                QuartzFileHelper.Error(msg);
                return Fail(ex.Message);
            }
            finally
            {
                SchedulerLock.Release();
            }
        }

        public static Task<object> Remove(this ISchedulerFactory schedulerFactory, Sys_QuartzOptions taskOptions)
            => schedulerFactory.TriggerAction(JobAction.删除, taskOptions);

        public static Task<object> Update(this ISchedulerFactory schedulerFactory, Sys_QuartzOptions taskOptions)
            => schedulerFactory.TriggerAction(JobAction.修改, taskOptions);

        public static Task<object> Pause(this ISchedulerFactory schedulerFactory, Sys_QuartzOptions taskOptions)
            => schedulerFactory.TriggerAction(JobAction.暂停, taskOptions);

        public static Task<object> Start(this ISchedulerFactory schedulerFactory, Sys_QuartzOptions taskOptions)
            => schedulerFactory.TriggerAction(JobAction.开启, taskOptions);

        public static Task<object> Run(this ISchedulerFactory schedulerFactory, Sys_QuartzOptions taskOptions)
            => schedulerFactory.TriggerAction(JobAction.立即执行, taskOptions);

        /// <summary>
        /// 统一处理删除 / 修改 / 暂停 / 开启 / 立即执行
        /// </summary>
        public static async Task<object> TriggerAction(
            this ISchedulerFactory schedulerFactory,
            JobAction action,
            Sys_QuartzOptions taskOptions = null)
        {
            if (taskOptions == null || taskOptions.Id == Guid.Empty)
                return Fail("任务参数无效");

            await SchedulerLock.WaitAsync().ConfigureAwait(false);
            try
            {
                IScheduler scheduler = await GetSchedulerAsync(schedulerFactory).ConfigureAwait(false);
                await EnsureStartedAsync(scheduler).ConfigureAwait(false);

                JobKey jobKey = CreateJobKey(taskOptions);
                TriggerKey triggerKey = CreateTriggerKey(taskOptions);
                bool exists = await scheduler.CheckExists(jobKey).ConfigureAwait(false);

                if (!exists)
                {
                    if (action == JobAction.删除)
                    {
                        RemoveCache(taskOptions.Id);
                        return Ok($"作业{action}成功(调度器中不存在，已清理缓存)");
                    }

                    if (action == JobAction.暂停)
                        return Fail($"未找到作业[{taskOptions.TaskName}]，无法暂停");

                    Sys_QuartzOptions optionsToAdd = MergeWithCache(taskOptions);
                    if (string.IsNullOrWhiteSpace(optionsToAdd.CronExpression))
                        return Fail($"未找到作业[{taskOptions.TaskName}]，且缺少Cron表达式，无法自动注册");

                    bool pauseAfter = action == JobAction.立即执行 || IsPausedStatus(optionsToAdd.Status);
                    if (action == JobAction.开启)
                        pauseAfter = false;

                    await ScheduleOrReplaceJobAsync(scheduler, optionsToAdd, pauseAfter).ConfigureAwait(false);
                    taskOptions = optionsToAdd;
                    jobKey = CreateJobKey(taskOptions);
                    triggerKey = CreateTriggerKey(taskOptions);
                }

                switch (action)
                {
                    case JobAction.删除:
                        if (await scheduler.CheckExists(triggerKey).ConfigureAwait(false))
                        {
                            await scheduler.PauseTrigger(triggerKey).ConfigureAwait(false);
                            await scheduler.UnscheduleJob(triggerKey).ConfigureAwait(false);
                        }
                        if (await scheduler.CheckExists(jobKey).ConfigureAwait(false))
                        {
                            await scheduler.DeleteJob(jobKey).ConfigureAwait(false);
                        }
                        RemoveCache(taskOptions.Id);
                        break;

                    case JobAction.修改:
                        {
                            (bool valid, string validMsg) = taskOptions.CronExpression.IsValidExpression();
                            if (!valid)
                                return Fail(validMsg);

                            TriggerState previousState = TriggerState.Normal;
                            if (await scheduler.CheckExists(triggerKey).ConfigureAwait(false))
                            {
                                previousState = await scheduler.GetTriggerState(triggerKey).ConfigureAwait(false);
                            }

                            bool shouldPause = previousState == TriggerState.Paused || IsPausedStatus(taskOptions.Status);
                            await ScheduleOrReplaceJobAsync(scheduler, taskOptions, shouldPause).ConfigureAwait(false);
                            break;
                        }

                    case JobAction.暂停:
                        await scheduler.PauseJob(jobKey).ConfigureAwait(false);
                        taskOptions.Status = (int)TriggerState.Paused;
                        UpdateCacheStatus(taskOptions.Id, (int)TriggerState.Paused);
                        break;

                    case JobAction.开启:
                        // 重新计算下次触发时间，跳过暂停期间漏掉的触发，避免恢复后一次性补跑
                        await ResumeSkippingMissedFiresAsync(scheduler, taskOptions).ConfigureAwait(false);
                        taskOptions.Status = (int)TriggerState.Normal;
                        UpdateCacheStatus(taskOptions.Id, (int)TriggerState.Normal);
                        break;

                    case JobAction.立即执行:
                        // 不依赖触发器启停状态，暂停中也可手动执行一次
                        await scheduler.TriggerJob(jobKey).ConfigureAwait(false);
                        break;

                    default:
                        return Fail($"不支持的操作:{action}");
                }

                return Ok($"作业{action}成功");
            }
            catch (Exception ex)
            {
                QuartzFileHelper.Error($"作业{action}异常:{taskOptions?.TaskName},{ex.Message}");
                return Fail(ex.Message);
            }
            finally
            {
                SchedulerLock.Release();
            }
        }

        /// <summary>
        /// 从作业上下文解析任务配置
        /// </summary>
        public static Sys_QuartzOptions GetTaskOptions(this IJobExecutionContext context)
        {
            if (context == null)
                return null;

            string taskIdStr = context.MergedJobDataMap?.GetString(JobDataTaskId);
            if (Guid.TryParse(taskIdStr, out Guid taskId) && TaskCache.TryGetValue(taskId, out Sys_QuartzOptions byData))
                return CloneOptions(byData);

            if (context.Trigger is AbstractTrigger trigger)
            {
                if (Guid.TryParse(trigger.Name, out Guid triggerId) && TaskCache.TryGetValue(triggerId, out Sys_QuartzOptions byTrigger))
                    return CloneOptions(byTrigger);

                if (Guid.TryParse(trigger.JobName, out Guid jobId) && TaskCache.TryGetValue(jobId, out Sys_QuartzOptions byJob))
                    return CloneOptions(byJob);
            }

            if (context.JobDetail?.Key != null
                && Guid.TryParse(context.JobDetail.Key.Name, out Guid keyId)
                && TaskCache.TryGetValue(keyId, out Sys_QuartzOptions byKey))
            {
                return CloneOptions(byKey);
            }

            return null;
        }

        public static (bool, object) Exists(this Sys_QuartzOptions taskOptions, bool init)
        {
            if (!init && TaskCache.Values.Any(x =>
                    x.TaskName == taskOptions.TaskName
                    && NormalizeGroup(x.GroupName) == NormalizeGroup(taskOptions.GroupName)
                    && x.Id != taskOptions.Id))
            {
                return (false, Fail($"作业:{taskOptions.TaskName},分组：{taskOptions.GroupName}已经存在"));
            }
            return (true, null);
        }

        public static (bool, string) IsValidExpression(this string cronExpression)
        {
            if (string.IsNullOrWhiteSpace(cronExpression))
                return (false, "Cron表达式不能为空");

            try
            {
                var trigger = new CronTriggerImpl
                {
                    CronExpressionString = cronExpression
                };
                DateTimeOffset? date = trigger.ComputeFirstFireTimeUtc(null);
                return (date != null, date == null ? $"请确认表达式{cronExpression}是否正确!" : string.Empty);
            }
            catch (Exception e)
            {
                return (false, $"请确认表达式{cronExpression}是否正确!{e.Message}");
            }
        }

        #region 内部方法

        /// <summary>
        /// 删除旧作业后重新注册；调用方需已持有 SchedulerLock
        /// </summary>
        private static async Task ScheduleOrReplaceJobAsync(
            IScheduler scheduler,
            Sys_QuartzOptions taskOptions,
            bool pauseAfterSchedule)
        {
            UpsertCache(taskOptions);

            JobKey jobKey = CreateJobKey(taskOptions);
            TriggerKey triggerKey = CreateTriggerKey(taskOptions);

            if (await scheduler.CheckExists(jobKey).ConfigureAwait(false))
            {
                await scheduler.DeleteJob(jobKey).ConfigureAwait(false);
            }

            IJobDetail job = JobBuilder.Create<HttpResultfulJob>()
                .WithIdentity(jobKey)
                .WithDescription(taskOptions.TaskName ?? string.Empty)
                .UsingJobData(JobDataTaskId, taskOptions.Id.ToString())
                .Build();

            ITrigger trigger = BuildCronTrigger(taskOptions, jobKey, triggerKey);
            await scheduler.ScheduleJob(job, trigger).ConfigureAwait(false);

            if (pauseAfterSchedule)
            {
                await scheduler.PauseJob(jobKey).ConfigureAwait(false);
            }
        }

        /// <summary>
        /// 恢复任务：用当前时间重建触发器，丢弃暂停期间积压的 misfire
        /// </summary>
        private static async Task ResumeSkippingMissedFiresAsync(
            IScheduler scheduler,
            Sys_QuartzOptions taskOptions)
        {
            Sys_QuartzOptions options = MergeWithCache(taskOptions);
            if (string.IsNullOrWhiteSpace(options.CronExpression))
                throw new InvalidOperationException($"任务[{options.TaskName}]缺少Cron表达式，无法恢复");

            (bool valid, string validMsg) = options.CronExpression.IsValidExpression();
            if (!valid)
                throw new InvalidOperationException(validMsg);

            JobKey jobKey = CreateJobKey(options);
            TriggerKey triggerKey = CreateTriggerKey(options);

            if (!await scheduler.CheckExists(jobKey).ConfigureAwait(false))
            {
                await ScheduleOrReplaceJobAsync(scheduler, options, pauseAfterSchedule: false).ConfigureAwait(false);
                return;
            }

            UpsertCache(options);
            ITrigger newTrigger = BuildCronTrigger(options, jobKey, triggerKey);
            DateTimeOffset? next = await scheduler.RescheduleJob(triggerKey, newTrigger).ConfigureAwait(false);
            if (next == null)
            {
                // 触发器不存在时整作业重建
                await ScheduleOrReplaceJobAsync(scheduler, options, pauseAfterSchedule: false).ConfigureAwait(false);
            }
        }

        private static ITrigger BuildCronTrigger(
            Sys_QuartzOptions taskOptions,
            JobKey jobKey,
            TriggerKey triggerKey)
        {
            return TriggerBuilder.Create()
                .WithIdentity(triggerKey)
                .ForJob(jobKey)
                .StartAt(DateTimeOffset.Now)
                .WithDescription(taskOptions.Describe ?? taskOptions.TaskName ?? string.Empty)
                .WithCronSchedule(taskOptions.CronExpression, x =>
                {
                    // 错过的触发不补跑，等到下一个有效时间点
                    x.WithMisfireHandlingInstructionDoNothing();
                })
                .Build();
        }

        private static async Task<IScheduler> GetSchedulerAsync(
            ISchedulerFactory schedulerFactory,
            IJobFactory jobFactory = null)
        {
            IScheduler scheduler = await schedulerFactory.GetScheduler().ConfigureAwait(false);
            IJobFactory factory = jobFactory ?? _jobFactory;
            if (factory != null)
            {
                scheduler.JobFactory = factory;
            }
            return scheduler;
        }

        private static async Task EnsureStartedAsync(IScheduler scheduler)
        {
            if (!scheduler.IsStarted && !scheduler.IsShutdown)
            {
                await scheduler.Start().ConfigureAwait(false);
            }
        }

        private static JobKey CreateJobKey(Sys_QuartzOptions options)
            => new JobKey(options.Id.ToString(), DefaultGroup);

        private static TriggerKey CreateTriggerKey(Sys_QuartzOptions options)
            => new TriggerKey(options.Id.ToString(), DefaultGroup);

        private static string NormalizeGroup(string groupName)
            => string.IsNullOrWhiteSpace(groupName) ? DefaultGroup : groupName.Trim();

        private static bool IsPausedStatus(int? status)
            => status == (int)TriggerState.Paused;

        private static void UpsertCache(Sys_QuartzOptions options)
        {
            TaskCache.AddOrUpdate(options.Id, _ => CloneOptions(options), (_, __) => CloneOptions(options));
        }

        private static void RemoveCache(Guid id) => TaskCache.TryRemove(id, out _);

        private static void UpdateCacheStatus(Guid id, int status)
        {
            if (TaskCache.TryGetValue(id, out Sys_QuartzOptions cached))
            {
                cached.Status = status;
            }
        }

        private static Sys_QuartzOptions MergeWithCache(Sys_QuartzOptions incoming)
        {
            if (TaskCache.TryGetValue(incoming.Id, out Sys_QuartzOptions cached))
            {
                var merged = CloneOptions(cached);
                if (!string.IsNullOrWhiteSpace(incoming.TaskName)) merged.TaskName = incoming.TaskName;
                if (!string.IsNullOrWhiteSpace(incoming.GroupName)) merged.GroupName = incoming.GroupName;
                if (!string.IsNullOrWhiteSpace(incoming.CronExpression)) merged.CronExpression = incoming.CronExpression;
                if (!string.IsNullOrWhiteSpace(incoming.ApiUrl)) merged.ApiUrl = incoming.ApiUrl;
                if (incoming.Method != null) merged.Method = incoming.Method;
                if (incoming.PostData != null) merged.PostData = incoming.PostData;
                if (incoming.AuthKey != null) merged.AuthKey = incoming.AuthKey;
                if (incoming.AuthValue != null) merged.AuthValue = incoming.AuthValue;
                if (incoming.Describe != null) merged.Describe = incoming.Describe;
                if (incoming.TimeOut.HasValue) merged.TimeOut = incoming.TimeOut;
                if (incoming.Status.HasValue) merged.Status = incoming.Status;
                return merged;
            }

            return CloneOptions(incoming);
        }

        private static Sys_QuartzOptions CloneOptions(Sys_QuartzOptions source)
        {
            if (source == null)
                return null;

            return new Sys_QuartzOptions
            {
                Id = source.Id,
                TaskName = source.TaskName,
                GroupName = source.GroupName,
                Method = source.Method,
                TimeOut = source.TimeOut,
                CronExpression = source.CronExpression,
                ApiUrl = source.ApiUrl,
                PostData = source.PostData,
                AuthKey = source.AuthKey,
                AuthValue = source.AuthValue,
                Describe = source.Describe,
                LastRunTime = source.LastRunTime,
                Status = source.Status,
                CreateID = source.CreateID,
                Creator = source.Creator,
                CreateDate = source.CreateDate,
                ModifyID = source.ModifyID,
                Modifier = source.Modifier,
                ModifyDate = source.ModifyDate
            };
        }

        private static object Ok(string msg) => new { status = true, msg };

        private static object Fail(string msg) => new { status = false, msg };

        #endregion
    }
}

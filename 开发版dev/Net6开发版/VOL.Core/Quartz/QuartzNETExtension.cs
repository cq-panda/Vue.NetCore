using Microsoft.AspNetCore.Builder;
using Microsoft.AspNetCore.Hosting;
using Microsoft.Extensions.DependencyInjection;
using Newtonsoft.Json;
using Quartz;
using Quartz.Impl;
using Quartz.Impl.Matchers;
using Quartz.Impl.Triggers;
using Quartz.Spi;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using VOL.Core.DBManager;
using VOL.Core.EFDbContext;
using VOL.Core.Extensions;
using VOL.Core.Utilities;
using VOL.Entity.DomainModels;

namespace VOL.Core.Quartz
{
    public static class QuartzNETExtension
    {
        private static List<Sys_QuartzOptions> _taskList = new List<Sys_QuartzOptions>();

        /// <summary>
        /// 初始化作业
        /// </summary>
        /// <param name="applicationBuilder"></param>
        /// <param name="env"></param>
        /// <returns></returns>
        public static IApplicationBuilder UseQuartz(this IApplicationBuilder applicationBuilder, IWebHostEnvironment env)
        {
            IServiceProvider services = applicationBuilder.ApplicationServices;
            ISchedulerFactory _schedulerFactory = services.GetService<ISchedulerFactory>();
            try
            {
                _taskList = services.GetService<VOLContext>().Set<Sys_QuartzOptions>().Where(x=>x.Status==0).ToList();
                for (int i = 0; i < 1; i++)
                {
                    _taskList.Add(new Sys_QuartzOptions()
                    {
                        Id = Guid.NewGuid(),
                        GroupName = $"group{i}",
                        TaskName = $"task{i}",
                        CronExpression = "0 0 0 1 * ?",
                        Status = 0
                    });
                }
                _taskList.ForEach(options =>
                {
                    options.AddJob(_schedulerFactory, jobFactory: services.GetService<IJobFactory>()).GetAwaiter().GetResult();
                });
            }
            catch (Exception ex)
            {
                Console.WriteLine($"作业启动异常:{ex.Message + ex.StackTrace}");
            }
            return applicationBuilder;
        }


        private static async Task<bool> CheckTask(Sys_QuartzOptions taskOptions, ISchedulerFactory schedulerFactory)
        {
            string groupName = "group";
            string taskName = taskOptions.Id.ToString();
            IScheduler scheduler = await schedulerFactory.GetScheduler();
            List<JobKey> jobKeys =(await scheduler.GetJobKeys(GroupMatcher<JobKey>.GroupEquals(groupName))).ToList();
            if (jobKeys == null || jobKeys.Count() == 0)
            {
                return false;
            }
            JobKey jobKey = jobKeys.Where(s => scheduler.GetTriggersOfJob(s).Result
                            .Any(x => (x as CronTriggerImpl).Name == taskName))
                            .FirstOrDefault();
            if (jobKey == null)
            {
                return false;
            }
            var triggers = await scheduler.GetTriggersOfJob(jobKey);
            ITrigger trigger = triggers?.Where(x => (x as CronTriggerImpl).Name == taskName).FirstOrDefault();

            if (trigger == null)
            {
                return false;
            }
            return true;
        }

        /// <summary>
        /// 添加作业
        /// </summary>
        /// <param name="taskOptions"></param>
        /// <param name="schedulerFactory"></param>
        /// <param name="init">是否初始化,否=需要重新生成配置文件，是=不重新生成配置文件</param>
        /// <returns></returns>
        public static async Task<object> AddJob(this Sys_QuartzOptions taskOptions, ISchedulerFactory schedulerFactory, IJobFactory jobFactory = null)
        {
            string msg = null;
            try
            {
                if (await CheckTask(taskOptions,schedulerFactory))
                {
                  await  schedulerFactory.TriggerAction(JobAction.开启, taskOptions);
                    return new { status = true };
                }
                if (!_taskList.Exists(x => x.Id == taskOptions.Id))
                {
                    _taskList.Add(taskOptions); 
                }
                else
                {
                    _taskList = _taskList.Where(x => x.Id != taskOptions.Id).ToList();
                    _taskList.Add(taskOptions);
                }
                taskOptions.GroupName = "group";
                (bool, string) validExpression = taskOptions.CronExpression.IsValidExpression();
                if (!validExpression.Item1)
                {
                    msg = $"添加作业失败，作业:{taskOptions.TaskName},表达式不正确:{ taskOptions.CronExpression}";
                    Console.WriteLine(msg);
                    QuartzFileHelper.Error(msg);
                    return new { status = false, msg = validExpression.Item2 };
                }

                IJobDetail job = JobBuilder.Create<HttpResultfulJob>()
               .WithIdentity(taskOptions.Id.ToString(), "group").Build();
                ITrigger trigger = TriggerBuilder.Create()
                   .WithIdentity(taskOptions.Id.ToString(), "group")
                  // .st()
                   .WithDescription(taskOptions.Describe)
                   .WithCronSchedule(taskOptions.CronExpression)
                   .Build();

                IScheduler scheduler = await schedulerFactory.GetScheduler();

                if (jobFactory == null)
                {
                    jobFactory = HttpContext.Current.RequestServices.GetService<IJobFactory>();
                }

                if (jobFactory != null)
                {
                    scheduler.JobFactory = jobFactory;
                }

                await scheduler.ScheduleJob(job, trigger);
                await scheduler.Start();
                msg = $"作业启动:{taskOptions.TaskName}";
                Console.WriteLine(msg);
                QuartzFileHelper.Error(msg);
                //if (taskOptions.Status == (int)TriggerState.Normal)
                //{
                //    await scheduler.Start();
                //    msg = $"作业启动:{taskOptions.TaskName}";
                //    Console.WriteLine(msg);
                //    QuartzFileHelper.Error(msg);
                //}
                //else
                //{
                //    await scheduler.PauseJob(job.Key);
                //}
            }
            catch (Exception ex)
            {
                msg = $"作业启动异常:{taskOptions.TaskName},{ex.Message}";
                Console.WriteLine(msg);
                QuartzFileHelper.Error(msg);
                return new { status = false, msg = ex.Message };
            }
            return new { status = true };
        }

        /// <summary>
        /// 移除作业
        /// </summary>
        /// <param name="schedulerFactory"></param>
        /// <param name="taskName"></param>
        /// <param name="groupName"></param>
        /// <returns></returns>
        public static Task<object> Remove(this ISchedulerFactory schedulerFactory, Sys_QuartzOptions taskOptions)
        {
            return schedulerFactory.TriggerAction(JobAction.删除, taskOptions);
        }

        /// <summary>
        /// 更新作业
        /// </summary>
        /// <param name="schedulerFactory"></param>
        /// <param name="taskOptions"></param>
        /// <returns></returns>
        public static Task<object> Update(this ISchedulerFactory schedulerFactory, Sys_QuartzOptions taskOptions)
        {
            return schedulerFactory.TriggerAction(JobAction.修改, taskOptions);
        }

        /// <summary>
        /// 暂停作业
        /// </summary>
        /// <param name="schedulerFactory"></param>
        /// <param name="taskOptions"></param>
        /// <returns></returns>
        public static Task<object> Pause(this ISchedulerFactory schedulerFactory, Sys_QuartzOptions taskOptions)
        {
            return schedulerFactory.TriggerAction(JobAction.暂停, taskOptions);
        }

        /// <summary>
        /// 启动作业
        /// </summary>
        /// <param name="schedulerFactory"></param>
        /// <param name="taskOptions"></param>
        /// <returns></returns>
        public static Task<object> Start(this ISchedulerFactory schedulerFactory, Sys_QuartzOptions taskOptions)
        {
            return taskOptions.AddJob(schedulerFactory);
          //  return  schedulerFactory.TriggerAction(JobAction.开启, taskOptions);
        }

        /// <summary>
        /// 立即执行一次作业
        /// </summary>
        /// <param name="schedulerFactory"></param>
        /// <param name="taskOptions"></param>
        /// <returns></returns>
        public static Task<object> Run(this ISchedulerFactory schedulerFactory, Sys_QuartzOptions taskOptions)
        {
            return schedulerFactory.TriggerAction(JobAction.立即执行, taskOptions);
        }

        /// <summary>
        /// 触发新增、删除、修改、暂停、启用、立即执行事件
        /// </summary>
        /// <param name="schedulerFactory"></param>
        /// <param name="taskName"></param>
        /// <param name="groupName"></param>
        /// <param name="action"></param>
        /// <param name="taskOptions"></param>
        /// <returns></returns>
        public static async Task<object> TriggerAction(
            this ISchedulerFactory schedulerFactory,
            JobAction action,
            Sys_QuartzOptions taskOptions = null)
        {
            string errorMsg = "";
            try
            {
                string groupName = "group";
                string taskName = taskOptions.Id.ToString();
                IScheduler scheduler = await schedulerFactory.GetScheduler();
                List<JobKey> jobKeys = scheduler.GetJobKeys(GroupMatcher<JobKey>.GroupEquals(groupName)).Result.ToList();
                if (jobKeys == null || jobKeys.Count() == 0) 
                {
                    errorMsg = $"未找到分组[{groupName}]";
                    return new { status = false, msg = errorMsg };
                }
                JobKey jobKey = jobKeys.Where(s => scheduler.GetTriggersOfJob(s).Result
                                .Any(x => (x as CronTriggerImpl).Name == taskName))
                                .FirstOrDefault();
                if (jobKey == null)
                {
                    errorMsg = $"未找到触发器[{taskName}]";
                    return new { status = false, msg = errorMsg };
                }
                var triggers = await scheduler.GetTriggersOfJob(jobKey);
                ITrigger trigger = triggers?.Where(x => (x as CronTriggerImpl).Name == taskName).FirstOrDefault();

                if (trigger == null)
                {
                    errorMsg = $"未找到触发器[{taskName}]";
                    return new { status = false, msg = errorMsg };
                }
                object result = null;
                switch (action)
                {
                    case JobAction.删除:
                    case JobAction.修改:
                    case JobAction.暂停:
                        await scheduler.PauseTrigger(trigger.Key);
                        await scheduler.UnscheduleJob(trigger.Key);// 移除触发器
                        await scheduler.DeleteJob(trigger.JobKey);
                        if (action==JobAction.暂停)
                        {
                            taskOptions.Status = (int)JobAction.暂停;
                        }
                        break;
                    case JobAction.开启:
                        await scheduler.ResumeTrigger(trigger.Key);
                        await scheduler.TriggerJob(jobKey);
                        break;
                }  
                return result ?? new { status = true, msg = $"作业{action.ToString()}成功" };
            }
            catch (Exception ex)
            {
                errorMsg = ex.Message;
                return new { status = false, msg = ex.Message };
            }
        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="context"></param>通过作业上下文获取作业对应的配置参数
        /// <returns></returns>
        public static Sys_QuartzOptions GetTaskOptions(this IJobExecutionContext context)
        {
            AbstractTrigger trigger = (context as JobExecutionContextImpl).Trigger as AbstractTrigger;
            Sys_QuartzOptions taskOptions = _taskList.Where(x => x.Id.ToString() == trigger.Name).FirstOrDefault();
            return taskOptions ?? _taskList.Where(x => x.Id.ToString() == trigger.JobName).FirstOrDefault();
        }

        /// <summary>
        /// 作业是否存在
        /// </summary>
        /// <param name="taskOptions"></param>
        /// <param name="init">初始化的不需要判断</param>
        /// <returns></returns>
        public static (bool, object) Exists(this Sys_QuartzOptions taskOptions, bool init)
        {
            if (!init && _taskList.Any(x => x.TaskName == taskOptions.TaskName && x.GroupName == taskOptions.GroupName))
            {
                return (false,
                    new
                    {
                        status = false,
                        msg = $"作业:{taskOptions.TaskName},分组：{taskOptions.GroupName}已经存在"
                    });
            }
            return (true, null);
        }

        public static (bool, string) IsValidExpression(this string cronExpression)
        {
            try
            {
                CronTriggerImpl trigger = new CronTriggerImpl();
                trigger.CronExpressionString = cronExpression;
                DateTimeOffset? date = trigger.ComputeFirstFireTimeUtc(null);
                return (date != null, date == null ? $"请确认表达式{cronExpression}是否正确!" : "");
            }
            catch (Exception e)
            {
                return (false, $"请确认表达式{cronExpression}是否正确!{e.Message}");
            }
        }
    }

}

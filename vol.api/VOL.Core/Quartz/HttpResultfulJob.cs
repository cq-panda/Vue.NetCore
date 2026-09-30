using Microsoft.EntityFrameworkCore;
using Quartz;
using Quartz.Impl;
using Quartz.Impl.Triggers;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Http;
using System.Threading.Tasks;
using VOL.Core.EFDbContext;
using VOL.Entity.DomainModels;

namespace VOL.Core.Quartz
{
    /// <summary>
    /// HTTP 回调型定时作业
    /// </summary>
    [DisallowConcurrentExecution]
    public class HttpResultfulJob : IJob
    {
        private readonly IHttpClientFactory _httpClientFactory;

        public HttpResultfulJob(IHttpClientFactory httpClientFactory)
        {
            _httpClientFactory = httpClientFactory;
        }

        public async Task Execute(IJobExecutionContext context)
        {
            DateTime start = DateTime.Now;
            Sys_QuartzOptions taskOptions = context.GetTaskOptions();
            string httpMessage = string.Empty;
            string exceptionMsg = null;

            if (taskOptions == null)
            {
                QuartzFileHelper.Error($"未获取到作业配置, JobKey={context.JobDetail?.Key}");
                return;
            }

            if (string.IsNullOrWhiteSpace(taskOptions.ApiUrl) || taskOptions.ApiUrl == "/")
            {
                QuartzFileHelper.Error($"未配置作业:{taskOptions.TaskName}的url地址");
                return;
            }

            try
            {
                await UpdateLastRunTimeAsync(taskOptions.Id).ConfigureAwait(false);

                var headers = new Dictionary<string, string>();
                if (!string.IsNullOrWhiteSpace(taskOptions.AuthKey)
                    && !string.IsNullOrWhiteSpace(taskOptions.AuthValue))
                {
                    headers[taskOptions.AuthKey.Trim()] = taskOptions.AuthValue.Trim();
                }

                bool isGet = string.Equals(taskOptions.Method, "get", StringComparison.OrdinalIgnoreCase);
                httpMessage = await _httpClientFactory.SendAsync(
                    isGet ? HttpMethod.Get : HttpMethod.Post,
                    taskOptions.ApiUrl,
                    taskOptions.PostData,
                    taskOptions.TimeOut ?? 180,
                    headers).ConfigureAwait(false);
            }
            catch (Exception ex)
            {
                exceptionMsg = ex.Message + ex.StackTrace;
                QuartzFileHelper.Error($"作业执行异常:{taskOptions.TaskName},{exceptionMsg}");
            }
            finally
            {
                await WriteLogAsync(taskOptions, start, httpMessage, exceptionMsg).ConfigureAwait(false);
            }
        }

        private static async Task UpdateLastRunTimeAsync(Guid taskId)
        {
            try
            {
                await using var dbContext = new VOLContext();
                var entity = await dbContext.Set<Sys_QuartzOptions>()
                    .AsTracking()
                    .FirstOrDefaultAsync(x => x.Id == taskId)
                    .ConfigureAwait(false);

                if (entity == null)
                    return;

                entity.LastRunTime = DateTime.Now;
                dbContext.Entry(entity).Property(x => x.LastRunTime).IsModified = true;
                await dbContext.SaveChangesAsync().ConfigureAwait(false);
            }
            catch (Exception ex)
            {
                QuartzFileHelper.Error($"更新LastRunTime失败:{taskId},{ex.Message}");
            }
        }

        private static async Task WriteLogAsync(
            Sys_QuartzOptions taskOptions,
            DateTime start,
            string httpMessage,
            string exceptionMsg)
        {
            try
            {
                var log = new Sys_QuartzLog
                {
                    LogId = Guid.NewGuid(),
                    TaskName = taskOptions.TaskName,
                    Id = taskOptions.Id,
                    CreateDate = start,
                    ElapsedTime = Convert.ToInt32((DateTime.Now - start).TotalSeconds),
                    ResponseContent = httpMessage,
                    ErrorMsg = exceptionMsg,
                    StratDate = start,
                    Result = exceptionMsg == null ? 1 : 0,
                    EndDate = DateTime.Now
                };

                await using var dbContext = new VOLContext();
                dbContext.Set<Sys_QuartzLog>().Add(log);
                await dbContext.SaveChangesAsync().ConfigureAwait(false);
            }
            catch (Exception ex)
            {
                QuartzFileHelper.Error($"日志写入异常:{taskOptions.TaskName},{ex.Message}");
            }
        }
    }
}

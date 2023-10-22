using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Configuration;
using Quartz;
using Quartz.Impl;
using Quartz.Impl.Triggers;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Http;
using System.Threading.Tasks;
using VOL.Core.Configuration;
using VOL.Core.DBManager;
using VOL.Core.DbSqlSugar;
using VOL.Core.Utilities;
using VOL.Entity.DomainModels;

namespace VOL.Core.Quartz
{
    public class HttpResultfulJob : IJob
    {
        readonly IHttpClientFactory _httpClientFactory;

        readonly IServiceProvider _serviceProvider;
        /// <summary>
        /// 2020.05.31增加构造方法
        /// </summary>
        /// <param name="serviceProvider"></param>
        /// <param name="httpClientFactory"></param>
        public HttpResultfulJob(IServiceProvider serviceProvider, IHttpClientFactory httpClientFactory)
        {
            _httpClientFactory = httpClientFactory;
            _serviceProvider = serviceProvider;
        }
        public async Task Execute(IJobExecutionContext context)
        {
            DateTime dateTime = DateTime.Now;
            Sys_QuartzOptions taskOptions = context.GetTaskOptions();
            string httpMessage = "";
            AbstractTrigger trigger = (context as JobExecutionContextImpl).Trigger as AbstractTrigger;
            if (taskOptions == null)
            {
                Console.WriteLine($"未获取到作业");
                return;
            }
            if (string.IsNullOrEmpty(taskOptions.ApiUrl) || taskOptions.ApiUrl == "/")
            {
                Console.WriteLine($"未配置作业:{taskOptions.TaskName}的url地址");
                QuartzFileHelper.Error($"未配置作业:{taskOptions.TaskName}的url地址");
                return;
            }
            string exceptionMsg = null;

            try
            {


                var _taskOptions = DbManger.SqlSugarClient.Set<Sys_QuartzOptions>()
                      .Where(x => x.Id == taskOptions.Id).FirstOrDefault();

                if (_taskOptions != null)
                {
                    _taskOptions.LastRunTime = DateTime.Now;
                    DbManger.SqlSugarClient.Update(_taskOptions, new string[] { "LastRunTime" });

                    DbManger.SqlSugarClient.SaveChanges();
                }

                Dictionary<string, string> header = new Dictionary<string, string>();
                if (!string.IsNullOrEmpty(taskOptions.AuthKey)
                    && !string.IsNullOrEmpty(taskOptions.AuthValue))
                {
                    header.Add(taskOptions.AuthKey.Trim(), taskOptions.AuthValue.Trim());
                }

                httpMessage = await _httpClientFactory.SendAsync(
                    taskOptions.Method?.ToLower() == "get" ? HttpMethod.Get : HttpMethod.Post,
                    taskOptions.ApiUrl,
                    taskOptions.PostData,
                    taskOptions.TimeOut ?? 180,
                    header); ;
            }
            catch (Exception ex)
            {
                exceptionMsg = ex.Message + ex.StackTrace;
            }
            finally
            {
                try
                {
                    var log = new Sys_QuartzLog
                    {
                        LogId = Guid.NewGuid(),
                        TaskName = taskOptions.TaskName,
                        Id = taskOptions.Id,
                        CreateDate = dateTime,
                        ElapsedTime = Convert.ToInt32((DateTime.Now - dateTime).TotalSeconds),
                        ResponseContent = httpMessage,
                        ErrorMsg = exceptionMsg,
                        StratDate = dateTime,
                        Result = exceptionMsg == null ? 1 : 0,
                        EndDate = DateTime.Now
                    };
                    DbManger.SqlSugarClient.Add(log);
                    DbManger.SqlSugarClient.SaveChanges();
                }
                catch (Exception ex)
                {
                    Console.WriteLine($"日志写入异常:{taskOptions.TaskName},{ex.Message}");
                    QuartzFileHelper.Error($"日志写入异常:{typeof(HttpResultfulJob).Name},{taskOptions.TaskName},{ex.Message}");
                }
            }
            Console.WriteLine(trigger.FullName + " " + DateTime.Now.ToString("yyyy-MM-dd HH:mm:sss") + " " + httpMessage);
            return;
        }
    }
    public class TaskOptions
    {
        public string TaskName { get; set; }
        public string GroupName { get; set; }
        public string Interval { get; set; }
        public string ApiUrl { get; set; }
        public string AuthKey { get; set; }
        public string AuthValue { get; set; }
        public string Describe { get; set; }
        public string RequestType { get; set; }
        public DateTime? LastRunTime { get; set; }
        public int Status { get; set; }
    }
}

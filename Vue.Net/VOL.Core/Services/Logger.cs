using Microsoft.AspNetCore.Http;
using System;
using System.Collections.Concurrent;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading;
using System.Threading.Tasks;
using System.Web;
using VOL.Core.Configuration;
using VOL.Core.DBManager;
using VOL.Core.Enums;
using VOL.Core.Extensions;
using VOL.Core.ManageUser;
using VOL.Entity.DomainModels;

namespace VOL.Core.Services
{
    /// <summary>
    /// 通过内置队列异步定时写日志
    /// </summary>
    public static class Logger
    {
        public static ConcurrentQueue<Sys_Log> loggerQueueData = new ConcurrentQueue<Sys_Log>();
        private static DateTime lastClearFileDT = DateTime.Now.AddDays(-1);
        private static string _loggerPath = AppSetting.DownLoadPath + "Logger\\Queue\\";
        static Logger()
        {
            Task.Run(() => { Start(); });
        }

        public static void Info(string message)
        {
            Info(LoggerType.Info, message);
        }
        public static void Info(LoggerType loggerType, string message = null)
        {
            Info(loggerType, message, null, null);
        }
        public static void Info(LoggerType loggerType, string requestParam, string resposeParam, string ex = null)
        {
            Add(loggerType, requestParam, resposeParam, ex, LoggerStatus.Info);
        }

        public static void OK(string message)
        {
            OK(LoggerType.Success, message);
        }
        public static void OK(LoggerType loggerType, string message = null)
        {
            OK(loggerType, message, null, null);
        }
        public static void OK(LoggerType loggerType, string requestParam, string resposeParam, string ex = null)
        {
            Add(loggerType, requestParam, resposeParam, ex, LoggerStatus.Success);
        }
        public static void Error(string message)
        {
            Error(LoggerType.Error, message);
        }
        public static void Error(LoggerType loggerType, string message)
        {
            Error(loggerType, message, null, null);
        }
        public static void Error(LoggerType loggerType, string requestParam, string resposeParam, string ex = null)
        {
            Add(loggerType, requestParam, resposeParam, ex, LoggerStatus.Error);
        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="requestParameter">请求参数</param>
        /// <param name="responseParameter">响应参数</param>
        /// <param name="success">响应结果1、成功,2、异常，0、其他</param>
        /// <param name="userInfo">用户数据</param>
        private static void Add(LoggerType loggerType, string requestParameter, string responseParameter, string ex, LoggerStatus status)
        {
            Sys_Log log = null;
            try
            {
                HttpContext context = Utilities.HttpContext.Current;
                if (context.Request.Method == "OPTIONS") return;
                ActionObserver cctionObserver = (context.RequestServices.GetService(typeof(ActionObserver)) as ActionObserver);
                if (context == null)
                {
                    WriteText($"未获取到httpcontext信息,type:{loggerType.ToString()},reqParam:{requestParameter},respParam:{responseParameter},ex:{ex},success:{status.ToString()}");
                    return;
                }
                UserInfo userInfo = UserContext.Current.UserInfo;
                log = new Sys_Log()
                {
                    BeginDate = cctionObserver.RequestDate,
                    EndDate = DateTime.Now,
                    User_Id = userInfo.User_Id,
                    UserName = userInfo.UserTrueName,
                    Role_Id = userInfo.Role_Id,
                    LogType = loggerType.ToString(),
                    ExceptionInfo = ex,
                    RequestParameter = requestParameter,
                    ResponseParameter = responseParameter,
                    Success = (int)status
                };
                SetServicesInfo(log, context);
            }
            catch (Exception exception)
            {
                log = log ?? new Sys_Log()
                {
                    BeginDate = DateTime.Now,
                    EndDate = DateTime.Now,
                    LogType = loggerType.ToString(),
                    RequestParameter = requestParameter,
                    ResponseParameter = responseParameter,
                    Success = (int)status,
                    ExceptionInfo = ex + exception.Message
                };
            }
            loggerQueueData.Enqueue(log);
        }

        private static void Start()
        {
            DataTable queueTable = CreateEmptyTable();
            while (true)
            {
                try
                {
                    if (loggerQueueData.Count() > 0 && queueTable.Rows.Count < 500)
                    {
                        DequeueToTable(queueTable); continue;
                    }
                    //每5秒写一次数据
                    Thread.Sleep(5000);
                    if (queueTable.Rows.Count == 0) { continue; }

                    DBServerProvider.SqlDapper.BulkInsert(queueTable, "Sys_Log", SqlBulkCopyOptions.KeepIdentity, null, _loggerPath);

                    queueTable.Clear();

                    if ((DateTime.Now - lastClearFileDT).TotalDays > 1)
                    {
                        Utilities.FileHelper.DeleteFolder(_loggerPath);
                        lastClearFileDT = DateTime.Now;
                    }
                }
                catch (Exception ex)
                {
                    Console.WriteLine($"日志批量写入数据时出错:{ex.Message}");
                    WriteText(ex.Message + ex.StackTrace + ex.Source);
                    queueTable.Clear();
                }

            }

        }

        private static void WriteText(string message)
        {
            try
            {
                Utilities.FileHelper.WriteFile(_loggerPath + "WriteError\\", $"{DateTime.Now.ToString("yyyyMMdd")}.txt", message + "\r\n");
            }
            catch (Exception ex)
            {
                Console.WriteLine($"日志写入文件时出错:{ex.Message}");
            }
        }

        private static void DequeueToTable(DataTable queueTable)
        {
            loggerQueueData.TryDequeue(out Sys_Log log);
            DataRow row = queueTable.NewRow();
            if (log.BeginDate == null)
            {
                log.BeginDate = DateTime.Now;
            }
            //  row["Id"] = log.Id;
            row["LogType"] = log.LogType;
            row["RequestParameter"] = log.RequestParameter;
            row["ResponseParameter"] = log.ResponseParameter;
            row["ExceptionInfo"] = log.ExceptionInfo;
            row["Success"] = log.Success ?? -1;
            row["BeginDate"] = log.BeginDate;
            row["EndDate"] = log.EndDate;
            row["ElapsedTime"] = ((DateTime)log.EndDate - (DateTime)log.BeginDate).TotalMilliseconds;
            row["UserIP"] = log.UserIP;
            row["ServiceIP"] = log.ServiceIP;
            row["BrowserType"] = log.BrowserType;
            row["Url"] = log.Url;
            row["User_Id"] = log.User_Id ?? -1;
            row["UserName"] = log.UserName;
            row["Role_Id"] = log.Role_Id ?? -1;
            queueTable.Rows.Add(row);
        }
        private static DataTable CreateEmptyTable()
        {
            DataTable queueTable = new DataTable();
            queueTable.Columns.Add("LogType", typeof(string));
            queueTable.Columns.Add("RequestParameter", typeof(string));
            queueTable.Columns.Add("ResponseParameter", typeof(string));
            queueTable.Columns.Add("ExceptionInfo", typeof(string));
            queueTable.Columns.Add("Success", Type.GetType("System.Int32"));
            queueTable.Columns.Add("BeginDate", Type.GetType("System.DateTime"));
            queueTable.Columns.Add("EndDate", Type.GetType("System.DateTime"));
            queueTable.Columns.Add("ElapsedTime", Type.GetType("System.Int32"));
            queueTable.Columns.Add("UserIP", typeof(string));
            queueTable.Columns.Add("ServiceIP", typeof(string));
            queueTable.Columns.Add("BrowserType", typeof(string));
            queueTable.Columns.Add("Url", typeof(string));
            queueTable.Columns.Add("User_Id", Type.GetType("System.Int32"));
            queueTable.Columns.Add("UserName", typeof(string));
            queueTable.Columns.Add("Role_Id", Type.GetType("System.Int32"));
            return queueTable;
        }

        public static void SetServicesInfo(Sys_Log log, HttpContext context)
        {
            string result = String.Empty;
            log.Url = context.Request.Scheme + "://" + context.Request.Host + context.Request.PathBase +
                context.Request.Path;

            log.UserIP = context.GetUserIp()?.Replace("::ffff:", "");
            log.ServiceIP = context.Connection.LocalIpAddress.MapToIPv4().ToString() + ":" + context.Connection.LocalPort;

            log.BrowserType = context.Request.Headers["User-Agent"];
            if (string.IsNullOrEmpty(log.RequestParameter))
            {
                try
                {
                    log.RequestParameter = context.GetRequestParameters();
                    if (log.RequestParameter != null)
                    {
                        log.RequestParameter = HttpUtility.UrlDecode(log.RequestParameter, Encoding.UTF8);
                    }
                }
                catch (Exception ex)
                {
                    log.ExceptionInfo += $"日志读取参数出错:{ex.Message}";
                    Console.WriteLine($"日志读取参数出错:{ex.Message}");
                }
            }
        }
    }

    public enum LoggerStatus
    {
        Success = 1,
        Error = 2,
        Info = 3
    }
}

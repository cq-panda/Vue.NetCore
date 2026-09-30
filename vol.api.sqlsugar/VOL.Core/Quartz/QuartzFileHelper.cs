using System;
using VOL.Core.Configuration;
using VOL.Core.Extensions;
using VOL.Core.Utilities;

namespace VOL.Core.Quartz
{
    /// <summary>
    /// 定时任务本地日志写入
    /// </summary>
    public static class QuartzFileHelper
    {
        public static void OK(string message) => Write(message, "log");

        public static void Error(string message) => Write(message, "error");

        private static void Write(string message, string folder)
        {
            try
            {
                string fileName = DateTime.Now.ToString("yyyy-MM-dd");
                string path = $"{AppSetting.CurrentPath}\\quartz\\{folder}\\".ReplacePath();
                FileHelper.WriteFile(path, $"{fileName}.txt", $"[{DateTime.Now:HH:mm:ss}] {message}", true);
            }
            catch (Exception ex)
            {
                Console.WriteLine($"Quartz日志写入异常:{message},{ex.Message}");
            }
        }
    }
}

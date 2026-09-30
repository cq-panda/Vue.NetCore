using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Filters;
using Microsoft.Extensions.Primitives;
using System;
using System.Security.Cryptography;
using System.Text;
using VOL.Core.Configuration;
using VOL.Core.Extensions;

namespace VOL.Core.Quartz
{
    /// <summary>
    /// 定时任务内部调用鉴权（配合 [ApiTask]）
    /// </summary>
    public static class QuartzAuthorization
    {
        public const string Key = "QuartzAccessKey";

        private static string _accessKey;
        private static readonly object _lock = new object();

        public static string AccessKey
        {
            get
            {
                if (!string.IsNullOrEmpty(_accessKey))
                    return _accessKey;

                lock (_lock)
                {
                    if (!string.IsNullOrEmpty(_accessKey))
                        return _accessKey;
                    _accessKey = BuildAccessKey();
                    return _accessKey;
                }
            }
        }

        public static string GetAccessKey() => AccessKey;

        private static string BuildAccessKey()
        {
            string raw = AppSetting.GetSettingString(Key);
            if (string.IsNullOrEmpty(raw))
            {
                raw = Guid.NewGuid().ToString("N");
            }

            using var md5 = MD5.Create();
            byte[] hash = md5.ComputeHash(Encoding.UTF8.GetBytes(AppSetting.Secret.User ?? string.Empty));
            var sb = new StringBuilder(raw);
            foreach (byte b in hash)
            {
                sb.Append(b.ToString("X2"));
            }
            return sb.ToString();
        }

        public static AuthorizationFilterContext Validation(AuthorizationFilterContext context)
        {
            bool hasKey = context.HttpContext.Request.Headers.TryGetValue(Key, out StringValues value);
            if (!hasKey || !string.Equals(AccessKey, value.ToString(), StringComparison.Ordinal))
            {
                context.Result = new ContentResult
                {
                    Content = new { message = "key不匹配", status = false, code = 401 }.Serialize(),
                    ContentType = "application/json",
                    StatusCode = 401
                };
            }
            return context;
        }
    }
}

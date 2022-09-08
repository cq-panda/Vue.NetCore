using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Filters;
using Microsoft.Extensions.Primitives;
using System;
using System.Collections.Generic;
using System.Security.Cryptography;
using System.Text;
using VOL.Core.Configuration;
using VOL.Core.Extensions;

namespace VOL.Core.Quartz
{
    public static class QuartzAuthorization
    {

        private static string _quartzAccessKey;

        public static string Key = "QuartzAccessKey";
        public static string AccessKey
        {
            get
            {
                if (string.IsNullOrEmpty(_quartzAccessKey))
                {
                    _quartzAccessKey = GetAccessKey();
                }
                return _quartzAccessKey;
            }
        }
        public static string GetAccessKey()
        {
            if (string.IsNullOrEmpty(_quartzAccessKey))
            {
                _quartzAccessKey = AppSetting.GetSettingString(Key);
            }
            if (string.IsNullOrEmpty(_quartzAccessKey))
            {
                _quartzAccessKey = Guid.NewGuid().ToString();
            }
            using (MD5 md5 = MD5.Create())
            {
                string md5str = _quartzAccessKey;
                byte[] s = md5.ComputeHash(Encoding.UTF8.GetBytes(AppSetting.Secret.User));
                for (int i = 0; i < s.Length; i++)
                {
                    string btos = s[i].ToString("X2");
                    md5str += btos;
                }
                return md5str;
            }
        }

        public static AuthorizationFilterContext Validation(AuthorizationFilterContext context)
        {
            bool result = context.HttpContext.Request.Headers.TryGetValue(Key, out StringValues value);
            if (!result || AccessKey != value)
            {
                context.Result = new ContentResult()
                {
                    Content = new { message = "key不匹配", status = false, code = 401 }.Serialize(),
                    ContentType = "application/json",
                    StatusCode = 401
                };
                return context;
            }
            return context;
        }
    }
}

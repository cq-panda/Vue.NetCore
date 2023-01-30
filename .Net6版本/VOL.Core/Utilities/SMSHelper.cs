using Microsoft.Extensions.Configuration;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Net;
using System.Text;
using System.Text.Json.Serialization;
using System.Threading.Tasks;
using VOL.Core.Configuration;

namespace VOL.Core.Utilities
{
    public static class SMSHelper
    {
        private static string account { get; set; }
        private static string password { get; set; }
        private static string url { get; set; }
        static SMSHelper()
        {
            IConfigurationSection section = AppSetting.GetSection("SMS");
            account = section["Account"];
            password = section["Password"];
            url = section["Url"];
        }

        /// <summary>
        /// 发送短信
        /// </summary>
        /// <param name="phone">手机号</param>
        /// <param name="msg">消息</param>
        /// <returns></returns>
        public static SMSResponse Send(string phone, string msg)
        {
            var postJsonTpl = "\"account\":\"{0}\",\"password\":\"{1}\",\"phone\":\"{2}\",\"report\":\"true\",\"msg\":\"{3}\"";
            var jsonBody = string.Format(postJsonTpl, account, password, phone, msg);

            Console.WriteLine(jsonBody);
            var result = DoPostMethodToObj(url, "{" + jsonBody + "}");
            return result;
        }

        /// <summary>
        /// 发送短信
        /// </summary>
        /// <param name="account">API账号(请求地址请登录www.chuanglan.com获取)</param>
        /// <param name="password">API密码(请求地址请登录www.chuanglan.com获取)</param>
        /// <param name="phone">手机号</param>
        /// <param name="msg">消息</param>
        /// <returns></returns>
        public static SMSResponse Send(string account, string password, string phone, string msg)
        {
            var postJsonTpl = "\"account\":\"{0}\",\"password\":\"{1}\",\"phone\":\"{2}\",\"report\":\"true\",\"msg\":\"{3}\"";
            var jsonBody = string.Format(postJsonTpl, account, password, phone, msg);
            var result = DoPostMethodToObj(url, "{" + jsonBody + "}");
            return result;
        }

        /// <summary>
        /// 发送短信
        /// </summary>
        /// <param name="url">API地址</param>
        /// <param name="jsonBody">请求内容</param>
        /// <returns></returns>
        private static SMSResponse DoPostMethodToObj(string url, string jsonBody)
        {
            SMSResponse result = null;
            var json = string.Empty;
            try
            {
                HttpWebRequest httpWebRequest = (HttpWebRequest)WebRequest.Create(url);
                httpWebRequest.ContentType = "application/json";
                httpWebRequest.Method = "POST";
                var admin_auth = new NetworkCredential("username", "password");
                httpWebRequest.Credentials = admin_auth;
                ServicePointManager.ServerCertificateValidationCallback = delegate { return true; };
                using (StreamWriter streamWriter = new StreamWriter(httpWebRequest.GetRequestStream()))
                {
                    streamWriter.Write(jsonBody);
                    streamWriter.Flush();
                    streamWriter.Close();
                    var httpResponse = (HttpWebResponse)httpWebRequest.GetResponse();
                    using (var streamReader = new StreamReader(httpResponse.GetResponseStream()))
                    {
                        json = streamReader.ReadToEnd();
                        Console.WriteLine(json);
                    }
                }

                if (!string.IsNullOrEmpty(json))
                {
                    result = JsonConvert.DeserializeObject<SMSResponse>(json);
                    Console.WriteLine(json);
                }
            }
            catch (Exception ex)
            {
            }
            return result;
        }
    }

    public class SMSResponse
    {
        /// <summary>
        /// 提交响应状态码，返回“0”表示提交成功（详细参考提交响应状态码）
        /// </summary>
        [JsonPropertyName("code")]
        public string Code { get; set; }

        /// <summary>
        /// 消息id（32位纯数字）
        /// </summary>
        [JsonPropertyName("msgId")]
        public string MsgId { get; set; }

        /// <summary>
        /// 响应时间
        /// </summary>
        [JsonPropertyName("time")]
        public string Time { get; set; }
        /// <summary>
        /// 状态码说明（提交成功返回空）
        /// </summary>
        [JsonPropertyName("errorMsg")] 
        public string ErrorMsg { get; set; }
    }
}

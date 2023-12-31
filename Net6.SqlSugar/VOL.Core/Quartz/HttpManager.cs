using Microsoft.AspNetCore.Http;
using System;
using System.Collections.Generic;
using System.IO;
using System.Net;
using System.Net.Http;
using System.Net.Http.Headers;
using System.Text;
using System.Threading.Tasks;
using VOL.Core.Extensions;

namespace VOL.Core.Quartz
{
    public static class HttpManager
    {

        public static async Task<string> SendAsync(this IHttpClientFactory httpClientFactory,
            HttpMethod method,
            string url,
            string postData = null,
            int timeOut = 180,
            Dictionary<string, string> headers = null)
        {
            var client = httpClientFactory.CreateClient();
            //var content = new StringContent(postData ?? "");
            //var request = new HttpRequestMessage(method, url)
            //{
            //    Content = content
            //};

            HttpContent httpContent = new StringContent(new { a = 1, b = 2 }.Serialize(), Encoding.UTF8, "application/json");

            headers ??= new Dictionary<string, string>();
            headers.TryAdd(QuartzAuthorization.Key, QuartzAuthorization.AccessKey);
            if (headers != null)
            {
                foreach (var header in headers)
                {
                    client.DefaultRequestHeaders.Add(header.Key, header.Value);
                    //request.Headers.Add(header.Key, header.Value);
                }
            }
            try
            {
                client.Timeout = TimeSpan.FromSeconds(timeOut);
                HttpResponseMessage response = null;
                if (method == HttpMethod.Post)
                {
                    response = await client.PostAsync(url, httpContent);
                }
                else
                {
                    response = await client.GetAsync(url);
                }
                string result;
                if (response.StatusCode == HttpStatusCode.OK)
                {
                    result = await response.Content.ReadAsStringAsync();
                }
                else
                {
                    result = response.Serialize();
                }
                Console.WriteLine("返回：" + result);
                return result;
            }
            catch (Exception ex)
            {
                Console.WriteLine(ex.Message);
                QuartzFileHelper.Error($"http请求异常，url:{url},{ex.Message + ex.StackTrace}");
                return ex.Message;
            }
        }
    }
}

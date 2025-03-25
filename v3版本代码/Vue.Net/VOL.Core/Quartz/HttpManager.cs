using Microsoft.AspNetCore.Http;
using System;
using System.Collections.Generic;
using System.IO;
using System.Net;
using System.Net.Http;
using System.Net.Http.Headers;
using System.Text;
using System.Threading.Tasks;

namespace VOL.Core.Quartz
{
    public static class HttpManager
    {

        public static async Task<string> SendAsync(this IHttpClientFactory httpClientFactory, 
            HttpMethod method,
            string url,
            string postData=null, 
            int timeOut=180,
            Dictionary<string, string> headers = null)
        {
            var client = httpClientFactory.CreateClient();
            var content = new StringContent(postData??"");
            var request = new HttpRequestMessage(method, url)
            {
                Content = content
            };
            headers ??= new Dictionary<string, string>();
            headers.TryAdd(QuartzAuthorization.Key, QuartzAuthorization.AccessKey);
            if (headers != null)
            {
                foreach (var header in headers)
                {
                    request.Headers.Add(header.Key, header.Value);
                }
            }
            try
            {
                client.Timeout = TimeSpan.FromSeconds(timeOut);
                HttpResponseMessage httpResponseMessage = await client.SendAsync(request);
                var result = await httpResponseMessage.Content
                    .ReadAsStringAsync();
                return result;
            }
            catch (Exception ex)
            {
                Console.WriteLine(ex.Message);
                QuartzFileHelper.Error($"http请求异常，url:{url},{ex.Message+ex.StackTrace}");
                return ex.Message;
            }
        }
    }
}

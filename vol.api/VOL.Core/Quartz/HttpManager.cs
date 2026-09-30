using System;
using System.Collections.Generic;
using System.Net.Http;
using System.Text;
using System.Threading;
using System.Threading.Tasks;
using VOL.Core.Extensions;

namespace VOL.Core.Quartz
{
    /// <summary>
    /// 定时任务 HTTP 请求封装
    /// </summary>
    public static class HttpManager
    {
        public static async Task<string> SendAsync(
            this IHttpClientFactory httpClientFactory,
            HttpMethod method,
            string url,
            string postData = null,
            int timeOut = 180,
            Dictionary<string, string> headers = null)
        {
            if (string.IsNullOrWhiteSpace(url))
                return "url不能为空";

            using var request = new HttpRequestMessage(method, url);
            request.Headers.TryAddWithoutValidation(QuartzAuthorization.Key, QuartzAuthorization.AccessKey);

            if (headers != null)
            {
                foreach (var header in headers)
                {
                    if (string.IsNullOrWhiteSpace(header.Key))
                        continue;
                    request.Headers.TryAddWithoutValidation(header.Key.Trim(), header.Value?.Trim() ?? string.Empty);
                }
            }

            if (method == HttpMethod.Post)
            {
                request.Content = new StringContent(postData ?? string.Empty, Encoding.UTF8, "application/json");
            }

            var client = httpClientFactory.CreateClient();
            using var cts = new CancellationTokenSource(TimeSpan.FromSeconds(timeOut <= 0 ? 180 : timeOut));

            try
            {
                using HttpResponseMessage response = await client.SendAsync(request, cts.Token).ConfigureAwait(false);
                string body = await response.Content.ReadAsStringAsync().ConfigureAwait(false);
                if (response.IsSuccessStatusCode)
                {
                    return body;
                }

                return $"HTTP {(int)response.StatusCode} {response.ReasonPhrase}; body={body}";
            }
            catch (OperationCanceledException)
            {
                string msg = $"http请求超时，url:{url}, timeout:{timeOut}s";
                QuartzFileHelper.Error(msg);
                return msg;
            }
            catch (Exception ex)
            {
                QuartzFileHelper.Error($"http请求异常，url:{url},{ex.Message}");
                return ex.Message;
            }
        }
    }
}

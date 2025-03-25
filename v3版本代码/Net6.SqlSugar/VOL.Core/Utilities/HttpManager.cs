using System;
using System.Collections.Generic;
using System.IO;
using System.Net;
using System.Text;
using System.Threading.Tasks;

namespace VOL.Core.Utilities
{
    public class HttpManager
    {
        //public static Task<string> HttpPostAsync(string url, string postData = null, string contentType = null, int timeOut = 30, Dictionary<string, string> headers = null)
        //{
        //    HttpWebRequest request = (HttpWebRequest)WebRequest.Create(url);
        //    request.Method = "POST";
        //    if (!string.IsNullOrEmpty(contentType))
        //    {
        //        request.ContentType = contentType;
        //    }
        //    if (headers != null)
        //    {
        //        foreach (var header in headers)
        //            request.Headers[header.Key] = header.Value;
        //    }

        //    try
        //    {
        //        byte[] bytes = Encoding.UTF8.GetBytes(postData ?? "");
        //        using (Stream sendStream = request.GetRequestStream())
        //        {
        //            sendStream.Write(bytes, 0, bytes.Length);
        //        }

        //        using (HttpWebResponse response = (HttpWebResponse)request.GetResponse())
        //        {
        //            Stream responseStream = response.GetResponseStream();
        //            StreamReader streamReader = new StreamReader(responseStream, Encoding.UTF8);
        //            return streamReader.ReadToEndAsync();
        //        }
        //    }
        //    catch (Exception ex)
        //    {
        //        return Task.FromResult(ex.Message);
        //    }

        //}
        //public static  Task<string> HttpGetAsync(string url, Dictionary<string, string> headers = null)
        //{
        //    try
        //    {
        //        HttpWebRequest request = (HttpWebRequest)WebRequest.Create(url);
        //        if (headers != null)
        //        {
        //            foreach (var header in headers)
        //                request.Headers[header.Key] = header.Value;
        //        }
        //        using (HttpWebResponse response = (HttpWebResponse)request.GetResponse())
        //        {
        //            Stream responseStream = response.GetResponseStream();
        //            StreamReader streamReader = new StreamReader(responseStream, Encoding.UTF8);
        //            return streamReader.ReadToEndAsync();
        //        }
        //    }
        //    catch (Exception ex)
        //    {
        //        return Task.FromResult(ex.Message);
        //    }
        //}
    }
}

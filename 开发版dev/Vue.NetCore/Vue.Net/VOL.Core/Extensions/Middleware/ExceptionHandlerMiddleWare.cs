//using VOL.Core.Enums;
//using VOL.Entity.DomainModels.ResponseEntity;
//using VOL.Entity.SystemsModels;
//using Microsoft.AspNetCore.Http;
//using Newtonsoft.Json;
//using System;
//using System.IO;
//using System.Net;
//using System.Text;
//using System.Threading.Tasks;
//using System.Xml.Serialization;

//namespace VOL.Core.Extensions.Middleware
//{
//    public class ExceptionHandlerMiddleWare
//    {
//        private readonly RequestDelegate next;

//        public ExceptionHandlerMiddleWare(RequestDelegate next)
//        {
//            this.next = next;
//        }

//        public async Task Invoke(HttpContext context)
//        {
//            try
//            {
//                await next(context);
//            }
//            catch (Exception ex)
//            {
//                await HandleExceptionAsync(context, ex);
//            }
//        }

//        private static async Task HandleExceptionAsync(HttpContext context, Exception exception)
//        {
//            if (exception == null) return;
//            await WriteExceptionAsync(context, exception).ConfigureAwait(false);
//        }

//        private static async Task WriteExceptionAsync(HttpContext context, Exception exception)
//        {

//            Logger.WriteLog(LogEnum.Exception, null, exception.Message + exception.StackTrace, null);

//            var response = context.Response;

//            if (exception is UnauthorizedAccessException)
//                response.StatusCode = (int)HttpStatusCode.Unauthorized;
//            else if (exception is Exception)
//                //  response.StatusCode = (int)HttpStatusCode.BadRequest;
//                response.StatusCode = (int)HttpStatusCode.InternalServerError;
//            response.ContentType = context.Request.Headers["Accept"];

//            //if (response.ContentType.ToLower() == "application/xml")
//            response.ContentType = "application/json";
//            ResponseData responseData = new ResponseData();
//            responseData.SetResponseValue(ResponseType.ServerError);
//            string reslutMsg = JsonConvert.SerializeObject(responseData);

//            await response.WriteAsync(reslutMsg, Encoding.UTF8).ConfigureAwait(false);
//        }

//        /// <summary>
//        /// 对象转为Xml
//        /// </summary>
//        /// <param name="o"></param>
//        /// <returns></returns>
//        private static string Object2XmlString(object o)
//        {
//            StringWriter sw = new StringWriter();
//            try
//            {
//                XmlSerializer serializer = new XmlSerializer(o.GetType());
//                serializer.Serialize(sw, o);
//            }
//            catch
//            {
//                //Handle Exception Code
//            }
//            finally
//            {
//                sw.Dispose();
//            }
//            return sw.ToString();
//        }

//    }
//}

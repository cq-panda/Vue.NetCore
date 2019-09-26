
//using VOL.Core.Enums;
//using VOL.Core.Utilities;
//using VOL.Entity.DomainModels;
//using Microsoft.AspNetCore.Mvc;
//using Microsoft.AspNetCore.Mvc.Filters;
//using Newtonsoft.Json;
//using System;
//using System.Collections.Generic;
//using System.Net;
//using System.Text;

//namespace VOL.Core.Utilities
//{
//    public static class SystemResponse
//    {
//        public static void GetContentResult(FilterContext context, IActionResult actionResult)
//        {
//            GetContentResult(context, actionResult, null);
//        }

//        public static void SetActionResult(ActionExecutingContext context, ResponseData responseData)
//        {
//            //if (context.HttpContext.IsAjaxRequest())
//            //{
//            context.Result = new ContentResult()
//            {
//                Content = Encoding.UTF8.GetString(Encoding.UTF8.GetBytes(responseData.Desc)),
//                ContentType = "application/json",
//                StatusCode =(int)HttpStatusCode.Unauthorized
//            };
//            return;
//            //    }
//        }

//        public static void GetContentResult(FilterContext context, IActionResult actionResult, ResponseData responseData)
//        {
//            responseData = responseData ?? new ResponseData();
//            responseData.SetResponse(ResponseType.ServerError);

//            if (context.HttpContext.IsAjaxRequest())
//            {
//                actionResult = new ContentResult()
//                {
//                    Content = JsonConvert.SerializeObject(responseData),
//                    ContentType = "application/json",
//                    StatusCode = (int)HttpStatusCode.InternalServerError
//                };
//            }
//            else
//            {
//                string desc = Encoding.UTF8.GetString(Encoding.UTF8.GetBytes(responseData.Desc));
//                actionResult = new ContentResult()
//                {
//                    Content = $@"<html><head><title></title></head><body>{desc}</body></html>",
//                    ContentType = "text/html",
//                    StatusCode = (int)HttpStatusCode.InternalServerError
//                };
//            }
//            //writelog
//        }
//    }
//}

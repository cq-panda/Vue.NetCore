using VOL.Core.Enums;
using VOL.Core.Extensions;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Filters;
using Newtonsoft.Json;
using System.Net;
using System.Text;
using VOL.Core.Const;

namespace VOL.Core.Utilities
{
    public static class FilterResponse
    {
        public static void GetContentResult(FilterContext context, IActionResult actionResult)
        {
            GetContentResult(context, actionResult, null);
        }

        public static void SetActionResult(ActionExecutingContext context, WebResponseContent responseData)
        {
            context.Result = new ContentResult()
            {
                Content = new { status = false, message = responseData.Message }.Serialize(),
                ContentType = ApplicationContentType.JSON,
                StatusCode = (int)HttpStatusCode.Unauthorized
            };
        }

        public static void GetContentResult(FilterContext context, IActionResult actionResult, WebResponseContent responseData)
        {
            responseData = responseData ?? new WebResponseContent();
            responseData.Set(ResponseType.ServerError);

            if (context.HttpContext.IsAjaxRequest())
            {
                actionResult = new ContentResult()
                {
                    Content = JsonConvert.SerializeObject(responseData),
                    ContentType = ApplicationContentType.JSON,
                    StatusCode = (int)HttpStatusCode.InternalServerError
                };
            }
            else
            {
                string desc = Encoding.UTF8.GetString(Encoding.UTF8.GetBytes(responseData.Message));
                actionResult = new ContentResult()
                {
                    Content = $@"<html><head><title></title></head><body>{desc}</body></html>",
                    ContentType = "text/html",
                    StatusCode = (int)HttpStatusCode.InternalServerError
                };
            }
            //writelog
        }
    }
}

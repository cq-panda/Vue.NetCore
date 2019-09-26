using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Rewrite;
using Microsoft.Net.Http.Headers;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace VOL.Core.Utilities.Http
{
    /// <summary>
    /// url重写
    ///  var rewrite = new RewriteOptions()
    //    .Add(new RedirectRule(
    //    matchPaths: new string[] { "/Home/About" },
    //    newPath: "/Home/Error"));
    //app.UseRewriter(rewrite);
    /// </summary>
    public class RedirectRule : IRule
    {

        private readonly string[] _matchPaths;

        private readonly string _newPath;



        public RedirectRule(string[] matchPaths, string newPath)
        {
            _matchPaths = matchPaths;
            _newPath = newPath;
        }
        public void ApplyRule(RewriteContext context)
        {
            var request = context.HttpContext.Request;
            if (request.Path.StartsWithSegments(new PathString(_newPath)))
            {
                return;
            }

            if (_matchPaths.Contains(request.Path.Value))
            {
                var newLocation = $"{_newPath}{request.QueryString}";
                var response = context.HttpContext.Response;
                response.StatusCode = StatusCodes.Status302Found;

                context.Result = RuleResult.EndResponse;
                if (request.Method.ToLower() == "post")
                {

                    foreach (var item in context.HttpContext.Request.Form)
                    {
                        newLocation += item.Key + "?=" + item.Value;
                    }
                    //response.HttpContext.Request.Form = context.HttpContext.Request.Form;

                    //response.HttpContext.Request.Method = "POST";
                }
                response.Headers[HeaderNames.Location] = newLocation;

            }
        }
    }
}

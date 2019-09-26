using VOL.System.IRepositories;
using VOL.Core.Const;
using VOL.Core.Enums;
using VOL.Core.Extensions;
using VOL.Core.Filters;
using VOL.Core.ManageUser;
using VOL.Core.Services;
using VOL.Core.Utilities;
using VOL.Entity.DomainModels;
using DotNet.Utilities;
using Microsoft.AspNetCore.Authentication;
using Microsoft.AspNetCore.Authentication.Cookies;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Options;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Security.Claims;
using System.Text;
using System.Threading.Tasks;
using VOL.Core.Configuration;

namespace VOL.System.Controllers
{
    public class UEditorController : Controller
    {
        private ISys_UserRepository repository { get; set; }
        public UEditorController(ISys_UserRepository repository)
        {
            this.repository = repository;
        }
        [ActionPermission("", ActionPermissionOptions.Update | ActionPermissionOptions.Add)]
        public IActionResult CreateStaticFile(string tableName, string key)
        {

            Dictionary<string, object> htmlDic = JsonConvert.DeserializeObject<Dictionary<string, object>>(HttpContext.Request("htmlDic"));
            if (htmlDic == null)
            {
                return base.Json(new WebResponseContent()
                {
                    Message = "请提交参数"
                });
            }
            if (string.IsNullOrEmpty((htmlDic["Content"] ?? "").ToString()))
            {
                return base.Json(new WebResponseContent()
                {
                    Message = "请编辑文本内容!"
                });
            }
            if (string.IsNullOrEmpty(key))
            {
                return base.Json(new WebResponseContent()
                {
                    Message = "请先保存后再后生成app页面!"
                });
            }

            string path = htmlDic.ContainsKey("DetailUrl") ? (htmlDic["DetailUrl"] ?? "").ToString() : "";
            string headUrl = repository.Find(x => x.User_Id == UserContext.Current.UserInfo.User_Id, s => s.HeadImageUrl)?.FirstOrDefault();
            string template = FileHelper.ReadFile("Template\\AppHtml\\news.html");
            string content = htmlDic["Content"].ToString();
            //if (content.Contains("<video")&& content.Contains(".mp4"))
            //{
            //    template = template.Replace("{#video}", "<link href=\"/Content/css/video-js.min.css\" rel=\"stylesheet\"/><script src=\"/Scripts/video.min.js\"></script>");
            //}
            
            template = template.Replace("{#title}", htmlDic["Title"].ToString())
                .Replace("{#editor}", UserContext.Current.UserInfo.UserTrueName)
                .Replace("{#editDate}", DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss"))
                .Replace("{#Content}", content).Replace("{#headSrc}"
                , string.IsNullOrEmpty(headUrl) ? ConfigOptions.DefaultHeadImageUrl : headUrl);
            //生成文件名及指定路径 
            if (string.IsNullOrEmpty(tableName))
            {
                tableName = "archive";
            }

            string mapPath = "".MapPath();
            string dicPath = "";
            path = path?.ToLower();

            string token = "";
          
            if (string.IsNullOrEmpty(path) || !path.StartsWith($"/{ConfigOptions.AppStaticFolder}", StringComparison.OrdinalIgnoreCase) || path[$"/{ConfigOptions.AppStaticFolder}".Length] != '/')
            {
                dicPath = $@"\App\{tableName}\{DateTime.Now.ToString("yyyyMMdd")}\{DateTime.Now.ToString("HHmmss")}.html";
                path = $@"{mapPath }{dicPath}".ToLower();
                token = "?token=" + ($"{tableName},{key}".EncryptDES(AppSetting.Secret.JWT).Replace("=", "-"));
            }
            else
            {
                path = path.Replace("/", @"\");
                string sub = path.Substring(8);
                dicPath = sub.Substring(sub.IndexOf(@"\"));
                path = $@"{mapPath }{dicPath}".ToLower();
            }

            //待完善，生成路径到虚拟目录上，指定到具体磁盘文件夹位置,见ConfigOptions参数
            path = path.Replace("\\app\\", @"\static\");
            string fullPath = path.Substring(0, path.LastIndexOf(@"\"));
            string fileName = path.Substring(path.LastIndexOf(@"\") + 1);

            string dtFormat = DateTime.Now.ToString("HHmmss");
            FileHelper.WriteFile(fullPath + "\\", fileName, template);
            string httpPath = ConfigOptions.HostName.Trim('/') + dicPath;
            httpPath = httpPath.Replace(@"\", "/") + token;
            httpPath =$"{httpPath.Split("&rand_t=")[0]}&rand_t={dtFormat}" ;
            return base.Json(new WebResponseContent()
            {
                Status = true,
                Message = httpPath
            });
        }

        [ActionPermission("", ActionPermissionOptions.Update | ActionPermissionOptions.Add)]
        public IActionResult GetConfig()
        {
            string jsonpCallback = HttpContext.Request("callback");
            if (String.IsNullOrWhiteSpace(jsonpCallback))
            {
                return Json(UEConfig.Items);
            }
            return new ContentResult()
            {
                Content = $"{jsonpCallback}({JsonConvert.SerializeObject(UEConfig.Items)})",
                ContentType = "application/javascript",
                StatusCode = (int)HttpStatusCode.OK
            };

        }

    }
}

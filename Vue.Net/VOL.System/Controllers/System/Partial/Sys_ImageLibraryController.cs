using VOL.System.Repositories;
using VOL.Core.Enums;
using VOL.Core.Extensions;
using VOL.Core.Filters;
using VOL.Core.Utilities;
using VOL.Entity.DomainModels;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace VOL.System.Controllers
{
    public partial class Sys_ImageLibraryController
    {
        public IActionResult AddImage(string imageUrls, string table)
        {
            Service.AddImage(imageUrls, table);
            return Content("");
        }
        [ActionPermission("Sys_ImageLibrary", ActionPermissionOptions.Search)]
        public IActionResult GetImage(int page)
        {
            return Content(Service.GetImage(page));
        }
        [ActionPermission("Sys_ImageLibrary", ActionPermissionOptions.Search)]
        public IActionResult GetVideo(int page)
        {
            return Content(Service.GetVideo(page));
        }
        [ActionPermission("Sys_ImageLibrary", ActionPermissionOptions.Search)]
        public IActionResult GetFile(string url)
        {
            return Json(new
            {
                Status = true,
                Desc = Sys_ImageLibraryRepository.Instance.Find(x => x.ImageUrls == url && x.FileType == 1, s => s.Id).FirstOrDefault()
            });
        }
        [ActionPermission("Sys_ImageLibrary", ActionPermissionOptions.Update)]
        public IActionResult Update(List<Sys_ImageLibrary> coverInfo)
        {
            coverInfo =  HttpContext.Request("coverInfo").DeserializeObject<List<Sys_ImageLibrary>>();
            Sys_ImageLibraryRepository.Instance.UpdateRange(coverInfo,x=>x.Cover,true);
            return Json(new { Status=true });
        }

        [AllowAnonymous()]
        public IActionResult Video(int? id)
        {
            ViewData["videoData"] = id == null ? new KeyValuePair<string, string>() : Service.GetVideoIframe((int)id);
            return View("~/Views/System/PageExtension/Sys_FileLibraryExtension.cshtml");
        }
    }
}


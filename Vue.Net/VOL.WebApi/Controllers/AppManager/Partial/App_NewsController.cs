/*
 *接口编写处...
*如果接口需要做Action的权限验证，请在Action上使用属性
*如: [ApiActionPermission("App_News",Enums.ActionPermissionOptions.Search)]
 */
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.DependencyInjection;
using System.Linq;
using System.Threading.Tasks;
using VOL.AppManager.IRepositories;
using VOL.AppManager.IServices;
using VOL.Core.Enums;
using VOL.Core.Extensions;
using VOL.Core.Filters;
using VOL.Core.Infrastructure;
using VOL.Entity.DomainModels;

namespace VOL.AppManager.Controllers
{
    [Route("api/news")]
    public partial class App_NewsController
    {
        private IApp_NewsRepository _newsRepository { get; set; }
        private IApp_NewsService service { get; set; }
        [ActivatorUtilitiesConstructor]
        public App_NewsController(IApp_NewsRepository newsRepository, IApp_NewsService service)
            : base(service)
        {
            _newsRepository = newsRepository;
        }

        /// <summary>
        /// 生成静态页面
        /// </summary>
        /// <param name="news"></param>
        /// <returns></returns>
        [HttpPost, Route("createPage")]
        [ApiActionPermission("App_News", ActionPermissionOptions.Add)]
        public async Task<IActionResult> CreatePage([FromBody] App_News news)
        {
            return Json(await Service.CreatePage(news));
        }
        /// <summary>
        /// 设置封面图片
        /// </summary>
        /// <param name="news"></param>
        /// <returns></returns>
        [ApiActionPermission("App_News", ActionPermissionOptions.Add)]
        [HttpPost, Route("setCover")]

        public IActionResult SetCover([FromBody] App_News news, string t1, string t2)
        {
            return Json(Service.SetCover(news));
        }
        /// <summary>
        /// 设置封面图片
        /// </summary>
        /// <param name="news"></param>
        /// <returns></returns>
        [ApiActionPermission("App_News", ActionPermissionOptions.Search)]
        [HttpPost, Route("getDemoPageList")]
        public async Task<IActionResult> GetDemoPageList()
        {
            return Json(await Service.GetDemoPageList());
        }


        [HttpGet, Route("getNav"), AllowAnonymous]
        public IActionResult GetNav()
        {
            var data = DictionaryManager.GetDictionary("news")
                 ?.Sys_DictionaryList
                 ?.Select(c => new { id = c.DicValue, name = c.DicName })
                 ?.ToList();
            if (data == null)
            {
                return Json(new object[] { });
            }
            return Json(data);
        }
        /// <summary>
        /// 获取uniapp列表数据
        /// </summary>
        /// <param name="newsType"></param>
        /// <returns></returns>
        [HttpGet, Route("getList"), AllowAnonymous]
        public async Task<IActionResult> GetList(int newsType, int page = 1)
        {
            var data = await _newsRepository.FindAsIQueryable(c => c.NewsType == newsType)
                .OrderByDescending(c => c.CreateDate)
                .TakePage(page)
                 .Select(s => new
                 {
                     s.Id,
                     s.ImageUrl,
                     s.Title,
                     s.CreateDate,
                     s.Creator
                 })
                 .ToListAsync();
            return Json(data);
        }

        /// <summary>
        /// 获取uniapp首页数据
        /// </summary>
        /// <param name="newsType"></param>
        /// <returns></returns>
        [HttpGet, Route("getHomeList"), AllowAnonymous]
        public async Task<IActionResult> GetHomeList()
        {
            var data = await _newsRepository.FindAsIQueryable(c => true)
                .OrderByDescending(c => c.CreateDate)
                .Take(10)
                 .Select(s => new
                 {
                     s.Id,
                     s.ImageUrl,
                     s.Title,
                     s.CreateDate,
                     s.Creator
                 })
                 .ToListAsync();
            return Json(data);
        }

        /// <summary>
        /// 获取uniapp详细数据
        /// </summary>
        /// <param name="newsType"></param>
        /// <returns></returns>
        [HttpGet, Route("getDetail"), AllowAnonymous]
        public async Task<IActionResult> GetDetail(int id)
        {
            var data = await _newsRepository.FindAsIQueryable(c => c.Id == id)
                 .Select(s => new
                 {
                     s.Id,
                     s.Title,
                     s.Content,
                     s.CreateDate,
                     s.Creator
                 })
                 .FirstOrDefaultAsync();
            return Json(data);
        }
    }
}

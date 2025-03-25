/*
 *所有关于App_News类的业务代码应在此处编写
*可使用repository.调用常用方法，获取EF/Dapper等信息
*如果需要事务请使用repository.DbContextBeginTransaction
*也可使用DBServerProvider.手动获取数据库相关信息
*用户信息、权限、角色等使用UserContext.Current操作
*App_NewsService对增、删、改查、导入、导出、审核业务代码扩展参照ServiceFunFilter
*/
using System;
using System.Threading.Tasks;
using VOL.Core.Extensions;
using VOL.Core.ManageUser;
using VOL.Core.Utilities;
using VOL.Entity.DomainModels;

namespace VOL.AppManager.Services
{
    public partial class App_NewsService
    {
        public async Task<WebResponseContent> GetDemoPageList()
        {
            var data = await repository.FindAsync(x => 1 == 1, s => new { s.CreateDate, s.Creator, s.NewsType, s.Title, s.DetailUrl, s.ImageUrl});
            return WebResponseContent.Instance.OK(null, data);
        }
        public WebResponseContent SetCover(App_News news)
        {
            int count = repository.Update(news, x => new { news.ImageUrl }, true);
            if (count == 0)
                return WebResponseContent.Instance.Error("未更新到数据");
            return WebResponseContent.Instance.OK("封面设置成功");
        }
        public async Task<WebResponseContent> CreatePage(App_News news)
        {
            WebResponseContent webResponseContent = WebResponseContent.Instance;
            if (news == null)
            {
                return webResponseContent.Error("未获取到数据");
            }
            if (!await repository.ExistsAsync(x => x.Id == news.Id))
            {
                return webResponseContent.Error("请求的数据已发生变化,请刷新页面重新提交");
            }
            string template = FileHelper.ReadFile(@"Template\\AppHtml\\news.html");
            if (string.IsNullOrEmpty(template))
            {
                return webResponseContent.Error("未获取到页面的模板,请确认模板是否存在");
            }
            string filePath;
            string fileName;
            string urlPath;
            if (!string.IsNullOrEmpty(news.DetailUrl) && news.DetailUrl.IndexOf("/") != -1 && news.DetailUrl.Split(".").Length == 2)
            {
                var file = news.DetailUrl.Split("/");
                fileName = file[file.Length - 1];
                filePath = news.DetailUrl.Replace(fileName, "");
                urlPath = filePath;
            }
            else
            {
                string day = DateTime.Now.ToString("yyyyMMdd");
                fileName = DateTime.Now.ToString("HHmmsss") + new Random().Next(1000, 9999) + ".html";
                urlPath = $"static/news/{day}/";
                filePath = urlPath.MapPath(true);
            }
            string content = template.Replace("{title}", news.Title).Replace("{date}", DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss")).Replace("{content}", news.Content);
            FileHelper.WriteFile((filePath.IndexOf("wwwroot") == -1 ? "wwwroot/" : "") + filePath, fileName, content);
            //更新数据库的url
            news.DetailUrl = $"{urlPath}{fileName}";
            repository.Update(news, x => new { news.DetailUrl, news.Content }, true);
            return webResponseContent.OK("面发布成功,可预览看效果", new { url = news.DetailUrl });
        }
    }
}

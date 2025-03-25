/*
*所有关于App_News类的业务代码接口应在此处编写
*/
using System.Threading.Tasks;
using VOL.Core.Utilities;
using VOL.Entity.DomainModels;

namespace VOL.AppManager.IServices
{
    public partial interface IApp_NewsService
    {
        Task<WebResponseContent> GetDemoPageList();
        /// <summary>
        /// 生成html页面
        /// </summary>
        /// <param name="news"></param>
        /// <returns></returns>
        Task<WebResponseContent> CreatePage(App_News news);
        /// <summary>
        /// 设置封面
        /// </summary>
        /// <param name="news"></param>
        /// <returns></returns>
        WebResponseContent SetCover(App_News news);
    }
}

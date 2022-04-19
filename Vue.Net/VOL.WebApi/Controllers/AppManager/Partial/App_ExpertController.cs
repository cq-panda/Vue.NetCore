/*
 *接口编写处...
*如果接口需要做Action的权限验证，请在Action上使用属性
*如: [ApiActionPermission("App_Expert",Enums.ActionPermissionOptions.Search)]
 */
using Microsoft.AspNetCore.Mvc;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using VOL.AppManager.Repositories;
using VOL.Core.Extensions;
using VOL.Entity.DomainModels;

namespace VOL.AppManager.Controllers
{
    public partial class App_ExpertController
    {
        //后台App_ExpertController中添加代码，返回table数据
        [HttpPost, Route("getSelectorDemo")]
        public IActionResult GetSelectorDemo([FromBody] PageDataOptions options)
        {
            //1.可以直接调用框架的GetPageData查询
            // PageGridData<App_Expert> data = App_ExpertService.Instance.GetPageData(options);
            //return Json(data);

            //2.下面这里演示手动解析查询返回
            //解析查询条件，查询条件都放在Wheres中，也可以在前端自定义wheres格式
            List<SearchParameters> wheres = options?.Wheres?.DeserializeObject<List<SearchParameters>>();
            //生成查询条件(这里可以不用EF，自己写原生sql)
            IQueryable<App_Expert> query = App_ExpertRepository.Instance.FindAsIQueryable(x => true);
            if (wheres != null)
            {
                string searchValue = wheres.Where(x => x.Name == "expertName").Select(s => s.Value).FirstOrDefault();
                //WhereNotEmpty方法要更新EntityProperties.cs否则用下面的if (!string.IsNullOrEmpty(searchKey))
                //query = query.WhereNotEmpty(x => x.ExpertName, searchValue);
                if (!string.IsNullOrEmpty(searchValue))
                {
                    query = query.Where(x => x.ExpertName.Contains(searchValue));
                }
            }
            var data = new
            {
                total = query.Count(), //查询到的总行数
                rows = query.OrderByDescending(x => x.CreateDate)//返回table列表
                .Select(s => new
                {
                    s.ExpertId,
                    s.ExpertName,
                    s.HeadImageUrl,
                    s.Resume,
                    s.Enable
                })
                .Skip(options.Page * (options.Page - 1))
                .Take(options.Rows).ToList()
            };
            return Json(data);
            //上面Json(data);返回的字段首字母是小写的,也可以使用JsonNormal返回原大小写不变
            // return JsonNormal(data);
        }
    }
}

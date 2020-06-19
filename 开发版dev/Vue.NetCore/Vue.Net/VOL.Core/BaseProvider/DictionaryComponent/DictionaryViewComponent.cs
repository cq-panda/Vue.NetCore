using VOL.Core.Dapper;
using VOL.Core.DBManager;
using VOL.Core.EFDbContext;
using VOL.Core.Extensions;
using VOL.Entity.DomainModels;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using Newtonsoft.Json;
using System;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace VOL.Core.BaseProvider.DictionaryComponent
{
    /// <summary>
    /// 组件视图，参照：https://docs.microsoft.com/en-us/aspnet/core/mvc/views/view-components?view=aspnetcore-2.1
    /// 与Controller命名一样必须以ViewComponent结尾
    /// </summary>
    public class DictionaryViewComponent : ViewComponent
    {
        public async Task<IViewComponentResult> InvokeAsync(string dropDownIds)
        {
            if (string.IsNullOrEmpty(dropDownIds))
                return null;

            string[] dicNos = dropDownIds.Split(',');
            StringBuilder stringBuilder = new StringBuilder();
            VOLContext context = DBServerProvider.GetEFDbContext();
            var dicData =await (from d in context.Set<Sys_Dictionary>()
                           join list in context.Set<Sys_DictionaryList>()
                           on d.Dic_ID equals list.Dic_ID
                           into t
                           from list in t.DefaultIfEmpty()
                           where dicNos.Contains(d.DicNo)
                           select new { list.DicValue, list.DicName, d.Config, d.DbSql, list.OrderNo, d.DicNo }).ToListAsync();

            foreach (var item in dicData.GroupBy(x => x.DicNo))
            {
                stringBuilder.AppendLine($" var optionConfig{item.Key} = {item.Select(x => x.Config).FirstOrDefault()}");

                string dbSql = item.Select(s => s.DbSql).FirstOrDefault();

                stringBuilder.AppendLine($@" var dataSource{item.Key} = {
                    (!string.IsNullOrEmpty(dbSql)
                    ? DBServerProvider.GetSqlDapper().QueryList<object>(dbSql, null).Serialize()
                    : item.OrderByDescending(o => o.OrderNo).
                            Select(s => new { s.DicName, s.DicValue }).ToList()
                            .Serialize())
                     }.convertToValueText(optionConfig{item.Key})");
                stringBuilder.AppendLine($" optionConfig{item.Key}.data = dataSource{item.Key};");
            }
            ViewBag.Dic = stringBuilder.ToString();
            return View("~/Views/Shared/Dictionary.cshtml");
        }

    }
}

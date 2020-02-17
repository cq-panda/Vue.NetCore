/*
 *所有关于App_TransactionAvgPrice类的业务代码应在此处编写
*可使用repository.调用常用方法，获取EF/Dapper等信息
*如果需要事务请使用repository.DbContextBeginTransaction
*也可使用DBServerProvider.手动获取数据库相关信息
*用户信息、权限、角色等使用UserContext.Current操作
*App_TransactionAvgPriceService对增、删、改查、导入、导出、审核业务代码扩展参照ServiceFunFilter
*/
using VOL.Core.BaseProvider;
using VOL.Core.Extensions.AutofacManager;
using VOL.Entity.DomainModels;
using System.Linq;
using VOL.Core.Extensions;
using System.Linq.Expressions;
using System;

namespace VOL.AppManager.Services
{
    public partial class App_TransactionAvgPriceService
    {
        public override PageGridData<App_TransactionAvgPrice> GetPageData(PageDataOptions options)
        {
            SummaryExpress = (IQueryable<App_TransactionAvgPrice> queryable) =>
            {
                return queryable.GroupBy(x => 1).Select(x => new
                {
                    AvgPrice = x.Average(o => o.AvgPrice),
                    Enable = x.Sum(o => o.Enable)
                })
                .FirstOrDefault();
            };
            return base.GetPageData(options);
        }

        protected override object GetDetailSummary<Detail>(IQueryable<Detail> queryeable)
        {
            return base.GetDetailSummary(queryeable);
        }

    }
}

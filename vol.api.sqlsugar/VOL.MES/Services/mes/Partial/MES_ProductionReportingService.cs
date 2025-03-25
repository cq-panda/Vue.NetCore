/*
 *所有关于MES_ProductionReporting类的业务代码应在此处编写
*可使用repository.调用常用方法，获取EF/Dapper等信息
*如果需要事务请使用repository.DbContextBeginTransaction
*也可使用DBServerProvider.手动获取数据库相关信息
*用户信息、权限、角色等使用UserContext.Current操作
*MES_ProductionReportingService对增、删、改查、导入、导出、审核业务代码扩展参照ServiceFunFilter
*/
using VOL.Core.BaseProvider;
using VOL.Core.Extensions.AutofacManager;
using VOL.Entity.DomainModels;
using System.Linq;
using VOL.Core.Utilities;
using System.Linq.Expressions;
using VOL.Core.Extensions;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.DependencyInjection;
using Microsoft.AspNetCore.Http;
using VOL.MES.IRepositories;
using SqlSugar;
using VOL.Core.DbSqlSugar;
using VOL.Core.DBManager;

namespace VOL.MES.Services
{
    public partial class MES_ProductionReportingService
    {
        private readonly IHttpContextAccessor _httpContextAccessor;
        private readonly IMES_ProductionReportingRepository _repository;//访问数据库

        [ActivatorUtilitiesConstructor]
        public MES_ProductionReportingService(
            IMES_ProductionReportingRepository dbRepository,
            IHttpContextAccessor httpContextAccessor
            )
        : base(dbRepository)
        {
            _httpContextAccessor = httpContextAccessor;
            _repository = dbRepository;
            //多租户会用到这init代码，其他情况可以不用
            //base.Init(dbRepository);
        }

        public override PageGridData<MES_ProductionReporting> GetPageData(PageDataOptions options)
        {
            SummaryExpress = (ISugarQueryable<MES_ProductionReporting> queryable) =>
            {
                return queryable.Select(o => new
                {
                    //注意大小写和数据库字段大小写一样
                    AcceptedQuantity = SqlFunc.AggregateSum(o.AcceptedQuantity),
                    RejectedQuantity = SqlFunc.AggregateSum(o.RejectedQuantity),
                    Total = SqlFunc.AggregateSum(o.Total),
                    ReportHour = SqlFunc.AggregateSum(o.ReportHour)
                })
                .FirstOrDefault();
            };
            return base.GetPageData(options);
        }

        protected override object GetDetailSummary<Detail>(ISugarQueryable<Detail> queryeable)
        {

            //ef写法（需要与前端开发文档上的【table显示合计】一起使用）
            return ((ISugarQueryable<MES_ProductionReportingDetail>)queryeable).Select(o => new
            {
                //Weight/Qty注意大小写和数据库字段大小写一样
                AcceptedQuantity = SqlFunc.AggregateSum(o.AcceptedQuantity),
                RejectedQuantity = SqlFunc.AggregateSum(o.RejectedQuantity),
                ReportedQuantity = SqlFunc.AggregateSum(o.ReportedQuantity),
                ReportHour = SqlFunc.AggregateSum(o.ReportHour)

            }).FirstOrDefault();
        }
    }
}

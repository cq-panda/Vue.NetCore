/*
 *所有关于Sys_WorkFlowTable类的业务代码应在此处编写
*可使用repository.调用常用方法，获取EF/Dapper等信息
*如果需要事务请使用repository.DbContextBeginTransaction
*也可使用DBServerProvider.手动获取数据库相关信息
*用户信息、权限、角色等使用UserContext.Current操作
*Sys_WorkFlowTableService对增、删、改查、导入、导出、审核业务代码扩展参照ServiceFunFilter
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
using VOL.System.IRepositories;
using VOL.Core.ManageUser;
using VOL.Core.WorkFlow;

namespace VOL.System.Services
{
    public partial class Sys_WorkFlowTableService
    {
        private readonly IHttpContextAccessor _httpContextAccessor;
        private readonly ISys_WorkFlowTableRepository _repository;//访问数据库
        private readonly ISys_WorkFlowTableStepRepository _stepRepository;//访问数据库
        [ActivatorUtilitiesConstructor]
        public Sys_WorkFlowTableService(
            ISys_WorkFlowTableRepository dbRepository,
            IHttpContextAccessor httpContextAccessor,
             ISys_WorkFlowTableStepRepository stepRepository
            )
        : base(dbRepository)
        {
            _httpContextAccessor = httpContextAccessor;
            _repository = dbRepository;
            _stepRepository = stepRepository;
            //多租户会用到这init代码，其他情况可以不用
            //base.Init(dbRepository);
        }

        public override PageGridData<Sys_WorkFlowTable> GetPageData(PageDataOptions options)
        {
            if (!UserContext.Current.IsSuperAdmin)
            {
                var user = UserContext.Current.UserInfo;
                //显示当前用户需要审批的数据
                var stepQuery = _stepRepository.FindAsIQueryable(x => (x.StepType == (int)AuditType.用户审批 && x.StepValue == user.User_Id)
                  || (x.StepType == (int)AuditType.角色审批 && x.StepValue == user.Role_Id)
                  || (x.StepType == (int)AuditType.部门审批 && x.StepValue == user.DeptId)
                   );
                QueryRelativeExpression = (IQueryable<Sys_WorkFlowTable> queryable) =>
                {
                    return queryable.Where(x => stepQuery.Any(c => x.WorkFlowTable_Id == c.WorkFlowTable_Id&&(x.CurrentOrderId == c.OrderId||c.AuditId==user.User_Id)));
                };
            }
            return base.GetPageData(options);
        }
    }
}

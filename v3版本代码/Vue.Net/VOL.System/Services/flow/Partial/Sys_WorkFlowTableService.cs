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
using System;

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
            Expression<Func<Sys_WorkFlowTable, bool>> expression = null;
            //移动端
            if (options.Value != null)
            {
                int value = options.Value.GetInt();
                //待审批
                if (value == 0)
                {
                    expression = x => x.AuditStatus == (int)AuditStatus.审核中|| x.AuditStatus == (int)AuditStatus.待审核;
                }
                //已审批
                else if (value == 1)
                {
                    expression = x => x.AuditStatus != (int)AuditStatus.审核中&&x.AuditStatus!= (int)AuditStatus.待审核;
                } //我的提交
                else if (value == 2)
                {
                    expression = x => x.CreateID == UserContext.Current.UserId;
                }
            }

            QueryRelativeExpression = (IQueryable<Sys_WorkFlowTable> queryable) =>
            {
                if (!UserContext.Current.IsSuperAdmin)
                {
                    var user = UserContext.Current.UserInfo;
                        //显示当前用户需要审批的数据
                        var deptIds = user.DeptIds.Select(s => s.ToString());
                    var stepQuery = _stepRepository.FindAsIQueryable(x => (x.StepType == (int)AuditType.用户审批 && x.StepValue == user.User_Id.ToString())
                      || (x.StepType == (int)AuditType.角色审批 && x.StepValue == user.Role_Id.ToString())
                      || (x.StepType == (int)AuditType.部门审批 && deptIds.Contains(x.StepValue))
                       );
                    queryable = queryable.Where(x => stepQuery.Any(c => x.WorkFlowTable_Id == c.WorkFlowTable_Id));
                }

                if (expression != null)
                {
                    return queryable.Where(expression);
                }
                return queryable;
            };

            return base.GetPageData(options);
        }
    }
}

/*
 *Author：jxx
 *Contact：283591387@qq.com
 *代码由框架生成,此处任何更改都可能导致被代码生成器覆盖
 *所有业务编写全部应在Partial文件夹下MES_SchedulingPlanService与IMES_SchedulingPlanService中编写
 */
using VOL.MES.IRepositories;
using VOL.MES.IServices;
using VOL.Core.BaseProvider;
using VOL.Core.Extensions.AutofacManager;
using VOL.Entity.DomainModels;

namespace VOL.MES.Services
{
    public partial class MES_SchedulingPlanService : ServiceBase<MES_SchedulingPlan, IMES_SchedulingPlanRepository>
    , IMES_SchedulingPlanService, IDependency
    {
    public static IMES_SchedulingPlanService Instance
    {
      get { return AutofacContainerModule.GetService<IMES_SchedulingPlanService>(); } }
    }
 }

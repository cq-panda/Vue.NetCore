/*
 *Author：jxx
 *Contact：283591387@qq.com
 *代码由框架生成,此处任何更改都可能导致被代码生成器覆盖
 *所有业务编写全部应在Partial文件夹下MES_QualityInspectionPlanService与IMES_QualityInspectionPlanService中编写
 */
using VOL.MES.IRepositories;
using VOL.MES.IServices;
using VOL.Core.BaseProvider;
using VOL.Core.Extensions.AutofacManager;
using VOL.Entity.DomainModels;

namespace VOL.MES.Services
{
    public partial class MES_QualityInspectionPlanService : ServiceBase<MES_QualityInspectionPlan, IMES_QualityInspectionPlanRepository>
    , IMES_QualityInspectionPlanService, IDependency
    {
    public static IMES_QualityInspectionPlanService Instance
    {
      get { return AutofacContainerModule.GetService<IMES_QualityInspectionPlanService>(); } }
    }
 }

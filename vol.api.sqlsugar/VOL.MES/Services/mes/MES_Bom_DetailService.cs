/*
 *Author：jxx
 *Contact：283591387@qq.com
 *代码由框架生成,此处任何更改都可能导致被代码生成器覆盖
 *所有业务编写全部应在Partial文件夹下MES_Bom_DetailService与IMES_Bom_DetailService中编写
 */
using VOL.MES.IRepositories;
using VOL.MES.IServices;
using VOL.Core.BaseProvider;
using VOL.Core.Extensions.AutofacManager;
using VOL.Entity.DomainModels;

namespace VOL.MES.Services
{
    public partial class MES_Bom_DetailService : ServiceBase<MES_Bom_Detail, IMES_Bom_DetailRepository>
    , IMES_Bom_DetailService, IDependency
    {
    public static IMES_Bom_DetailService Instance
    {
      get { return AutofacContainerModule.GetService<IMES_Bom_DetailService>(); } }
    }
 }

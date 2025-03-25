/*
 *Author：jxx
 *Contact：283591387@qq.com
 *代码由框架生成,此处任何更改都可能导致被代码生成器覆盖
 *所有业务编写全部应在Partial文件夹下MES_EquipmentRepairService与IMES_EquipmentRepairService中编写
 */
using VOL.MES.IRepositories;
using VOL.MES.IServices;
using VOL.Core.BaseProvider;
using VOL.Core.Extensions.AutofacManager;
using VOL.Entity.DomainModels;

namespace VOL.MES.Services
{
    public partial class MES_EquipmentRepairService : ServiceBase<MES_EquipmentRepair, IMES_EquipmentRepairRepository>
    , IMES_EquipmentRepairService, IDependency
    {
    public static IMES_EquipmentRepairService Instance
    {
      get { return AutofacContainerModule.GetService<IMES_EquipmentRepairService>(); } }
    }
 }

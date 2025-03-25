/*
 *Author：jxx
 *Contact：283591387@qq.com
 *代码由框架生成,此处任何更改都可能导致被代码生成器覆盖
 *所有业务编写全部应在Partial文件夹下Sys_QuartzLogService与ISys_QuartzLogService中编写
 */
using VOL.System.IRepositories;
using VOL.System.IServices;
using VOL.Core.BaseProvider;
using VOL.Core.Extensions.AutofacManager;
using VOL.Entity.DomainModels;

namespace VOL.System.Services
{
    public partial class Sys_QuartzLogService : ServiceBase<Sys_QuartzLog, ISys_QuartzLogRepository>
    , ISys_QuartzLogService, IDependency
    {
    public Sys_QuartzLogService(ISys_QuartzLogRepository repository)
    : base(repository)
    {
    Init(repository);
    }
    public static ISys_QuartzLogService Instance
    {
      get { return AutofacContainerModule.GetService<ISys_QuartzLogService>(); } }
    }
 }

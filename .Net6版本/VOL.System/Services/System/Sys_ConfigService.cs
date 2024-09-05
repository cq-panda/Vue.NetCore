/*
 *Author：jxx
 *Contact：283591387@qq.com
 *代码由框架生成,此处任何更改都可能导致被代码生成器覆盖
 *所有业务编写全部应在Partial文件夹下Sys_ConfigService与ISys_ConfigService中编写
 */
using VOL.System.IRepositories;
using VOL.System.IServices;
using VOL.Core.BaseProvider;
using VOL.Core.Extensions.AutofacManager;
using VOL.Entity.DomainModels;

namespace VOL.System.Services
{
    public partial class Sys_ConfigService : ServiceBase<Sys_Config, ISys_ConfigRepository>
    , ISys_ConfigService, IDependency
    {
    public static ISys_ConfigService Instance
    {
      get { return AutofacContainerModule.GetService<ISys_ConfigService>(); } }
    }
 }

/*
 *Author：jxx
 *Contact：283591387@qq.com
 *代码由框架生成,此处任何更改都可能导致被代码生成器覆盖
 *所有业务编写全部应在Partial文件夹下Sys_ConfigurationService与ISys_ConfigurationService中编写
 */
using VOL.System.IRepositories;
using VOL.System.IServices;
using VOL.Core.BaseProvider;
using VOL.Core.Extensions.AutofacManager;
using VOL.Entity.DomainModels;
using VOL.Core.Configuration;
using System.Threading.Tasks;
using VOL.Core.Utilities;

namespace VOL.System.Services
{
    public partial class Sys_ConfigurationService : ServiceBase<Sys_Configuration, ISys_ConfigurationRepository>, ISys_ConfigurationService, IDependency
    {
    }
}

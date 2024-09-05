/*
 *代码由框架生成,任何更改都可能导致被代码生成器覆盖
 *Repository提供数据库操作，如果要增加数据库操作请在当前目录下Partial文件夹Sys_ConfigRepository编写代码
 */
using VOL.System.IRepositories;
using VOL.Core.BaseProvider;
using VOL.Core.EFDbContext;
using VOL.Core.Extensions.AutofacManager;
using VOL.Entity.DomainModels;

namespace VOL.System.Repositories
{
    public partial class Sys_ConfigRepository : RepositoryBase<Sys_Config> , ISys_ConfigRepository
    {
    public Sys_ConfigRepository(VOLContext dbContext)
    : base(dbContext)
    {

    }
    public static ISys_ConfigRepository Instance
    {
      get {  return AutofacContainerModule.GetService<ISys_ConfigRepository>(); } }
    }
}

/*
 *代码由框架生成,任何更改都可能导致被代码生成器覆盖
 *Repository提供数据库操作，如果要增加数据库操作请在当前目录下Partial文件夹Sys_WorkFlowRepository编写代码
 */
using VOL.Sys.IRepositories;
using VOL.Core.BaseProvider;
using VOL.Core.EFDbContext;
using VOL.Core.Extensions.AutofacManager;
using VOL.Entity.DomainModels;

namespace VOL.Sys.Repositories
{
    public partial class Sys_WorkFlowRepository : RepositoryBase<Sys_WorkFlow> , ISys_WorkFlowRepository
    {
    public Sys_WorkFlowRepository(VOLContext dbContext)
    : base(dbContext)
    {

    }
    public static ISys_WorkFlowRepository Instance
    {
      get {  return AutofacContainerModule.GetService<ISys_WorkFlowRepository>(); } }
    }
}

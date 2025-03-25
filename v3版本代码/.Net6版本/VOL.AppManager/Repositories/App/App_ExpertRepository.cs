/*
 *代码由框架生成,任何更改都可能导致被代码生成器覆盖
 *Repository提供数据库操作，如果要增加数据库操作请在当前目录下Partial文件夹App_ExpertRepository编写代码
 */
using VOL.AppManager.IRepositories;
using VOL.Core.BaseProvider;
using VOL.Core.EFDbContext;
using VOL.Core.Extensions.AutofacManager;
using VOL.Entity.DomainModels;

namespace VOL.AppManager.Repositories
{
    public partial class App_ExpertRepository : RepositoryBase<App_Expert> , IApp_ExpertRepository
    {
    public App_ExpertRepository(VOLContext dbContext)
    : base(dbContext)
    {

    }
    public static IApp_ExpertRepository Instance
    {
      get {  return AutofacContainerModule.GetService<IApp_ExpertRepository>(); } }
    }
}

/*
 *代码由框架生成,任何更改都可能导致被代码生成器覆盖
 *Repository提供数据库操作，如果要增加数据库操作请在当前目录下Partial文件夹PersonalRepository编写代码
 */
using Business.IRepositories;
using VOL.Core.BaseProvider;
using VOL.Core.EFDbContext;
using VOL.Core.Extensions.AutofacManager;
using VOL.Entity.DomainModels;

namespace Business.Repositories
{
    public partial class PersonalRepository : RepositoryBase<Personal> , IPersonalRepository
    {
    public PersonalRepository(VOLContext dbContext)
    : base(dbContext)
    {

    }
    public static IPersonalRepository Instance
    {
      get {  return AutofacContainerModule.GetService<IPersonalRepository>(); } }
    }
}

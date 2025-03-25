using VOL.System.IRepositories;
using VOL.Core.BaseProvider;
using VOL.Core.Extensions.AutofacManager;
using VOL.Core.EFDbContext;
using VOL.Entity.DomainModels;

namespace VOL.System.Repositories
{
    public partial class Sys_MenuRepository : RepositoryBase<Sys_Menu>, ISys_MenuRepository
    {
        public Sys_MenuRepository(VOLContext dbContext)
        : base(dbContext)
        {

        }
        public static ISys_MenuRepository Instance
        {
            get { return AutofacContainerModule.GetService<ISys_MenuRepository>(); }
        }
    }
}


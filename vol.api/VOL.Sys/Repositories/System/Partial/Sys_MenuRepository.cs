using VOL.Sys.IRepositories;
using VOL.Core.BaseProvider;
using VOL.Core.Extensions.AutofacManager;
using VOL.Core.EFDbContext;
using VOL.Entity.DomainModels;

namespace VOL.Sys.Repositories
{
    public partial class Sys_MenuRepository
    {
        public override VOLContext DbContext => base.DbContext;
    }
}


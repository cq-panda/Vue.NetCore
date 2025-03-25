using VOL.Builder.IRepositories;
using VOL.Core.BaseProvider;
using VOL.Core.DbContext;
using VOL.Core.Extensions.AutofacManager;
using VOL.Entity.DomainModels;

namespace VOL.Builder.Repositories
{
    public partial class Sys_TableInfoRepository : RepositoryBase<Sys_TableInfo>, ISys_TableInfoRepository
    {
        public Sys_TableInfoRepository(VOLContext dbContext)
        : base(dbContext)
        {

        }
        public static ISys_TableInfoRepository GetService
        {
            get { return AutofacContainerModule.GetService<ISys_TableInfoRepository>(); }
        }
    }
}


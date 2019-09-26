using VOL.System.IRepositories;
using VOL.Core.BaseProvider;
using VOL.Core.Extensions.AutofacManager;
using VOL.Core.EFDbContext;
using VOL.Entity.DomainModels;

namespace VOL.System.Repositories
{
    public partial class Wms_ProductCatalogRepository : RepositoryBase<Wms_ProductCatalog>, IWms_ProductCatalogRepository
    {
        public Wms_ProductCatalogRepository(VOLContext dbContext)
        : base(dbContext)
        {

        }
        public static IWms_ProductCatalogRepository GetService
        {
            get { return AutofacContainerModule.GetService<IWms_ProductCatalogRepository>(); }
        }
    }
}


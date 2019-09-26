using VOL.Entity.MappingConfiguration;
using VOL.Entity.DomainModels;
using Microsoft.EntityFrameworkCore.Metadata.Builders;

namespace DairyStar.Framework.Entity.MappingConfiguration
{
    public class Wms_ProductCatalogMapConfig : EntityMappingConfiguration<Wms_ProductCatalog>
    {
        public override void Map(EntityTypeBuilder<Wms_ProductCatalog> builderTable)
        {
          //b.Property(x => x.StorageName).HasMaxLength(45);
        }
    }
}



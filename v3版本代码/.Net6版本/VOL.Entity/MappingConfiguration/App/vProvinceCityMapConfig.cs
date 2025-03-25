using VOL.Entity.MappingConfiguration;
using VOL.Entity.DomainModels;
using Microsoft.EntityFrameworkCore.Metadata.Builders;

namespace VOL.Entity.MappingConfiguration
{
    public class vProvinceCityMapConfig : EntityMappingConfiguration<vProvinceCity>
    {
        public override void Map(EntityTypeBuilder<vProvinceCity>
        builderTable)
        {
          //b.Property(x => x.StorageName).HasMaxLength(45);
        }
     }
}


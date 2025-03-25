using VOL.Entity.MappingConfiguration;
using VOL.Entity.DomainModels;
using Microsoft.EntityFrameworkCore.Metadata.Builders;

namespace VOL.Entity.MappingConfiguration
{
    public class SellOrderListMapConfig : EntityMappingConfiguration<SellOrderList>
    {
        public override void Map(EntityTypeBuilder<SellOrderList>
        builderTable)
        {
          //b.Property(x => x.StorageName).HasMaxLength(45);
        }
     }
}


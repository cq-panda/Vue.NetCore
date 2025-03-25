using VOL.Entity.MappingConfiguration;
using VOL.Entity.DomainModels;
using Microsoft.EntityFrameworkCore.Metadata.Builders;

namespace VOL.Entity.MappingConfiguration
{
    public class App_TransactionAvgPriceMapConfig : EntityMappingConfiguration<App_TransactionAvgPrice>
    {
        public override void Map(EntityTypeBuilder<App_TransactionAvgPrice>
        builderTable)
        {
          //b.Property(x => x.StorageName).HasMaxLength(45);
        }
     }
}


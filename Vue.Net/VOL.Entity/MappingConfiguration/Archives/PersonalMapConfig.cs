using VOL.Entity.MappingConfiguration;
using VOL.Entity.DomainModels;
using Microsoft.EntityFrameworkCore.Metadata.Builders;

namespace VOL.Entity.MappingConfiguration
{
    public class PersonalMapConfig : EntityMappingConfiguration<Personal>
    {
        public override void Map(EntityTypeBuilder<Personal>
        builderTable)
        {
          //b.Property(x => x.StorageName).HasMaxLength(45);
        }
     }
}


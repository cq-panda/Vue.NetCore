using VOL.Entity.MappingConfiguration;
using VOL.Entity.DomainModels;
using Microsoft.EntityFrameworkCore.Metadata.Builders;

namespace VOL.Entity.MappingConfiguration
{
    public class FormDesignOptionsMapConfig : EntityMappingConfiguration<FormDesignOptions>
    {
        public override void Map(EntityTypeBuilder<FormDesignOptions>
        builderTable)
        {
          //b.Property(x => x.StorageName).HasMaxLength(45);
        }
     }
}


using VOL.Entity.MappingConfiguration;
using VOL.Entity.DomainModels;
using Microsoft.EntityFrameworkCore.Metadata.Builders;

namespace VOL.Entity.MappingConfiguration
{
    public class FormCollectionObjectMapConfig : EntityMappingConfiguration<FormCollectionObject>
    {
        public override void Map(EntityTypeBuilder<FormCollectionObject>
        builderTable)
        {
          //b.Property(x => x.StorageName).HasMaxLength(45);
        }
     }
}


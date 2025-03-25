using VOL.Entity.MappingConfiguration;
using VOL.Entity.DomainModels;
using Microsoft.EntityFrameworkCore.Metadata.Builders;

namespace VOL.Entity.MappingConfiguration
{
    public class Sys_MenuMapConfig : EntityMappingConfiguration<Sys_Menu>
    {
        public override void Map(EntityTypeBuilder<Sys_Menu>
        builderTable)
        {
          //b.Property(x => x.StorageName).HasMaxLength(45);
        }
     }
}


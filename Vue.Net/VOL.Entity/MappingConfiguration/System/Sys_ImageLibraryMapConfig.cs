using VOL.Entity.MappingConfiguration;
using VOL.Entity.DomainModels;
using Microsoft.EntityFrameworkCore.Metadata.Builders;

namespace DairyStar.Framework.Entity.MappingConfiguration
{
    public class Sys_ImageLibraryMapConfig : EntityMappingConfiguration<Sys_ImageLibrary>
    {
        public override void Map(EntityTypeBuilder<Sys_ImageLibrary> builderTable)
        {
          //b.Property(x => x.StorageName).HasMaxLength(45);
        }
    }
}


using VOL.Entity.MappingConfiguration;
using VOL.Entity.DomainModels;
using Microsoft.EntityFrameworkCore.Metadata.Builders;

namespace DairyStar.Framework.Entity.MappingConfiguration
{
    public class App_StaticBrowserLogMapConfig : EntityMappingConfiguration<App_StaticBrowserLog>
    {
        public override void Map(EntityTypeBuilder<App_StaticBrowserLog> builderTable)
        {
          //b.Property(x => x.StorageName).HasMaxLength(45);
        }
    }
}


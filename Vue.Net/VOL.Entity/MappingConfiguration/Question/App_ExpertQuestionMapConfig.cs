using VOL.Entity.MappingConfiguration;
using VOL.Entity.DomainModels;
using Microsoft.EntityFrameworkCore.Metadata.Builders;

namespace DairyStar.Framework.Entity.MappingConfiguration
{
    public class App_ExpertQuestionMapConfig : EntityMappingConfiguration<App_ExpertQuestion>
    {
        public override void Map(EntityTypeBuilder<App_ExpertQuestion> builderTable)
        {
          //b.Property(x => x.StorageName).HasMaxLength(45);
        }
    }
}



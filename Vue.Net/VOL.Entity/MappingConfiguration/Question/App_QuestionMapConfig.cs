using VOL.Entity.MappingConfiguration;
using VOL.Entity.DomainModels;
using Microsoft.EntityFrameworkCore.Metadata.Builders;

namespace DairyStar.Framework.Entity.MappingConfiguration
{
    public class App_QuestionMapConfig : EntityMappingConfiguration<App_Question>
    {
        public override void Map(EntityTypeBuilder<App_Question> builderTable)
        {
          //b.Property(x => x.StorageName).HasMaxLength(45);
        }
    }
}


using VOL.Entity.MappingConfiguration;
using VOL.Entity.DomainModels;
using Microsoft.EntityFrameworkCore.Metadata.Builders;

namespace DairyStar.Framework.Entity.MappingConfiguration
{
    public class App_PublicQuestionMapConfig : EntityMappingConfiguration<App_PublicQuestion>
    {
        public override void Map(EntityTypeBuilder<App_PublicQuestion> builderTable)
        {
          //b.Property(x => x.StorageName).HasMaxLength(45);
        }
    }
}



using VOL.Entity.MappingConfiguration;
using VOL.Entity.DomainModels;
using Microsoft.EntityFrameworkCore.Metadata.Builders;

namespace DairyStar.Framework.Entity.MappingConfiguration
{
    public class App_QuestionReplyMapConfig : EntityMappingConfiguration<App_QuestionReply>
    {
        public override void Map(EntityTypeBuilder<App_QuestionReply> builderTable)
        {
          //b.Property(x => x.StorageName).HasMaxLength(45);
        }
    }
}


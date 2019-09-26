using VOL.Entity.MappingConfiguration;
using VOL.Entity.DomainModels;
using Microsoft.EntityFrameworkCore.Metadata.Builders;

namespace DairyStar.Framework.Entity.MappingConfiguration
{
    public class App_PublicQuestionReplyMapConfig : EntityMappingConfiguration<App_PublicQuestionReply>
    {
        public override void Map(EntityTypeBuilder<App_PublicQuestionReply> builderTable)
        {
          //b.Property(x => x.StorageName).HasMaxLength(45);
        }
    }
}



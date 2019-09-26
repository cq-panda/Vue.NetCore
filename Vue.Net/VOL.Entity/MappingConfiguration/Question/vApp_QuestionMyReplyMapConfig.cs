using VOL.Entity.MappingConfiguration;
using VOL.Entity.DomainModels;
using Microsoft.EntityFrameworkCore.Metadata.Builders;

namespace DairyStar.Framework.Entity.MappingConfiguration
{
    public class vApp_QuestionMyReplyMapConfig : EntityMappingConfiguration<vApp_QuestionMyReply>
    {
        public override void Map(EntityTypeBuilder<vApp_QuestionMyReply> builderTable)
        {
          //b.Property(x => x.StorageName).HasMaxLength(45);
        }
    }
}





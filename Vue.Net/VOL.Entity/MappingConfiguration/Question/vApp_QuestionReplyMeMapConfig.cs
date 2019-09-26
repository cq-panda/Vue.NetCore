using VOL.Entity.MappingConfiguration;
using VOL.Entity.DomainModels;
using Microsoft.EntityFrameworkCore.Metadata.Builders;

namespace DairyStar.Framework.Entity.MappingConfiguration
{
    public class vApp_QuestionReplyMeMapConfig : EntityMappingConfiguration<vApp_QuestionReplyMe>
    {
        public override void Map(EntityTypeBuilder<vApp_QuestionReplyMe> builderTable)
        {
          //b.Property(x => x.StorageName).HasMaxLength(45);
        }
    }
}


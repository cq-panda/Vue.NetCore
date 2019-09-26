using VOL.Entity.MappingConfiguration;
using VOL.Entity.DomainModels;
using Microsoft.EntityFrameworkCore.Metadata.Builders;

namespace DairyStar.Framework.Entity.MappingConfiguration
{
    public class Sys_UserRegisterRecordMapConfig : EntityMappingConfiguration<Sys_UserRegisterRecord>
    {
        public override void Map(EntityTypeBuilder<Sys_UserRegisterRecord> builderTable)
        {
          //b.Property(x => x.StorageName).HasMaxLength(45);
        }
    }
}



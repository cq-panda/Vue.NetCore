using VOL.Entity.MappingConfiguration;
using VOL.Entity.DomainModels;
using Microsoft.EntityFrameworkCore.Metadata.Builders;

namespace VOL.Entity.MappingConfiguration
{
    public class Personal_CertificatesMapConfig : EntityMappingConfiguration<Personal_Certificates>
    {
        public override void Map(EntityTypeBuilder<Personal_Certificates>
        builderTable)
        {
          //b.Property(x => x.StorageName).HasMaxLength(45);
        }
     }
}


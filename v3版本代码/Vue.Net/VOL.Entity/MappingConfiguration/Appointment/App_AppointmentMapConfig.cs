using VOL.Entity.MappingConfiguration;
using VOL.Entity.DomainModels;
using Microsoft.EntityFrameworkCore.Metadata.Builders;

namespace VOL.Entity.MappingConfiguration
{
    public class App_AppointmentMapConfig : EntityMappingConfiguration<App_Appointment>
    {
        public override void Map(EntityTypeBuilder<App_Appointment>
        builderTable)
        {
          //b.Property(x => x.StorageName).HasMaxLength(45);
        }
     }
}


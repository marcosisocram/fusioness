using System.Data.Entity.ModelConfiguration;
using Fusioness.Entities;

namespace Fusioness.Data.Mapping
{
    public class StatusEventoMap : EntityTypeConfiguration<StatusEvento>
    {
        public StatusEventoMap()
        {
            // Primary Key
            this.HasKey(t => t.IdStatusEvento);

            // Properties
            this.Property(t => t.Descricao)
                .IsRequired()
                .HasMaxLength(50);

            // Table & Column Mappings
            this.ToTable("StatusEvento");
            this.Property(t => t.IdStatusEvento).HasColumnName("IdStatusEvento");
            this.Property(t => t.Descricao).HasColumnName("Descricao");
        }
    }
}

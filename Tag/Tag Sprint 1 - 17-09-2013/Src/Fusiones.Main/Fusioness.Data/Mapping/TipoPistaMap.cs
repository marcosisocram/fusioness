using System.ComponentModel.DataAnnotations;
using System.Data.Entity.ModelConfiguration;
using Fusioness.Entities;

namespace Fusioness.Data.Mapping
{
    public class TipoPistaMap : EntityTypeConfiguration<TipoPista>
    {
        public TipoPistaMap()
        {
            // Primary Key
            this.HasKey(t => t.IdTipoPista);

            // Properties
            this.Property(t => t.Descricao)
                .IsRequired()
                .HasMaxLength(50);

            // Table & Column Mappings
            this.ToTable("TipoPista");
            this.Property(t => t.IdTipoPista).HasColumnName("IdTipoPista");
            this.Property(t => t.Descricao).HasColumnName("Descricao");
        }
    }
}

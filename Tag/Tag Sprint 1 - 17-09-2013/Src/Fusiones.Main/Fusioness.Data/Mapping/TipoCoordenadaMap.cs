using System.ComponentModel.DataAnnotations;
using System.Data.Entity.ModelConfiguration;
using Fusioness.Entities;

namespace Fusioness.Data.Mapping
{
    public class TipoCoordenadaMap : EntityTypeConfiguration<TipoCoordenada>
    {
        public TipoCoordenadaMap()
        {
            // Primary Key
            this.HasKey(t => t.IdTipoCoordenada);

            // Properties
            this.Property(t => t.Descricao)
                .IsRequired()
                .HasMaxLength(200);

            // Table & Column Mappings
            this.ToTable("TipoCoordenada");
            this.Property(t => t.IdTipoCoordenada).HasColumnName("IdTipoCoordenada");
            this.Property(t => t.Descricao).HasColumnName("Descricao");
        }
    }
}

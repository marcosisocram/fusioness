using System.ComponentModel.DataAnnotations;
using System.Data.Entity.ModelConfiguration;
using Fusioness.Entities;

namespace Fusioness.Data.Mapping
{
    public class CoordenadaMap : EntityTypeConfiguration<Coordenada>
    {
        public CoordenadaMap()
        {
            // Primary Key
            this.HasKey(t => t.IdCoordenada);

            // Properties
            // Table & Column Mappings
            this.ToTable("Coordenada");
            this.Property(t => t.IdCoordenada).HasColumnName("IdCoordenada");
            this.Property(t => t.IdRota).HasColumnName("IdRota");
            this.Property(t => t.IdTipoCoordenada).HasColumnName("IdTipoCoordenada");
            this.Property(t => t.Latitude).HasColumnName("Latitude");
            this.Property(t => t.Longitude).HasColumnName("Longitude");
            this.Property(t => t.Data).HasColumnName("Data");

            // Relationships
            this.HasRequired(t => t.Rota)
                .WithMany(t => t.Coordenadas)
                .HasForeignKey(d => d.IdRota);
            this.HasOptional(t => t.TipoCoordenada)
                .WithMany(t => t.Coordenadas)
                .HasForeignKey(d => d.IdTipoCoordenada);

        }
    }
}

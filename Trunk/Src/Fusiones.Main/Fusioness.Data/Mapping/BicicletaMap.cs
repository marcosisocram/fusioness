using System.ComponentModel.DataAnnotations;
using System.Data.Entity.ModelConfiguration;
using Fusioness.Entities;

namespace Fusioness.Data.Mapping
{
    public class BicicletaMap : EntityTypeConfiguration<Bicicleta>
    {
        public BicicletaMap()
        {
            // Primary Key
            this.HasKey(t => t.IdBicicleta);

            // Properties
            this.Property(t => t.Modelo)
                .IsRequired()
                .HasMaxLength(100);

            this.Property(t => t.Marca)
                .IsRequired()
                .HasMaxLength(100);

            // Table & Column Mappings
            this.ToTable("Bicicleta");
            this.Property(t => t.IdBicicleta).HasColumnName("IdBicicleta");
            this.Property(t => t.IdUsuario).HasColumnName("IdUsuario");
            this.Property(t => t.Modelo).HasColumnName("Modelo");
            this.Property(t => t.Marca).HasColumnName("Marca");

            // Relationships
            this.HasRequired(t => t.Usuario)
                .WithMany(t => t.Bicicletas)
                .HasForeignKey(d => d.IdUsuario);

        }
    }
}

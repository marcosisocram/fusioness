using System.ComponentModel.DataAnnotations;
using System.Data.Entity.ModelConfiguration;
using Fusioness.Entities;

namespace Fusioness.Data.Mapping
{
    public class ComentarioEventoMap : EntityTypeConfiguration<ComentarioEvento>
    {
        public ComentarioEventoMap()
        {
            // Primary Key
            this.HasKey(t => t.IdComentarioEvento);

            // Properties
            this.Property(t => t.Descricao)
                .IsRequired()
                .HasMaxLength(50);

            // Table & Column Mappings
            this.ToTable("ComentarioEvento");
            this.Property(t => t.IdComentarioEvento).HasColumnName("IdComentarioEvento");
            this.Property(t => t.IdEvento).HasColumnName("IdEvento");
            this.Property(t => t.IdUsuario).HasColumnName("IdUsuario");
            this.Property(t => t.Descricao).HasColumnName("Descricao");

            // Relationships
            HasRequired(t => t.Evento)
                .WithMany(t => t.ComentariosEvento)
                .HasForeignKey(d => d.IdEvento);

            HasRequired(t => t.Usuario)
                .WithMany(t => t.ComentariosEventos)
                .HasForeignKey(d => d.IdUsuario);
        }
    }
}

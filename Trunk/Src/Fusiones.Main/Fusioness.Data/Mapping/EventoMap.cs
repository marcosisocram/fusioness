using System.ComponentModel.DataAnnotations;
using System.Data.Entity.ModelConfiguration;
using Fusioness.Entities;

namespace Fusioness.Data.Mapping
{
    public class EventoMap : EntityTypeConfiguration<Evento>
    {
        public EventoMap()
        {
            // Primary Key
            this.HasKey(t => t.IdEvento);

            // Properties
            this.Property(t => t.Titulo)
                .IsRequired()
                .HasMaxLength(100);

            this.Property(t => t.Descricao)
                .IsRequired();
            this.Property(t => t.UrlImagem)
                .HasMaxLength(2000);

            // Table & Column Mappings
            this.ToTable("Evento");
            this.Property(t => t.IdEvento).HasColumnName("IdEvento");
            this.Property(t => t.IdUsuario).HasColumnName("IdUsuario");
            this.Property(t => t.IdRota).HasColumnName("IdRota");
            this.Property(t => t.Titulo).HasColumnName("Titulo");
            this.Property(t => t.Descricao).HasColumnName("Descricao");
            this.Property(t => t.Data).HasColumnName("Data");
            this.Property(t => t.UrlImagem).HasColumnName("UrlImagem");
            this.Property(t => t.Publico).HasColumnName("Publico");

            // Relationships
            this.HasRequired(t => t.Rota)
                .WithMany(t => t.Eventos)
                .HasForeignKey(d => d.IdRota);
            this.HasRequired(t => t.Usuario)
                .WithMany(t => t.Eventos)
                .HasForeignKey(d => d.IdUsuario);

        }
    }
}

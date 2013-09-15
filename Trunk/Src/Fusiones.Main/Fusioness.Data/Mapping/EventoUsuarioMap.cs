using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Data.Entity.ModelConfiguration;
using Fusioness.Entities;

namespace Fusioness.Data.Mapping
{
    class EventoUsuarioMap : EntityTypeConfiguration<EventoUsuario>
    {
        public EventoUsuarioMap()
        {
            // Primary Key
            this.HasKey(t => new { t.IdUsuario, t.IdEvento });

            // Properties
            this.Property(t => t.IdUsuario)
                .HasDatabaseGeneratedOption(DatabaseGeneratedOption.None);

            this.Property(t => t.IdEvento)
                .HasDatabaseGeneratedOption(DatabaseGeneratedOption.None);
                        
            this.Property(t => t.StatusDescricao)                
                .HasMaxLength(500);

            this.ToTable("EventoUsuario");
            this.Property(t => t.IdEvento).HasColumnName("IdUsuario");
            this.Property(t => t.IdUsuario).HasColumnName("IdEvento");
            this.Property(t => t.IdStatusEvento).HasColumnName("IdStatusEvento");
            this.Property(t => t.StatusDescricao).HasColumnName("StatusDescricao");

            // Relationships
            this.HasRequired(t => t.Usuario)
                .WithMany(t => t.EventosUsuarios)
                .HasForeignKey(d => d.IdUsuario);
            this.HasRequired(t => t.Evento)
                .WithMany(t => t.EventosUsuarios)
                .HasForeignKey(d => d.IdEvento);
            this.HasOptional(t => t.StatusEventos)
               .WithMany(t => t.EventosUsuario)
               .HasForeignKey(d => d.IdStatusEvento);
        }
    }
}

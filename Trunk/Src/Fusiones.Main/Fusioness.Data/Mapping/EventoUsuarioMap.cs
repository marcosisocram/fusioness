using System.ComponentModel.DataAnnotations.Schema;
using System.Data.Entity.ModelConfiguration;
using Fusioness.Entities;

namespace Fusioness.Data.Mapping
{
    public class EventoUsuarioMap : EntityTypeConfiguration<EventoUsuario>
    {
        public EventoUsuarioMap()
        {
            // Primary Key
            HasKey(t => new { t.IdUsuario, t.IdEvento });

            // Properties
            Property(t => t.IdUsuario)
                .HasDatabaseGeneratedOption(DatabaseGeneratedOption.None);

            Property(t => t.IdEvento)
                .HasDatabaseGeneratedOption(DatabaseGeneratedOption.None);

            Property(t => t.StatusDescricao)
                .HasMaxLength(500);

            // Table & Column Mappings
            ToTable("EventoUsuario");
            Property(t => t.IdUsuario).HasColumnName("IdUsuario");
            Property(t => t.IdEvento).HasColumnName("IdEvento");
            Property(t => t.IdStatusEvento).HasColumnName("IdStatusEvento");
            Property(t => t.StatusDescricao).HasColumnName("StatusDescricao");

            // Relationships
            HasRequired(t => t.Evento)
                .WithMany(t => t.EventoUsuarios)
                .HasForeignKey(d => d.IdEvento);
            HasOptional(t => t.StatusEvento)
                .WithMany(t => t.EventoUsuarios)
                .HasForeignKey(d => d.IdStatusEvento);
            HasRequired(t => t.Usuario)
                .WithMany(t => t.EventoUsuarios)
                .HasForeignKey(d => d.IdUsuario);

        }
    }
}

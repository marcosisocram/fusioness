using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Data.Entity.ModelConfiguration;
using Fusioness.Entities;

namespace Fusioness.Data.Mapping
{
    public class EventoUsuarioMap : EntityTypeConfiguration<EventoUsuario>
    {
        public EventoUsuarioMap()
        {
            HasKey(t => new { t.IdUsuario, t.IdEvento });

            // Properties
            Property(t => t.IdUsuario)
                .HasDatabaseGeneratedOption(DatabaseGeneratedOption.None);

            Property(t => t.IdEvento)
                .HasDatabaseGeneratedOption(DatabaseGeneratedOption.None);


            // Table & Column Mappings
            ToTable("EventoUsuario");
            Property(t => t.IdUsuario).HasColumnName("IdUsuario");
            Property(t => t.IdEvento).HasColumnName("IdEvento");
            Property(t => t.DataInicial).HasColumnName("DataInicial");
            Property(t => t.DataFinal).HasColumnName("DataFinal");

            // Relationships
            HasRequired(t => t.Evento)
                .WithMany(t => t.EventoUsuarios)
                .HasForeignKey(d => d.IdEvento);

            HasRequired(t => t.Usuario)
                .WithMany(t => t.EventoUsuarios)
                .HasForeignKey(d => d.IdUsuario);
        }
    }
}

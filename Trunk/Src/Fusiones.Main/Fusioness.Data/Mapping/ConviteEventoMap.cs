using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Data.Entity.ModelConfiguration;
using Fusioness.Entities;

namespace Fusioness.Data.Mapping
{
    public class ConviteEventoMap : EntityTypeConfiguration<ConviteEvento>
    {
        public ConviteEventoMap()
        {
            // Primary Key
            this.HasKey(t => new { t.IdUsuario, t.IdContato, t.IdEvento });

            // Properties
            this.Property(t => t.IdUsuario)
                .HasDatabaseGeneratedOption(DatabaseGeneratedOption.None);

            this.Property(t => t.IdContato)
                .HasDatabaseGeneratedOption(DatabaseGeneratedOption.None);

            this.Property(t => t.IdEvento)
                .HasDatabaseGeneratedOption(DatabaseGeneratedOption.None);

            // Table & Column Mappings
            this.ToTable("ConviteEvento");
            this.Property(t => t.IdUsuario).HasColumnName("IdUsuario");
            this.Property(t => t.IdContato).HasColumnName("IdContato");
            this.Property(t => t.IdEvento).HasColumnName("IdEvento");
            this.Property(t => t.IdResposta).HasColumnName("IdResposta");

            // Relationships
            this.HasRequired(t => t.Contato)
                .WithMany(t => t.ConviteEventos)
                .HasForeignKey(d => new { d.IdUsuario, d.IdContato });
            this.HasRequired(t => t.Evento)
                .WithMany(t => t.ConviteEventos)
                .HasForeignKey(d => d.IdEvento);
            this.HasOptional(t => t.Resposta)
                .WithMany(t => t.ConviteEventos)
                .HasForeignKey(d => d.IdResposta);

        }
    }
}

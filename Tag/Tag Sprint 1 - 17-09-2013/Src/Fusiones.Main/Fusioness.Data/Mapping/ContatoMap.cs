using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Data.Entity.ModelConfiguration;
using Fusioness.Entities;

namespace Fusioness.Data.Mapping
{
    public class ContatoMap : EntityTypeConfiguration<Contato>
    {
        public ContatoMap()
        {
            // Primary Key
            this.HasKey(t => new { t.IdUsuario, t.IdContato });

            // Properties
            this.Property(t => t.IdUsuario)
                .HasDatabaseGeneratedOption(DatabaseGeneratedOption.None);

            this.Property(t => t.IdContato)
                .HasDatabaseGeneratedOption(DatabaseGeneratedOption.None);

            // Table & Column Mappings
            this.ToTable("Contato");
            this.Property(t => t.IdUsuario).HasColumnName("IdUsuario");
            this.Property(t => t.IdContato).HasColumnName("IdContato");

            // Relationships
            this.HasRequired(t => t.Usuario)
                .WithMany(t => t.Contatos)
                .HasForeignKey(d => d.IdUsuario);
            this.HasRequired(t => t.Usuario1)
                .WithMany(t => t.Contatos1)
                .HasForeignKey(d => d.IdContato);

        }
    }
}

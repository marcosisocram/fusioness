using System.ComponentModel.DataAnnotations;
using System.Data.Entity.ModelConfiguration;
using Fusioness.Entities;

namespace Fusioness.Data.Mapping
{
    public class QualidadeRotaMap : EntityTypeConfiguration<QualidadeRota>
    {
        public QualidadeRotaMap()
        {
            // Primary Key
            this.HasKey(t => t.IdQualidadeRota);

            // Properties
            this.Property(t => t.Descricao)
                .IsRequired()
                .HasMaxLength(50);

            // Table & Column Mappings
            this.ToTable("QualidadeRota");
            this.Property(t => t.IdQualidadeRota).HasColumnName("IdQualidadeRota");
            this.Property(t => t.Descricao).HasColumnName("Descricao");
        }
    }
}

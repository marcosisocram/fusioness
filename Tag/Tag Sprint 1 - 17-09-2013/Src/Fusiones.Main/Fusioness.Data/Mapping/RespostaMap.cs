using System.ComponentModel.DataAnnotations;
using System.Data.Entity.ModelConfiguration;
using Fusioness.Entities;

namespace Fusioness.Data.Mapping
{
    public class RespostaMap : EntityTypeConfiguration<Resposta>
    {
        public RespostaMap()
        {
            // Primary Key
            this.HasKey(t => t.IdResposta);

            // Properties
            this.Property(t => t.Descricao)
                .IsRequired()
                .HasMaxLength(50);

            // Table & Column Mappings
            this.ToTable("Resposta");
            this.Property(t => t.IdResposta).HasColumnName("IdResposta");
            this.Property(t => t.Descricao).HasColumnName("Descricao");
        }
    }
}

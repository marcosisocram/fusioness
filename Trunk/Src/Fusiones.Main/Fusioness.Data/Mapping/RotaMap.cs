using System.ComponentModel.DataAnnotations;
using System.Data.Entity.ModelConfiguration;
using Fusioness.Entities;

namespace Fusioness.Data.Mapping
{
    public class RotaMap : EntityTypeConfiguration<Rota>
    {
        public RotaMap()
        {
            // Primary Key
            this.HasKey(t => t.IdRota);

            // Properties
            // Table & Column Mappings
            this.ToTable("Rota");
            this.Property(t => t.IdRota).HasColumnName("IdRota");
            this.Property(t => t.IdRotaOrigem).HasColumnName("IdRotaOrigem");            
            this.Property(t => t.IdUsuario).HasColumnName("IdUsuario");
            this.Property(t => t.IdTipoPista).HasColumnName("IdTipoPista");
            this.Property(t => t.IdDificuldade).HasColumnName("IdDificuldade");
            this.Property(t => t.IdQualidadeRota).HasColumnName("IdQualidadeRota");
            this.Property(t => t.Descricao).HasColumnName("Descricao");

            // Relationships
            this.HasOptional(t => t.Dificuldade)
                .WithMany(t => t.Rotas)
                .HasForeignKey(d => d.IdDificuldade);
            this.HasOptional(t => t.QualidadeRota)
                .WithMany(t => t.Rotas)
                .HasForeignKey(d => d.IdQualidadeRota);
            this.HasOptional(t => t.TipoPista)
                .WithMany(t => t.Rotas)
                .HasForeignKey(d => d.IdTipoPista);
            this.HasRequired(t => t.Usuario)
                .WithMany(t => t.Rotas)
                .HasForeignKey(d => d.IdUsuario);

        }
    }
}

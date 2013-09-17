using System.ComponentModel.DataAnnotations;
using System.Data.Entity.ModelConfiguration;
using Fusioness.Entities;

namespace Fusioness.Data.Mapping
{
    public class DificuldadeMap : EntityTypeConfiguration<Dificuldade>
    {
        public DificuldadeMap()
        {
            // Primary Key
            this.HasKey(t => t.IdDificuldade);

            // Properties
            this.Property(t => t.Descricao)
                .IsRequired()
                .HasMaxLength(50);

            // Table & Column Mappings
            this.ToTable("Dificuldade");
            this.Property(t => t.IdDificuldade).HasColumnName("IdDificuldade");
            this.Property(t => t.Descricao).HasColumnName("Descricao");
        }
    }
}

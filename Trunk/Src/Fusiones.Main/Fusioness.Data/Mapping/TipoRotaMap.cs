using System.Data.Entity.ModelConfiguration;
using Fusioness.Entities;

namespace Fusioness.Data.Mapping
{
    public class TipoRotaMap : EntityTypeConfiguration<TipoRota>
    {
        public TipoRotaMap()
        {
            // Primary Key
            this.HasKey(t => t.IdTipoRota);

            // Properties
            this.Property(t => t.Descricao)
                .IsRequired()
                .HasMaxLength(200);

            // Table & Column Mappings
            this.ToTable("TipoRota");
            this.Property(t => t.IdTipoRota).HasColumnName("IdTipoRota");
            this.Property(t => t.Descricao).HasColumnName("Descricao");
        }
    }
}

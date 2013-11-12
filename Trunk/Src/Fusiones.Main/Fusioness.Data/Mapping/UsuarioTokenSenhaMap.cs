using System;
using System.Collections.Generic;
using System.Data.Entity.ModelConfiguration;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Fusioness.Entities;

namespace Fusioness.Data.Mapping
{
    public class UsuarioTokenSenhaMap : EntityTypeConfiguration<UsuarioTokenSenha>
    {
        public UsuarioTokenSenhaMap()
        {
            // Primary Key
            this.HasKey(t => t.ID);

            // Properties
            this.Property(t => t.Token)
                .IsRequired()
                .HasMaxLength(255);
            this.Property(t => t.DataDeGeracao)
                .IsRequired();
            this.Property(t => t.UsuarioID)
                .IsRequired();
            this.Property(t => t.JaUsado)
                .IsRequired();

            // Table & Column Mappings
            this.ToTable("UsuarioTokenSenha");
            this.Property(t => t.ID).HasColumnName("ID");
            this.Property(t => t.Token).HasColumnName("Token");
            this.Property(t => t.DataDeGeracao).HasColumnName("DataDeGeracao");
            this.Property(t => t.UsuarioID).HasColumnName("UsuarioID");
            this.Property(t => t.JaUsado).HasColumnName("JaUsado");
        }
    }
}

using System.ComponentModel.DataAnnotations;
using System.Data.Entity.ModelConfiguration;
using Fusioness.Entities;

namespace Fusioness.Data.Mapping
{
    public class UsuarioMap : EntityTypeConfiguration<Usuario>
    {
        public UsuarioMap()
        {
            // Primary Key
            this.HasKey(t => t.IdUsuario);

            // Properties
            this.Property(t => t.Nome)
                .IsRequired()
                .HasMaxLength(250);

            this.Property(t => t.Login)
                .IsRequired()
                .HasMaxLength(100);

            this.Property(t => t.Senha)
                .IsRequired()
                .HasMaxLength(16);

            this.Property(t => t.Email)
                .IsRequired()
                .HasMaxLength(200);

            this.Property(t => t.Sexo)
                .IsFixedLength()
                .HasMaxLength(1);

            this.Property(t => t.UrlImagem)
                .HasMaxLength(2455);

            // Table & Column Mappings
            this.ToTable("Usuario");
            this.Property(t => t.IdUsuario).HasColumnName("IdUsuario");
            this.Property(t => t.Nome).HasColumnName("Nome");
            this.Property(t => t.Login).HasColumnName("Login");
            this.Property(t => t.Senha).HasColumnName("Senha");
            this.Property(t => t.Email).HasColumnName("Email");
            //this.Property(t => t.Idade).HasColumnName("Idade");
            this.Property(t => t.DataDeNascimento).HasColumnName("DataDeNascimento");
            this.Property(t => t.Sexo).HasColumnName("Sexo");
            this.Property(t => t.UrlImagem).HasColumnName("UrlImagem");
        }
    }
}

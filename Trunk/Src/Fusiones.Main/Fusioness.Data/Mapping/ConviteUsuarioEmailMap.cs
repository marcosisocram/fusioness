using System.ComponentModel.DataAnnotations;
using System.Data.Entity.ModelConfiguration;
using Fusioness.Entities;

namespace Fusioness.Data.Mapping
{
    public class ConviteUsuarioEmailMap : EntityTypeConfiguration<ConviteUsuarioEmail>
    {
        public ConviteUsuarioEmailMap()
        {
            // Primary Key
            this.HasKey(t => t.ID);

            // Properties
            this.Property(t => t.IdUsuarioConvidou)
                .IsRequired();
            
            this.Property(t => t.EmailConvidado)
                .IsRequired()
                .HasMaxLength(255);

            this.Property(t => t.IdUsuarioConvidou)
                .IsRequired();

            // Table & Column Mappings
            this.ToTable("ConviteUsuarioEmail");
            this.Property(t => t.ID).HasColumnName("ID");
            this.Property(t => t.IdUsuarioConvidou).HasColumnName("IdUsuarioConvidou");
            this.Property(t => t.EmailConvidado).HasColumnName("EmailConvidado");
            this.Property(t => t.DataDoConvite).HasColumnName("DataDoConvite");

        }
    }
}

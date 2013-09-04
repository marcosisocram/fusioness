using System.Data.Entity.ModelConfiguration;
using Fusioness.Entities;

namespace Fusioness.Data.Mapping
{
    public class UserMapping : EntityTypeConfiguration<User>
    {
        public UserMapping()
        {
            // Primary Key
            HasKey(u => u.Id);

            // Properties
            Property(u => u.Name)
                .IsRequired()
                .HasMaxLength(20);

            Property(u => u.Surname)
                .IsRequired()
                .HasMaxLength(20);

            // Table & Column Mappings
            ToTable("User");
            Property(u => u.Name).HasColumnName("Name");
            Property(u => u.Surname).HasColumnName("Surname");
        }
    }
}

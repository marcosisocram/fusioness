using System.Data.Entity;
using Fusioness.Data.Mapping;
using Fusioness.Entities;

namespace Fusioness.Data
{
    public class FusionessContext : DbContext
    {
        #region Properties
        public DbSet<User> Users { get; set; }
        #endregion

        #region Constructor
        public FusionessContext() : base("name=ConnectionString") { }
        public FusionessContext(string connectionString) : base(connectionString) { }
        #endregion
        
        #region Methods
        #region Public

        #endregion
        
        #region Private
        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            modelBuilder.Configurations.Add(new UserMapping());

            base.OnModelCreating(modelBuilder);
        }
        #endregion
        #endregion
    }
}

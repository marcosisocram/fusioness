using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Fusioness.Data;
using Fusioness.Data.Contracts;
using Fusioness.Data.Repositories;
using Fusioness.Entities;
using Fusioness.Business.Util;

namespace Fusioness.Business.Usuarios
{
    public class UsuariosBusiness
    {
        #region Properties
        private string _ConnectionString;
        #endregion
        
        #region Constructor
        public UsuariosBusiness()
        {
            _ConnectionString = ConnectionBuilder.GetConnection();
        }
        public UsuariosBusiness(string connectionString)
        {
            _ConnectionString = connectionString;
        }
        #endregion
        
        #region Methods
        #region Public
        public void DoSomething(Usuario usuario)
        {
            using (IUnityOfWork uow = new EFUnityOfWork(_ConnectionString))
            {
                IRepository<Usuario> repo = new UsuarioRepository(uow);
                //... IRepository<Type> repo2 = new TypeRepository(uow); //the same IUnityOfWork
                repo.Insert(usuario);
                //...
                uow.Commit();
            }
        }
        #endregion
        
        #region Private

        #endregion
        #endregion
    }
}

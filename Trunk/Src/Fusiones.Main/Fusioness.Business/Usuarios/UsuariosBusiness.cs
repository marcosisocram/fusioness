using System;
using Fusioness.Business.Util;
using Fusioness.Data;
using Fusioness.Data.Contracts;
using Fusioness.Data.Repositories;
using Fusioness.Entities;

namespace Fusioness.Business.Usuarios
{
    public class UsuariosBusiness : IUsuarioBusiness
    {
        #region Properties

        private readonly string _ConnectionString;

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

        public Usuario ObterUsuarioPorId(int id)
        {
            using (IUnityOfWork ouw = new EFUnityOfWork(_ConnectionString))
            {
                return new UsuarioRepository(ouw).GetByKey(new Usuario { IdUsuario = id });
            }
        }

        #endregion

        #region Private

        #endregion

        #endregion
    }
}
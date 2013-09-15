using System;
using System.Collections.Generic;
using System.Linq;
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

        public void InsertUsuario(Usuario usuario)
        {
            try
            {
                using (IUnityOfWork uow = new EFUnityOfWork(_ConnectionString))
                {
                    IRepository<Usuario> repo = new UsuarioRepository(uow);
                    repo.Insert(usuario);
                    uow.Commit();
                }
            }
            catch (Exception ex)
            {
                //TODO: CREATE LOG
                throw;
            }
        }

        public List<Usuario> CarregarContatos(int idUsuario)
        {
            try
            {
                using (IUnityOfWork uow = new EFUnityOfWork(_ConnectionString))
                {
                    IRepository<Usuario> repo = new UsuarioRepository(uow);
                    repo.GetWhere(c => c.IdUsuario != idUsuario);
                    return repo.GetAll().ToList();
                    //uow.Commit();
                }
            }
            catch (Exception ex)
            {
                //TODO: CREATE LOG
                throw;
            }
        }
        
        public void AdicionarUsuarioARede(Contato contato)
        {
            try
            {
                using (IUnityOfWork uow = new EFUnityOfWork(_ConnectionString))
                {
                    IRepository<Contato> repo = new ContatoRepository(uow);
                    repo.Insert(contato);
                    uow.Commit();
                }
            }
            catch (Exception ex)
            {
                //TODO: CREATE LOG
                throw;
            }
        }

        public void QualificarRota(int IdRota, int IdTipoRota, int IdUsuario)
        {
        }
        #endregion

        #region Private

        #endregion

        #endregion
    }
}
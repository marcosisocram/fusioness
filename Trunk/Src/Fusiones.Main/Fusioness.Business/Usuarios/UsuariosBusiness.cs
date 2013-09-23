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

        public Usuario ValidarLogonUsuario(Usuario usuario)
        {
            if (usuario == null || string.IsNullOrWhiteSpace(usuario.Login) || string.IsNullOrWhiteSpace(usuario.Senha)) return null;

            using (IUnityOfWork ouw = new EFUnityOfWork(_ConnectionString))
            {
                var retorno = new UsuarioRepository(ouw).GetWhere(u => u.Senha == usuario.Senha && u.Login == usuario.Login).FirstOrDefault();
                return retorno;
            }
        }

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


        public Usuario InsertUsuario(Usuario usuario)
        {
            try
            {
                using (IUnityOfWork uow = new EFUnityOfWork(_ConnectionString))
                {
                    IRepository<Usuario> repo = new UsuarioRepository(uow);
                    usuario = repo.Insert(usuario);
                    uow.Commit();
                }
                return usuario;
            }
            catch (Exception)
            {
                return default(Usuario);
            }
        }

        public Usuario UpdateUsuario(Usuario usuario) 
        {
            try
            {
                using(IUnityOfWork uow = new EFUnityOfWork(_ConnectionString))
                {
                    IRepository<Usuario> repo = new UsuarioRepository(uow);
                    usuario = repo.Update(usuario);
                    uow.Commit();
                }
                return usuario;
            }
            catch (Exception)
            {
                return default(Usuario);
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
                }
            }
            catch (Exception)
            {
                return new List<Usuario>();
            }
        }

        public Contato AdicionarUsuarioARede(Contato contato)
        {
            try
            {
                using (IUnityOfWork uow = new EFUnityOfWork(_ConnectionString))
                {
                    IRepository<Contato> repo = new ContatoRepository(uow);
                    contato = repo.Insert(contato);
                    uow.Commit();
                }
                return contato;
            }
            catch (Exception)
            {
                return default(Contato);
            }
        }

        #endregion

        #region Private

        #endregion

        #endregion
    }
}
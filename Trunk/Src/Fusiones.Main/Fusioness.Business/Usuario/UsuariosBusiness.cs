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
        
        public Usuario InserirUsuario(Usuario usuario)
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

        public Usuario AlterarUsuario(Usuario usuario)
        {
            try
            {
                using (IUnityOfWork uow = new EFUnityOfWork(_ConnectionString))
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

        public void RemoverUsuario(Usuario usuario)
        {
            try
            {
                using (IUnityOfWork uow = new EFUnityOfWork(_ConnectionString))
                {
                    IRepository<Usuario> repo = new UsuarioRepository(uow);
                    repo.Delete(usuario);
                    uow.Commit();
                }
            }
            catch (Exception)
            {
                throw;
            }
        }
        public Usuario ObterUsuarioPorId(Usuario usuario)
        {
            using (IUnityOfWork uow = new EFUnityOfWork(_ConnectionString))
            {
                return new UsuarioRepository(uow).GetByKey(new Usuario { IdUsuario = usuario.IdUsuario });
            }
        }
        public List<Usuario> ListarUsuarios()
        {
            try
            {
                using (IUnityOfWork uow = new EFUnityOfWork(_ConnectionString))
                {
                    IRepository<Usuario> repo = new UsuarioRepository(uow);
                    return repo.GetAll().ToList();
                }
            }
            catch (Exception)
            {
                throw;
            }
        }
        public Usuario ValidarLogonUsuario(Usuario usuario)
        {
            if (usuario == null || string.IsNullOrWhiteSpace(usuario.Login) || string.IsNullOrWhiteSpace(usuario.Senha)) return null;

            using (IUnityOfWork ouw = new EFUnityOfWork(_ConnectionString))
            {
                var retorno = new UsuarioRepository(ouw).GetWhere(u => u.Senha == usuario.Senha && u.Login == usuario.Login).FirstOrDefault();
                return retorno;
            }
        }

        #region Contato
        public Contato InserirContato(Contato contato)
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
        public List<Usuario> ListarContatosPorUsuario(Usuario usuario)
        {
            try
            {
                using (IUnityOfWork uow = new EFUnityOfWork(_ConnectionString))
                {
                    IRepository<Usuario> repo = new UsuarioRepository(uow);
                    repo.GetWhere(c => c.IdUsuario != usuario.IdUsuario);
                    return repo.GetAll().ToList();
                }
            }
            catch (Exception)
            {
                return new List<Usuario>();
            }
        }

        #endregion

        #endregion
        public void DoSomething(Usuario usuario)
        {
            using (IUnityOfWork uow = new EFUnityOfWork(_ConnectionString))
            {
                IRepository<Usuario> repo = new UsuarioRepository(uow);
                repo.Insert(usuario);
                uow.Commit();
            }
        }
    }
}
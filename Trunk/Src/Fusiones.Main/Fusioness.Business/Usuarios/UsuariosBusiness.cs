using System;
using System.Collections.Generic;
using System.IO;
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
            using (IUnityOfWork uow = new EFUnityOfWork(_ConnectionString))
            {
                IRepository<Usuario> repo = new UsuarioRepository(uow);
                repo.Delete(usuario);
                uow.Commit();
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
            using (IUnityOfWork uow = new EFUnityOfWork(_ConnectionString))
            {
                IRepository<Usuario> repo = new UsuarioRepository(uow);
                return repo.GetAll().ToList();
            }
        }

        public Usuario ValidarLogonUsuario(Usuario usuario)
        {
            if (usuario == null || string.IsNullOrWhiteSpace(usuario.Login) || string.IsNullOrWhiteSpace(usuario.Senha)) return null;

            using (IUnityOfWork ouw = new EFUnityOfWork(_ConnectionString))
            {
                return new UsuarioRepository(ouw).GetWhere(u => u.Senha == usuario.Senha && u.Login == usuario.Login).FirstOrDefault();
            }
        }

        public string InserirFotoUsuario(Usuario usuario, byte[] bytes, string filename, string dirbase)
        {
            try
            {
                string retorno = string.Empty;
                var directory = Path.Combine(dirbase, "images");
                var fname = String.Format("{0}/{1}{2}", directory, Path.GetFileNameWithoutExtension(Path.GetTempFileName()), Path.GetExtension(filename));
                if (!Directory.Exists(directory))
                {
                    Directory.CreateDirectory(directory);
                }
                var fs = File.OpenWrite(fname);
                fs.Write(bytes, 0, bytes.Count());
                fs.Close();
                retorno = Path.GetFileName(fname);
                usuario.UrlImagem = retorno;
                usuario = AlterarUsuario(usuario);
                return retorno;
            }
            catch (Exception)
            {
                return string.Empty;
            }
            
        }

        public List<Usuario> ObterUsuariosIds(List<int> idsUsuario)
        {
            if (idsUsuario == null || !idsUsuario.Any()) return new List<Usuario>();

            using (IUnityOfWork uow = new EFUnityOfWork(_ConnectionString))
            {
                return new UsuarioRepository(uow).GetWhere(u => idsUsuario.Any(id => id == u.IdUsuario)).ToList();
            }
        }

        public List<Usuario> ListarUsuariosPorNome(string nome, int idUsuario)
        {
            if (String.IsNullOrEmpty(nome)) return new List<Usuario>();

            using (IUnityOfWork uow = new EFUnityOfWork(_ConnectionString))
            {
                return new UsuarioRepository(uow).GetWhere(u => u.Nome.Contains(nome) && u.IdUsuario != idUsuario).ToList();
            }
        }

        public Usuario ListarUsuariosPorEmail(string email)
        {
            using (IUnityOfWork uow = new EFUnityOfWork(_ConnectionString))
            {
                return new UsuarioRepository(uow).GetWhere(u=>u.Email.Equals(email,StringComparison.InvariantCultureIgnoreCase)).FirstOrDefault();
            }
        }
        #endregion
    }
}
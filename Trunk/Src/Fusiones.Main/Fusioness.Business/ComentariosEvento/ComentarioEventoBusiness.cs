using System;
using System.Collections.Generic;
using System.Linq;
using Fusioness.Business.Util;
using Fusioness.Data;
using Fusioness.Data.Contracts;
using Fusioness.Data.Repositories;
using Fusioness.Entities;

namespace Fusioness.Business.ComentariosEvento
{
    public class ComentarioEventoBusiness : IComentarioEventoBusiness
    {
        #region Properties

        private readonly string _ConnectionString;

        #endregion

        #region Constructor

        public ComentarioEventoBusiness()
        {
            _ConnectionString = ConnectionBuilder.GetConnection();
        }

        public ComentarioEventoBusiness(string connectionString)
        {
            _ConnectionString = connectionString;
        }

        #endregion

        #region Methods

        public ComentarioEvento InserirComentarioEvento(ComentarioEvento comentario)
        {
            try
            {
                using (IUnityOfWork uow = new EFUnityOfWork(_ConnectionString))
                {
                    IRepository<ComentarioEvento> repo = new ComentarioEventoRepository(uow);                    
                    comentario = repo.Insert(comentario);
                    uow.Commit();
                }
                return comentario;
            }
            catch (Exception)
            {
                throw;
            }
        }

        public ComentarioEvento AlterarComentarioEvento(ComentarioEvento comentario)
        {
            try
            {
                using (IUnityOfWork uow = new EFUnityOfWork(_ConnectionString))
                {
                    IRepository<ComentarioEvento> repo = new ComentarioEventoRepository(uow);
                    comentario = repo.Update(comentario);
                    uow.Commit();
                }
                return comentario;
            }
            catch (Exception)
            {
                return default(ComentarioEvento);
            }
        }

        public void RemoverComentarioEvento(ComentarioEvento comentario)
        {
            try
            {
                using (IUnityOfWork uow = new EFUnityOfWork(_ConnectionString))
                {
                    IRepository<ComentarioEvento> repo = new ComentarioEventoRepository(uow);
                    repo.Delete(comentario);
                    uow.Commit();
                }
            }
            catch (Exception)
            {
                throw;
            }
        }

        public ComentarioEvento ObterComentarioEventoPorId(ComentarioEvento comentario)
        {
            using (IUnityOfWork uow = new EFUnityOfWork(_ConnectionString))
            {
                return new ComentarioEventoRepository(uow).GetByKey(new ComentarioEvento { IdComentarioEvento = comentario.IdComentarioEvento});
            }
        }

        public List<ComentarioEvento> ListarComentariosPorEvento(Evento evento)
        {
            try
            {
                using (IUnityOfWork uow = new EFUnityOfWork(_ConnectionString))
                {
                    IRepository<ComentarioEvento> repo = new ComentarioEventoRepository(uow);
                    IQueryable<ComentarioEvento> comentarios = repo.GetWhere(c => c.IdEvento == evento.IdEvento);
                    
                    preencherUsuarioComentario(comentarios);

                    return comentarios.ToList();
                }
            }
            catch (Exception)
            {
                throw;
            }
        }

        private void preencherUsuarioComentario(IQueryable<ComentarioEvento> listaComentarios)
        {
            using (IUnityOfWork uow = new EFUnityOfWork(_ConnectionString))
            {
                IRepository<Usuario> repo = new UsuarioRepository(uow);

                foreach (var comentario in listaComentarios)
                {
                    comentario.Usuario = repo.GetByKey(new Usuario { IdUsuario = comentario.IdUsuario });
                }
            }
        }

        public List<ComentarioEvento> ListarComentariosPorUsuario(Usuario usuario)
        {
            try
            {
                using (IUnityOfWork uow = new EFUnityOfWork(_ConnectionString))
                {
                    IRepository<ComentarioEvento> repo = new ComentarioEventoRepository(uow);
                    var comentarios = repo.GetWhere(c => c.IdUsuario == usuario.IdUsuario);
                    return comentarios.ToList();
                }
            }
            catch (Exception)
            {
                throw;
            }
        }
        #endregion
    }
}

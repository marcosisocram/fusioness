using System;
using System.Collections.Generic;
using System.Linq;
using Fusioness.Business.Util;
using Fusioness.Data;
using Fusioness.Data.Contracts;
using Fusioness.Data.Repositories;
using Fusioness.Entities;
using Fusioness.Business.Usuarios;

namespace Fusioness.Business.EventosUsuarios
{
    public class EventoUsuarioBusiness : IEventoUsuarioBusiness
    {
        #region Properties

        private readonly string _ConnectionString;

        #endregion

        #region Constructor

        public EventoUsuarioBusiness()
        {
            _ConnectionString = ConnectionBuilder.GetConnection();
        }

        public EventoUsuarioBusiness(string connectionString)
        {
            _ConnectionString = connectionString;
        }

        #endregion

        #region Methods

        public EventoUsuario InserirEventoUsuario(EventoUsuario eventoUsuario)
        {
            try
            {
                using (IUnityOfWork uow = new EFUnityOfWork(_ConnectionString))
                {
                    IRepository<EventoUsuario> repo = new EventoUsuarioRepository(uow);                    
                    eventoUsuario = repo.Insert(eventoUsuario);
                    uow.Commit();
                }
                return eventoUsuario;
            }
            catch (Exception)
            {
                throw;
            }
        }

        public EventoUsuario AlterarEventoUsuario(EventoUsuario eventoUsuario)
        {
            try
            {
                using (IUnityOfWork uow = new EFUnityOfWork(_ConnectionString))
                {
                    IRepository<EventoUsuario> repo = new EventoUsuarioRepository(uow);
                    eventoUsuario = repo.Update(eventoUsuario);
                    uow.Commit();
                }
                return eventoUsuario;
            }
            catch (Exception)
            {
                return default(EventoUsuario);
            }
        }

        public void RemoverEventoUsuario(EventoUsuario eventoUsuario)
        {
            try
            {
                using (IUnityOfWork uow = new EFUnityOfWork(_ConnectionString))
                {
                    IRepository<EventoUsuario> repo = new EventoUsuarioRepository(uow);
                    repo.Delete(eventoUsuario);
                    uow.Commit();
                }
            }
            catch (Exception)
            {
                throw;
            }
        }

        public List<EventoUsuario> ListarUsuariosEvento(Evento evento)
        {
            try
            {
                using (IUnityOfWork uow = new EFUnityOfWork(_ConnectionString))
                {
                    IRepository<EventoUsuario> repo = new EventoUsuarioRepository(uow);
                    var usuariosEvento = repo.GetWhere(c => c.IdEvento == evento.IdEvento);

                    List<int> idsUsuarios = usuariosEvento.Select(m => m.IdUsuario).ToList();
                    UsuariosBusiness usuarioBusiness = new UsuariosBusiness();                    
                    List<Usuario> usuariosEventos = usuarioBusiness.ObterUsuariosIds(idsUsuarios);

                    foreach (var item in usuariosEvento)
                    {
                        item.Usuario = usuariosEventos.Where(c => c.IdUsuario == item.IdUsuario).FirstOrDefault();
                    }
                    return usuariosEvento.ToList();
                }
            }
            catch (Exception)
            {
                throw;
            }
        }

        public List<EventoUsuario> ListarEventoUsuario(Usuario usuario)
        {
            try
            {
                using (IUnityOfWork uow = new EFUnityOfWork(_ConnectionString))
                {
                    IRepository<EventoUsuario> repo = new EventoUsuarioRepository(uow);
                    var eventosUsuario = repo.GetWhere(c => c.IdUsuario == usuario.IdUsuario);
                    return eventosUsuario.ToList();
                }
            }
            catch (Exception)
            {
                throw;
            }
        }

        public EventoUsuario ObterEventoUsuario(Evento evento, Usuario usuario)
        {
            try
            {
                using (IUnityOfWork uow = new EFUnityOfWork(_ConnectionString))
                {
                    IRepository<EventoUsuario> repo = new EventoUsuarioRepository(uow);
                    var eventoUsuario = repo.GetWhere(c => c.IdUsuario == usuario.IdUsuario && c.IdEvento == evento.IdEvento).FirstOrDefault();
                    return eventoUsuario;
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

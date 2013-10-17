using System;
using System.Collections.Generic;
using Fusioness.Business.Util;
using System.Linq;
using Fusioness.Data;
using Fusioness.Data.Contracts;
using Fusioness.Data.Repositories;
using Fusioness.Entities;

namespace Fusioness.Business.Eventos
{
    public class EventoBusiness : IEventoBusiness
    {
        #region Properties

        private readonly string _ConnectionString;

        #endregion

        #region Constructor

        public EventoBusiness()
        {
            _ConnectionString = ConnectionBuilder.GetConnection();
        }

        public EventoBusiness(string connectionString)
        {
            _ConnectionString = connectionString;
        }

        #endregion

        #region Methods

        public Evento InserirEvento(Evento evento)
        {
            try
            {
                using (IUnityOfWork uow = new EFUnityOfWork(_ConnectionString))
                {
                    IRepository<Evento> repo = new EventoRepository(uow);
                    evento = repo.Insert(evento);
                    uow.Commit();
                }
                return evento;
            }
            catch (Exception)
            {
                return default(Evento);
            }
        }
        public Evento AlterarEvento(Evento evento)
        {
            try
            {
                using (IUnityOfWork uow = new EFUnityOfWork(_ConnectionString))
                {
                    IRepository<Evento> repo = new EventoRepository(uow);
                    evento = repo.Update(evento);
                    uow.Commit();
                }
                return evento;
            }
            catch (Exception)
            {
                return default(Evento);
            }
        }
        public void RemoverEvento(Evento evento)
        {
            try
            {
                using (IUnityOfWork uow = new EFUnityOfWork(_ConnectionString))
                {
                    IRepository<Evento> repo = new EventoRepository(uow);
                    repo.Delete(evento);
                    uow.Commit();
                }
            }
            catch (Exception)
            {
                throw;
            }
        }

        public Evento ObterEventoPorId(Evento evento)
        {
            using (IUnityOfWork ouw = new EFUnityOfWork(_ConnectionString))
            {
                return new EventoRepository(ouw).GetByKey(new Evento { IdEvento = evento.IdEvento });
            }
        }
        public List<Evento> ListarEventos(params int[] ids)
        {
            using (IUnityOfWork uow = new EFUnityOfWork(_ConnectionString))
            {
                if (ids.Any()) return new EventoRepository(uow).GetWhere(e => ids.Any(id => id == e.IdEvento)).ToList();
                return new EventoRepository(uow).GetAll().ToList();
            }
        }

        public List<Evento> ListarEventosPorUsuario(Usuario usuaio)
        {
            using (IUnityOfWork uow = new EFUnityOfWork(_ConnectionString))
            {
                IRepository<Evento> repo = new EventoRepository(uow);
                var evento = repo.GetAll();
                return evento.ToList();
            }
        }

        #endregion
    }
}

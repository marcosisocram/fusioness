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

        #region Public

        public Evento InsertEvento(Evento evento)
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
        public List<Evento> CarregarEventos()
        {
            using (IUnityOfWork uow = new EFUnityOfWork(_ConnectionString))
            {
                IRepository<Evento> repo = new EventoRepository(uow);
                var evento = repo.GetAll();
                return evento.ToList();
            }
        }

        public Evento ObterEventoPorId(int id)
        {
            using (IUnityOfWork ouw = new EFUnityOfWork(_ConnectionString))
            {
                return new EventoRepository(ouw).GetByKey(new Evento { IdEvento = id });
            }
        }

        #endregion

        #endregion
    }
}

using System;
using System.Collections.Generic;
using System.Text;
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

        public string CarregarEventos()
        {
            using (IUnityOfWork uow = new EFUnityOfWork(_ConnectionString))
            {
                IRepository<Evento> repo = new EventoRepository(uow);
                var evento = repo.GetAll();
                StringBuilder sb = new StringBuilder();
                evento.ToList().ForEach(c =>
                {
                    sb.AppendFormat("{0}:{1}.", c.IdEvento, c.IdEvento);
                });
                return sb.ToString();
            }
        }
        #endregion

        #endregion
    }
}

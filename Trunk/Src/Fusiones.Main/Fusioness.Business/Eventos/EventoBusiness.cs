﻿using System;
using System.Collections.Generic;
using Fusioness.Business.Util;
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

        public List<Evento> CarregarEventos()
        {
            using (IUnityOfWork uow = new EFUnityOfWork(_ConnectionString))
            {
                IRepository<Evento> repo = new EventoRepository(uow);
                //... IRepository<Type> repo2 = new TypeRepository(uow); //the same IUnityOfWork
                //return repo.GetAll().ToList();
                return new List<Evento>();

                //...
                //uow.Commit();
            }
        }
        #endregion

        #endregion
    }
}

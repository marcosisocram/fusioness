﻿using System;
using System.Collections.Generic;
using Fusioness.Business.Util;
using Fusioness.Data;
using Fusioness.Data.Contracts;
using Fusioness.Data.Repositories;
using Fusioness.Entities;

namespace Fusioness.Business.Rotas
{
    public class RotaBusiness : IRotaBusiness
    {
        #region Properties

        private readonly string _ConnectionString;

        #endregion

        #region Constructor

        public RotaBusiness()
        {
            _ConnectionString = ConnectionBuilder.GetConnection();
        }

        public RotaBusiness(string connectionString)
        {
            _ConnectionString = connectionString;
        }

        #endregion

        #region Methods

        #region Public
        /// <summary>
        /// DFD - Método que insere uma rota no banco de dados.
        /// </summary>
        /// <param name="rota"></param>
        public void InsertRota(Rota rota)
        {
            try
            {
                using (IUnityOfWork uow = new EFUnityOfWork(_ConnectionString))
                {
                    IRepository<Rota> repo = new RotaRepository(uow);
                    repo.Insert(rota);
                    uow.Commit();
                }
            }
            catch (Exception ex)
            {
                //TODO: CREATE LOG
                throw;
            }
        }

        public List<Rota> CarregarRotas()
        {
            using (IUnityOfWork uow = new EFUnityOfWork(_ConnectionString))
            {
                IRepository<Rota> repo = new RotaRepository(uow);
                //... IRepository<Type> repo2 = new TypeRepository(uow); //the same IUnityOfWork
                //return repo.GetAll().ToList();
                return new List<Rota>();
                
            }
        }

        #endregion

        #region Private

        #endregion

        #endregion
    }
}
﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
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

        public string CarregarRotas()
        {
            using (IUnityOfWork uow = new EFUnityOfWork(_ConnectionString))
            {
                IRepository<Rota> repo = new RotaRepository(uow);
                var rotas = repo.GetAll();
                StringBuilder sb = new StringBuilder();
                rotas.ToList().ForEach(c =>
                {
                    sb.AppendFormat("{0}:{1}.", c.IdRota, c.IdRota);
                });
                return sb.ToString();
            }
        }

        public void QualificarRota(int IdRota, int IdTipoRota, int IdUsuario)
        {
            using (IUnityOfWork uow = new EFUnityOfWork(_ConnectionString))
            {
                IRepository<Rota> repo = new RotaRepository(uow);
                var rota = repo.GetWhere(c => c.IdRota == IdRota && c.IdUsuario == IdUsuario).FirstOrDefault();
                if (rota == null)
                {
                    throw new Exception("rota inexistente");
                }
                rota.IdTipoRota = IdTipoRota;
                repo.Update(rota);
                uow.Commit();
            }
        }

        public string GetRotas(int IdUsuario)
        {
            using (IUnityOfWork uow = new EFUnityOfWork(_ConnectionString))
            {
                IRepository<Rota> repo = new RotaRepository(uow);
                var rotas = repo.GetWhere(c => c.IdUsuario == IdUsuario);
                StringBuilder sb = new StringBuilder();
                rotas.ToList().ForEach(c =>
                    {
                        sb.AppendFormat("{0}:{1}.", c.IdRota, c.IdRota);
                    });
                return sb.ToString();
            }

        #endregion

            #region Private

            #endregion

        #endregion
        }
    }
}
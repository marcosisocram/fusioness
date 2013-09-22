using System;
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

        public
            List<Rota> CarregarRotas()
        {
            using (IUnityOfWork uow = new EFUnityOfWork(_ConnectionString))
            {
                IRepository<Rota> repo = new RotaRepository(uow);
                var rotas = repo.GetAll();
                return rotas.ToList();
            }
        }

        public List<Rota> CarregarRotasPorUsuario(int IdUsuario)
        {
            using (IUnityOfWork uow = new EFUnityOfWork(_ConnectionString))
            {
                IRepository<Rota> repo = new RotaRepository(uow);
                var rotas = repo.GetWhere(c => c.IdUsuario == IdUsuario);
                return rotas.ToList();
            }

        #endregion

            #region Private

            #endregion

        #endregion
        }
    }
}
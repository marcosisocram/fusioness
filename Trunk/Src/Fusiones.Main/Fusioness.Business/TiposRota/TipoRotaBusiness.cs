using System;
using System.Collections.Generic;
using System.Linq;
using Fusioness.Business.Util;
using Fusioness.Data;
using Fusioness.Data.Contracts;
using Fusioness.Data.Repositories;
using Fusioness.Entities;

namespace Fusioness.Business.TiposRota
{
    class TipoRotaBusiness : ITipoRotaBusiness
    {
        #region Properties

        private readonly string _ConnectionString;

        #endregion

        #region Constructor

        public TipoRotaBusiness()
        {
            _ConnectionString = ConnectionBuilder.GetConnection();
        }

        public TipoRotaBusiness(string connectionString)
        {
            _ConnectionString = connectionString;
        }

        #endregion

        #region Methods

        #region Public

        public List<TipoRota> ListarTipoRotas()
        {
            try
            {
                using (IUnityOfWork uow = new EFUnityOfWork(_ConnectionString))
                {
                    IRepository<TipoRota> repo = new TipoRotaRepository(uow);
                    var tiposRota = repo.GetAll().ToList();
                    return tiposRota;
                }
            }
            catch (Exception)
            {
                return new List<TipoRota>();
            }
        }

        #endregion

        #region Private

        #endregion

        #endregion
    }
}

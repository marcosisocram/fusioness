using System;
using System.Collections.Generic;
using System.Linq;
using Fusioness.Business.Util;
using Fusioness.Data;
using Fusioness.Data.Contracts;
using Fusioness.Data.Repositories;
using Fusioness.Entities;

namespace Fusioness.Business.TiposPista
{
    class TipoPistaBusiness : ITipoPistaBusiness
    {
        #region Properties

        private readonly string _ConnectionString;

        #endregion

        #region Constructor

        public TipoPistaBusiness()
        {
            _ConnectionString = ConnectionBuilder.GetConnection();
        }

        public TipoPistaBusiness(string connectionString)
        {
            _ConnectionString = connectionString;
        }

        #endregion

        #region Methods

        public List<TipoPista> ListarTiposPista()
        {
            try
            {
                using (IUnityOfWork uow = new EFUnityOfWork(_ConnectionString))
                {
                    IRepository<TipoPista> repo = new TipoPistaRepository(uow);
                    var tiposPista = repo.GetAll().ToList();
                    return tiposPista;
                }
            }
            catch (Exception)
            {
                return new List<TipoPista>();
            }
        }

        #endregion
    }
}

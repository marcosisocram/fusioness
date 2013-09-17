using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
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

        public string GetTipoRotas()
        {
            try
            {
                using (IUnityOfWork uow = new EFUnityOfWork(_ConnectionString))
                {
                    IRepository<TipoRota> repo = new TipoRotaRepository(uow);
                    var tiposRota = repo.GetAll();
                    StringBuilder sb = new StringBuilder();
                    tiposRota.ToList().ForEach(c =>
                    {
                        sb.AppendFormat("{0}:{1}.", c.IdTipoRota, c.Descricao);
                    });
                    return sb.ToString();
                }
            }
            catch (Exception ex)
            {
                //TODO: CREATE LOG
                throw;
            }
        }

        #endregion

        #region Private

        #endregion

        #endregion
    }
}

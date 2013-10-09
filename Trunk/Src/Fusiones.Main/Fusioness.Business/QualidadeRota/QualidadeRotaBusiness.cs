using System;
using System.Collections.Generic;
using System.Linq;
using Fusioness.Business.Util;
using Fusioness.Data;
using Fusioness.Data.Contracts;
using Fusioness.Data.Repositories;
using Fusioness.Entities;

namespace Fusioness.Business.QualidadesRota
{
    public class QualidadeRotaBusiness : IQualidadeRotaBusiness
    {
        #region Properties

        private readonly string _ConnectionString;

        #endregion

        #region Constructor

        public QualidadeRotaBusiness()
        {
            _ConnectionString = ConnectionBuilder.GetConnection();
        }

        public QualidadeRotaBusiness(string connectionString)
        {
            _ConnectionString = connectionString;
        }

        #endregion

        #region Methods

        #region Public

        public List<QualidadeRota> ListarQualidadesRota()
        {
            try
            {
                using (IUnityOfWork uow = new EFUnityOfWork(_ConnectionString))
                {
                    IRepository<QualidadeRota> repo = new QualidadeRotaRepository(uow);
                    var qualidadesRota = repo.GetAll().ToList();
                    return qualidadesRota;
                }
            }
            catch (Exception)
            {
                return new List<QualidadeRota>();
            }
        }

        #endregion

        #region Private

        #endregion

        #endregion
    }
}

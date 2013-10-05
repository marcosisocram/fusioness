using System;
using System.Collections.Generic;
using System.Linq;
using Fusioness.Business.Util;
using Fusioness.Data;
using Fusioness.Data.Contracts;
using Fusioness.Data.Repositories;
using Fusioness.Entities;

namespace Fusioness.Business.Dificuldades
{
    class DificuldadeBusiness : IDificuldadeBusiness
    {
        #region Properties

        private readonly string _ConnectionString;

        #endregion

        #region Constructor

        public DificuldadeBusiness()
        {
            _ConnectionString = ConnectionBuilder.GetConnection();
        }

        public DificuldadeBusiness(string connectionString)
        {
            _ConnectionString = connectionString;
        }

        #endregion

        #region Methods

        public List<Dificuldade> ListarDificuldades()
        {
            try
            {
                using (IUnityOfWork uow = new EFUnityOfWork(_ConnectionString))
                {
                    IRepository<Dificuldade> repo = new DificuldadeRepository(uow);
                    var dificuldades = repo.GetAll().ToList();
                    return dificuldades;
                }
            }
            catch (Exception)
            {
                return new List<Dificuldade>();
            }
        }

        #endregion
    }
}

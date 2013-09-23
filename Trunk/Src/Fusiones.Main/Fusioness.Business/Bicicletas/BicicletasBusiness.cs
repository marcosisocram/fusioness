using System;
using Fusioness.Business.Util;
using Fusioness.Data;
using Fusioness.Data.Contracts;
using Fusioness.Data.Repositories;
using Fusioness.Entities;

namespace Fusioness.Business.Bicicletas
{
    class BicicletasBusiness : IBicicletaBusiness
    {
        #region Properties

        private readonly string _ConnectionString;

        #endregion

        #region Constructor

        public BicicletasBusiness()
        {
            _ConnectionString = ConnectionBuilder.GetConnection();
        }

        public BicicletasBusiness(string connectionString)
        {
            _ConnectionString = connectionString;
        }

        #endregion

        #region Methods

        #region Public

        public Bicicleta InsertBicicleta(Bicicleta bicicleta)
        {
            try
            {
                using (IUnityOfWork uow = new EFUnityOfWork(_ConnectionString))
                {
                    IRepository<Bicicleta> repo = new BicicletaRepository(uow);                    
                    bicicleta = repo.Insert(bicicleta);
                    uow.Commit();
                }
                return bicicleta;
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

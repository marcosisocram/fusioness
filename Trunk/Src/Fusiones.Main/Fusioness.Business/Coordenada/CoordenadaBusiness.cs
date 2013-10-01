using System;
using System.Collections.Generic;
using System.Linq;
using Fusioness.Business.Util;
using Fusioness.Data;
using Fusioness.Data.Contracts;
using Fusioness.Data.Repositories;
using Fusioness.Entities;

namespace Fusioness.Business.Coordenadas
{
    class CoordenadaBusiness : ICoordenadaBusiness
    {
        #region Properties

        private readonly string _ConnectionString;

        #endregion

        #region Constructor

        public CoordenadaBusiness()
        {
            _ConnectionString = ConnectionBuilder.GetConnection();
        }

        public CoordenadaBusiness(string connectionString)
        {
            _ConnectionString = connectionString;
        }

        #endregion

        #region Methods

        public Coordenada InserirCoordenada(Coordenada coordenada)
        {
            try
            {
                using (IUnityOfWork uow = new EFUnityOfWork(_ConnectionString))
                {
                    IRepository<Coordenada> repo = new CoordenadaRepository(uow);                    
                    coordenada = repo.Insert(coordenada);
                    uow.Commit();
                }
                return coordenada;
            }
            catch (Exception)
            {
                throw;
            }
        }

        public Coordenada AlterarCoordenada(Coordenada coordenada)
        {
            try
            {
                using (IUnityOfWork uow = new EFUnityOfWork(_ConnectionString))
                {
                    IRepository<Coordenada> repo = new CoordenadaRepository(uow);
                    coordenada = repo.Update(coordenada);
                    uow.Commit();
                }
                return coordenada;
            }
            catch (Exception)
            {
                return default(Coordenada);
            }
        }
        public void RemoverCoordenada(Coordenada coordenada)
        {
            try
            {
                using (IUnityOfWork uow = new EFUnityOfWork(_ConnectionString))
                {
                    IRepository<Coordenada> repo = new CoordenadaRepository(uow);
                    repo.Delete(coordenada);
                    uow.Commit();
                }
            }
            catch (Exception)
            {
                throw;
            }
        }
        public Coordenada ObterCoordenadaPorId(Coordenada coordenada)
        {
            using (IUnityOfWork uow = new EFUnityOfWork(_ConnectionString))
            {
                return new CoordenadaRepository(uow).GetByKey(new Coordenada { IdCoordenada = coordenada.IdCoordenada });
            }
        }
        public List<Coordenada> ListarCoordenadas()
        {
            try
            {
                using (IUnityOfWork uow = new EFUnityOfWork(_ConnectionString))
                {
                    IRepository<Coordenada> repo = new CoordenadaRepository(uow);
                    return repo.GetAll().ToList();
                }
            }
            catch (Exception)
            {
                throw;
            }
        }

        public List<Coordenada> ListarCoordenadasPorRota(Rota rota)
        {
            try
            {
                using (IUnityOfWork uow = new EFUnityOfWork(_ConnectionString))
                {
                    IRepository<Coordenada> repo = new CoordenadaRepository(uow);
                    return repo.GetWhere(c => c.IdRota == rota.IdRota).ToList();
                }
            }
            catch (Exception)
            {
                throw;
            }
        }
        #endregion
    }
}

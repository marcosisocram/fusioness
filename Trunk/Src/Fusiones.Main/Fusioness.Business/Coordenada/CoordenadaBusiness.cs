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

        public List<Coordenada> InserirListaCoordenadas(List<Coordenada> listaCoordenadas)
        {
            try
            {
                using (IUnityOfWork uow = new EFUnityOfWork(_ConnectionString))
                {
                    IRepository<Coordenada> repo = new CoordenadaRepository(uow);
                    
                    IEnumerable<Coordenada> listaInserir = listaCoordenadas;
                    
                    listaCoordenadas = repo.Insert(listaInserir).ToList();
                    uow.Commit();
                }
                return listaCoordenadas;
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
                    return repo.GetWhere(c => c.IdRota == rota.IdRota && c.IdTipoCoordenada == 1).ToList();
                }
            }
            catch (Exception)
            {
                throw;
            }
        }

        public List<Coordenada> ListarPontosReferenciaPorRota(Rota rota)
        {
            try
            {
                using (IUnityOfWork uow = new EFUnityOfWork(_ConnectionString))
                {
                    IRepository<Coordenada> repo = new CoordenadaRepository(uow);
                    return repo.GetWhere(c => c.IdRota == rota.IdRota && c.IdTipoCoordenada == 2).ToList();
                }
            }
            catch (Exception)
            {
                throw;
            }
        }

        public List<Coordenada> ListarCoordenadasProximas(double latitudeMin, double latitudeMax, double longitudeMin, double longitudeMax)
        {
            try
            {
                using (IUnityOfWork uow = new EFUnityOfWork(_ConnectionString))
                {
                    IRepository<Coordenada> repo = new CoordenadaRepository(uow);
                    return repo.GetWhere(c => c.Latitude >= latitudeMin && c.Latitude <= latitudeMax
                        && c.Longitude >= longitudeMin && c.Longitude <= longitudeMax).ToList();
                }
            }
            catch (Exception)
            {
                throw;
            }
        }

        public double ConsultarDuracaoRota(int idRota)
        {
            try
            {
                using (IUnityOfWork uow = new EFUnityOfWork(_ConnectionString))
                {
                    IRepository<Coordenada> repo = new CoordenadaRepository(uow);
                    IRepository<Rota> reporota = new RotaRepository(uow);

                    var listRota = reporota.GetWhere(c => c.IdRota == idRota || c.IdRotaOrigem == idRota).ToList();
                    double somaMinutos = 0;

                    foreach (var item in listRota)
	                {
		                var listCoordenada = repo.GetWhere(c => c.IdRota == item.IdRota).ToList();
                        
                        DateTime minData = Convert.ToDateTime(listCoordenada.Min(u => u.Data));
                        DateTime maxData = Convert.ToDateTime(listCoordenada.Max(u => u.Data));

                        somaMinutos += (maxData - minData).TotalMinutes;
                    }

                    if (listRota.Count > 0)
                    {
                        double totalMinutos = somaMinutos / listRota.Count;
                        if (totalMinutos >= 60)
                            return (totalMinutos) / 60.0;
                        else
                            return Convert.ToDouble("0." + Math.Round(totalMinutos).ToString());
                    }
                    else
                        return somaMinutos;
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

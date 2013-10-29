using System;
using System.Collections.Generic;
using Fusioness.Business.Util;
using System.Linq;
using Fusioness.Data;
using Fusioness.Data.Contracts;
using Fusioness.Data.Repositories;
using Fusioness.Entities;
using Fusioness.Business.Coordenadas;
using Fusioness.Business.Rotas;

namespace Fusioness.Business.Eventos
{
    public class EventoBusiness : IEventoBusiness
    {
        #region Properties

        private readonly string _ConnectionString;

        #endregion

        #region Constructor

        public EventoBusiness()
        {
            _ConnectionString = ConnectionBuilder.GetConnection();
        }

        public EventoBusiness(string connectionString)
        {
            _ConnectionString = connectionString;
        }

        #endregion

        #region Methods

        public Evento InserirEvento(Evento evento)
        {
            try
            {
                using (IUnityOfWork uow = new EFUnityOfWork(_ConnectionString))
                {
                    IRepository<Evento> repo = new EventoRepository(uow);
                    evento = repo.Insert(evento);
                    uow.Commit();
                }
                return evento;
            }
            catch (Exception)
            {
                return default(Evento);
            }
        }
        public Evento AlterarEvento(Evento evento)
        {
            try
            {
                using (IUnityOfWork uow = new EFUnityOfWork(_ConnectionString))
                {
                    IRepository<Evento> repo = new EventoRepository(uow);
                    if (evento.UrlImagem.StartsWith("data:image/png;"))
                        evento.UrlImagem = string.Empty;
                    evento = repo.Update(evento);
                    uow.Commit();
                }
                return evento;
            }
            catch (Exception)
            {
                return default(Evento);
            }
        }
        public void RemoverEvento(Evento evento)
        {
            try
            {
                using (IUnityOfWork uow = new EFUnityOfWork(_ConnectionString))
                {
                    var repo = new EventoRepository(uow);
                    var repoConvite = new ConviteEventoRepository(uow);
                    var convites = repoConvite.GetWhere(c => c.IdEvento == evento.IdEvento);
                    if(convites.Any()) repoConvite.Delete(convites);
                    repo.Delete(evento);
                    uow.Commit();
                }
            }
            catch (Exception)
            {
                throw;
            }
        }

        public Evento ObterEventoPorId(Evento evento)
        {
            using (IUnityOfWork ouw = new EFUnityOfWork(_ConnectionString))
            {
                return new EventoRepository(ouw).GetByKey(new Evento { IdEvento = evento.IdEvento });
            }
        }
        public List<Evento> ListarEventos(params int[] ids)
        {
            using (IUnityOfWork uow = new EFUnityOfWork(_ConnectionString))
            {
                if (ids.Any()) return new EventoRepository(uow).GetWhere(e => ids.Any(id => id == e.IdEvento)).ToList();
                return new EventoRepository(uow).GetAll().ToList();
            }
        }

        public List<Evento> ListarEventosPorUsuario(Usuario usuaio)
        {
            using (IUnityOfWork uow = new EFUnityOfWork(_ConnectionString))
            {
                return new EventoRepository(uow).GetWhere(e => e.IdUsuario == usuaio.IdUsuario).ToList();
            }
        }

        public List<Evento> ListarEventosComDistancia(double latitudeAtual, double longitudeAtual)
        {
            CoordenadaBusiness coordenadaBusiness = new CoordenadaBusiness();
            RotaBusiness rotaBusiness = new RotaBusiness();
            IEnumerable<Evento> listaEventosPublicos = ListarEventos().Where(e => e.Publico = true);
            foreach (var item in listaEventosPublicos)
            {
                Rota rota = rotaBusiness.ObterRotaPorId(new Rota(){IdRota = item.IdRota});
                Coordenada pontoDePartida = coordenadaBusiness.ListarCoordenadasPorRota(rota).First();
                item.Distancia = CalculateCoordinateDistance(latitudeAtual, longitudeAtual, pontoDePartida.Latitude, pontoDePartida.Longitude);
            }
            listaEventosPublicos = from e in listaEventosPublicos
                                   orderby e.Distancia
                                   select e;
                                    
            return listaEventosPublicos.ToList();
        }

        private double CalculateCoordinateDistance(double lat1, double long1, double lat2, double long2)
        {
            double _eQuatorialEarthRadius = 6378.1370D;
            double _d2r = (Math.PI / 180D);

            double dlong = (long2 - long1) * _d2r;
            double dlat = (lat2 - lat1) * _d2r;
            double a = Math.Pow(Math.Sin(dlat / 2D), 2D) + Math.Cos(lat1 * _d2r) * Math.Cos(lat2 * _d2r) * Math.Pow(Math.Sin(dlong / 2D), 2D);
            double c = 2D * Math.Atan2(Math.Sqrt(a), Math.Sqrt(1D - a));
            double d = _eQuatorialEarthRadius * c;

            return Math.Round(d, 2);
        }


        #endregion
    }
}

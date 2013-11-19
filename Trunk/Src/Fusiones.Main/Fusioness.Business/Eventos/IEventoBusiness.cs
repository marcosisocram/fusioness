using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Fusioness.Entities;

namespace Fusioness.Business.Eventos
{
    public interface IEventoBusiness
    {
        Evento InserirEvento(Evento evento);
        Evento AlterarEvento(Evento evento);
        void RemoverEvento(Evento evento);
        Evento ObterEventoPorId(Evento evento);
        List<Evento> ListarEventos(params int[] ids);
        List<Evento> ListarEventosPorTitulo(string titulo, bool apenasPublico);
        List<Evento> ListarEventosPorUsuario(Usuario usuario);
        List<Evento> ListarEventosComDistancia(double latitudeAtual, double longitudeAtual);
        List<Evento> ListarEventosProximos(double latitudeMin, double latitudeMax, double longitudeMin, double longitudeMax);
        string InserirFotoEvento(Evento evento, byte[] bytes, string filename, string dirbase);

    }
}

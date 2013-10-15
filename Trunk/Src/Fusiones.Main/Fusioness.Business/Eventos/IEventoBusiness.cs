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
        List<Evento> ListarEventos();
        List<Evento> ListarEventosPorUsuario(Usuario usuario);
    }
}

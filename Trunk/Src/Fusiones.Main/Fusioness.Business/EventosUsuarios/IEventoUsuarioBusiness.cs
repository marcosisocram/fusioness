using Fusioness.Entities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Fusioness.Business.EventosUsuarios
{
    public interface IEventoUsuarioBusiness
    {
        EventoUsuario InserirEventoUsuario(EventoUsuario eventoUsuario);
        EventoUsuario AlterarEventoUsuario(EventoUsuario eventoUsuario);
        void RemoverEventoUsuario(EventoUsuario eventoUsuario);
        List<EventoUsuario> ListarUsuariosEvento(Evento evento);
        List<EventoUsuario> ListarEventoUsuario(Usuario usuario);
        EventoUsuario ObterEventoUsuario(Evento evento, Usuario usuario);
        TimeSpan ObterMeuTempoNoEvento(EventoUsuario eventoUsuario);
    }
}

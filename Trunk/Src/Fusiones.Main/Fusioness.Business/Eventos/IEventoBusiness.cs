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
        Evento InsertEvento(Evento evento);
        List<Evento> CarregarEventos();
        Evento ObterEventoPorId(int id);
    }
}

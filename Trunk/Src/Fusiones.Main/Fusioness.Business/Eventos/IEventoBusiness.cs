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
        void InsertEvento(Evento evento);
        List<Evento> CarregarEventos();
    }
}

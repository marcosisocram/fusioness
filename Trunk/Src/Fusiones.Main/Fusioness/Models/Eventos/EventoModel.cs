using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Fusioness.FusionessWS;

namespace Fusioness.Models.Eventos
{
    public class EventoModel
    {
        public List<Evento> eventos { get; set; }
        public Evento eventoSelecionado { get; set; }
    }
}
﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Fusioness.FusionessWS;

namespace Fusioness.Models.Eventos
{
    public class EventoModel
    {
        public Evento Evento { get; set; }

        public IList<Evento> ListaEventos { get; set; }
    }
}
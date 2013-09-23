﻿using System.Collections.Generic;
using Fusioness.FusionessWS;

namespace Fusioness.Models.Rotas
{
    public class RotaModel
    {
        public IList<Rota> RotasDoUsuario { get; set; }
        public Rota RotaSelecionada { get; set; }

        public TipoRota TiposDeRotaSelecionada { get; set; }
        public IList<TipoRota> TiposDeRotas { get; set; }
    }
}
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Fusioness.Entities;

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
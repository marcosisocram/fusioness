using System.Collections.Generic;
using Fusioness.FusionessWS;

namespace Fusioness.Models.Rotas
{
    public class RotaModel
    {
        public Rota Rota{ get; set; }
        public IList<TipoRota> TiposDeRotas { get; set; }
        public IList<TipoPista> TiposDePista { get; set; }
        public IList<Dificuldade> TiposDeDificuldade { get; set; }
        public IList<QualidadeRota> TiposDeQualidade{ get; set; }

    }
}
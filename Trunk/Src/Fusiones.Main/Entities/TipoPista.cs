using System.Collections.Generic;

namespace Fusioness.Entities
{
    public class TipoPista : EntityBase
    {
        public TipoPista()
        {
            Rotas = new List<Rota>();
        }

        public int IdTipoPista { get; set; }
        public string Descricao { get; set; }
        public virtual List<Rota> Rotas { get; set; }
    }
}

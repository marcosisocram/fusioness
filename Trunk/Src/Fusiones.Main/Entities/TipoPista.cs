using System.Collections.Generic;

namespace Fusioness.Entities
{
    public class TipoPista : EntityBase
    {
        public TipoPista()
        {
            this.Rotas = new List<Rota>();
        }

        public int IdTipoPista { get; set; }
        public string Descricao { get; set; }
        public virtual ICollection<Rota> Rotas { get; set; }
    }
}

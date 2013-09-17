using System.Collections.Generic;

namespace Fusioness.Entities
{
    public class TipoRota : EntityBase
    {
        public TipoRota()
        {
            this.Rotas = new List<Rota>();
        }

        public int IdTipoRota { get; set; }
        public string Descricao { get; set; }
        public virtual ICollection<Rota> Rotas { get; set; }
    }
}

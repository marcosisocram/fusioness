using System.Collections.Generic;

namespace Fusioness.Entities
{
    public class TipoRota : EntityBase
    {
        public TipoRota()
        {
            Rotas = new List<Rota>();
        }

        public int IdTipoRota { get; set; }
        public string Descricao { get; set; }
        public virtual List<Rota> Rotas { get; set; }
    }
}

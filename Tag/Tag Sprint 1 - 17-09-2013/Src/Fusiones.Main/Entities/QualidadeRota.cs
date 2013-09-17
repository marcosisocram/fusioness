using System.Collections.Generic;

namespace Fusioness.Entities
{
    public class QualidadeRota : EntityBase
    {
        public QualidadeRota()
        {
            this.Rotas = new List<Rota>();
        }

        public int IdQualidadeRota { get; set; }
        public string Descricao { get; set; }
        public virtual ICollection<Rota> Rotas { get; set; }
    }
}

using System.Collections.Generic;

namespace Fusioness.Entities
{
    public class QualidadeRota : EntityBase
    {
        public QualidadeRota()
        {
            Rotas = new List<Rota>();
        }

        public int IdQualidadeRota { get; set; }
        public string Descricao { get; set; }
        public virtual List<Rota> Rotas { get; set; }
    }
}

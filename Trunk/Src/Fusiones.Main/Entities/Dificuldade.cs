using System.Collections.Generic;

namespace Fusioness.Entities
{
    public class Dificuldade : EntityBase
    {
        public Dificuldade()
        {
            Rotas = new List<Rota>();
        }

        public int IdDificuldade { get; set; }
        public string Descricao { get; set; }
        public virtual ICollection<Rota> Rotas { get; set; }
    }
}

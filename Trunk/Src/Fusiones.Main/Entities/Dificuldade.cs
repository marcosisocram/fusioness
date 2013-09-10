using System;
using System.Collections.Generic;

namespace Fusioness.Entities
{
    public partial class Dificuldade : EntityBase
    {
        public Dificuldade()
        {
            this.Rotas = new List<Rota>();
        }

        public int IdDificuldade { get; set; }
        public string Descricao { get; set; }
        public virtual ICollection<Rota> Rotas { get; set; }
    }
}

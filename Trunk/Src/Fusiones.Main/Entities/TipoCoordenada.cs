using System.Collections.Generic;

namespace Fusioness.Entities
{
    public class TipoCoordenada : EntityBase
    {
        public TipoCoordenada()
        {
            this.Coordenadas = new List<Coordenada>();
        }

        public int IdTipoCoordenada { get; set; }
        public string Descricao { get; set; }
        public virtual ICollection<Coordenada> Coordenadas { get; set; }
    }
}

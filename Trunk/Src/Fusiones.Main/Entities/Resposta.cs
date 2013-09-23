using System.Collections.Generic;

namespace Fusioness.Entities
{
    public class Resposta : EntityBase
    {
        public Resposta()
        {
            ConviteEventos = new List<ConviteEvento>();
        }

        public int IdResposta { get; set; }
        public string Descricao { get; set; }
        public virtual List<ConviteEvento> ConviteEventos { get; set; }
    }
}

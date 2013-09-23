using System.Collections.Generic;

namespace Fusioness.Entities
{
    public class Contato : EntityBase
    {
        public Contato()
        {
            ConviteEventos = new List<ConviteEvento>();
        }

        public int IdUsuario { get; set; }
        public int IdContato { get; set; }
        public virtual Usuario Usuario { get; set; }
        public virtual Usuario Usuario1 { get; set; }
        public virtual List<ConviteEvento> ConviteEventos { get; set; }
    }
}

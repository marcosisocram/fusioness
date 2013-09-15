using System;
using System.Collections.Generic;

namespace Fusioness.Entities
{
    public class EventoUsuario : EntityBase
    {

        public int IdUsuario { get; set; }
        public int IdEvento { get; set; }
        public Nullable<int> IdStatusEvento { get; set; }
        public string StatusDescricao { get; set; }

        public virtual Usuario Usuario { get; set; }
        public virtual Evento Evento { get; set; }
        public virtual StatusEvento StatusEventos { get; set; }
    }
}

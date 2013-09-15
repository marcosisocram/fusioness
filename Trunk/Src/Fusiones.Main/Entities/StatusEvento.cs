using System;
using System.Collections.Generic;

namespace Fusioness.Entities
{
    public class StatusEvento : EntityBase
    {
        public int IdStatusEvento { get; set; }
        public string Descricao { get; set; }

        public virtual ICollection<EventoUsuario> EventosUsuario { get; set; }
    }
}

using System.Collections.Generic;

namespace Fusioness.Entities
{
    public class StatusEvento : EntityBase
    {
        public StatusEvento()
        {
            this.EventoUsuarios = new List<EventoUsuario>();
        }

        public int IdStatusEvento { get; set; }
        public string Descricao { get; set; }
        public virtual ICollection<EventoUsuario> EventoUsuarios { get; set; }
    }
}

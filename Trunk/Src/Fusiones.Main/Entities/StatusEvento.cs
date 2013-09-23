using System.Collections.Generic;

namespace Fusioness.Entities
{
    public class StatusEvento : EntityBase
    {
        public StatusEvento()
        {
            EventoUsuarios = new List<EventoUsuario>();
        }

        public int IdStatusEvento { get; set; }
        public string Descricao { get; set; }
        public virtual List<EventoUsuario> EventoUsuarios { get; set; }
    }
}

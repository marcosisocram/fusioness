using System.Collections.Generic;

namespace Fusioness.Entities
{
    public class Evento : EntityBase
    {
        public Evento()
        {
            this.ConviteEventos = new List<ConviteEvento>();
            this.EventoUsuarios = new List<EventoUsuario>();
        }

        public int IdEvento { get; set; }
        public int IdUsuario { get; set; }
        public int IdRota { get; set; }
        public string Titulo { get; set; }
        public string Descricao { get; set; }
        public System.DateTime Data { get; set; }
        public string UrlImagem { get; set; }
        public bool Publico { get; set; }
        public virtual ICollection<ConviteEvento> ConviteEventos { get; set; }
        public virtual Rota Rota { get; set; }
        public virtual Usuario Usuario { get; set; }
        public virtual ICollection<EventoUsuario> EventoUsuarios { get; set; }
    }
}

using System.Collections.Generic;

namespace Fusioness.Entities
{
    public class ComentarioEvento : EntityBase
    {
        public int IdComentarioEvento { get; set; }
        public int IdUsuario { get; set; }
        public int IdEvento{ get; set; }
        public virtual Evento Evento { get; set; }
        public virtual Usuario Usuario { get; set; }
        public string Descricao { get; set; }
        public System.DateTime Data { get; set; }
    }
}

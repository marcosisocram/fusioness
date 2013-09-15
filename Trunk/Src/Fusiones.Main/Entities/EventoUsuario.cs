namespace Fusioness.Entities 
{
    public class EventoUsuario : EntityBase
    {
        public int IdUsuario { get; set; }
        public int IdEvento { get; set; }
        public int? IdStatusEvento { get; set; }
        public string StatusDescricao { get; set; }
        public virtual Evento Evento { get; set; }
        public virtual StatusEvento StatusEvento { get; set; }
        public virtual Usuario Usuario { get; set; }
    }
}

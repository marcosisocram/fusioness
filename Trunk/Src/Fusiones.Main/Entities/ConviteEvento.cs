namespace Fusioness.Entities
{
    public class ConviteEvento : EntityBase
    {
        public int IdUsuario { get; set; }
        public int IdContato { get; set; }
        public int IdEvento { get; set; }
        public int? IdResposta { get; set; }
        public virtual Contato Contato { get; set; }
        public virtual Evento Evento { get; set; }
        public virtual Resposta Resposta { get; set; }
    }
}

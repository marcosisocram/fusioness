using System.Collections.Generic;

namespace Fusioness.Entities
{
    public class Rota : EntityBase
    {
        public Rota()
        {
            Coordenadas = new List<Coordenada>();
            Eventos = new List<Evento>();
        }

        public int IdRota { get; set; }
        public int IdUsuario { get; set; }
        public int? IdTipoPista { get; set; }
        public int? IdDificuldade { get; set; }
        public int? IdQualidadeRota { get; set; }
        public int? IdRotaOrigem { get; set; }        
        public string Descricao { get; set; }
        public virtual List<Coordenada> Coordenadas { get; set; }
        public virtual Dificuldade Dificuldade { get; set; }
        public virtual List<Evento> Eventos { get; set; }
        public virtual QualidadeRota QualidadeRota { get; set; }
        public virtual TipoPista TipoPista { get; set; }
        public virtual Usuario Usuario { get; set; }
    }
}

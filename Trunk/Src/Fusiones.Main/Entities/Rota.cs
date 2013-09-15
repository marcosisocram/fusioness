using System;
using System.Collections.Generic;

namespace Fusioness.Entities
{
    public class Rota : EntityBase
    {
        public Rota()
        {
            this.Coordenadas = new List<Coordenada>();
            this.Eventos = new List<Evento>();
        }

        public int IdRota { get; set; }
        public int IdUsuario { get; set; }
        public int? IdTipoPista { get; set; }
        public int IdTipoRota { get; set; }
        public int? IdDificuldade { get; set; }
        public int? IdQualidadeRota { get; set; }
        public virtual ICollection<Coordenada> Coordenadas { get; set; }
        public virtual Dificuldade Dificuldade { get; set; }
        public virtual ICollection<Evento> Eventos { get; set; }
        public virtual QualidadeRota QualidadeRota { get; set; }
        public virtual TipoPista TipoPista { get; set; }
        public virtual TipoRota TipoRota { get; set; }
        public virtual Usuario Usuario { get; set; }
    }
}

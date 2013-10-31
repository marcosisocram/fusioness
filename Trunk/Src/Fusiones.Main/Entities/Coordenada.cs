using System;

namespace Fusioness.Entities
{
    public class Coordenada : EntityBase
    {
        public int IdCoordenada { get; set; }
        public int IdRota { get; set; }
        public int? IdTipoCoordenada { get; set; }
        public double Latitude { get; set; }
        public double Longitude { get; set; }
        public DateTime? Data { get; set; }
        public string NomePonto { get; set; }
        public string DescricaoPonto { get; set; }
        public string UrlImagemPonto { get; set; }
        public virtual Rota Rota { get; set; }
        public virtual TipoCoordenada TipoCoordenada { get; set; }
    }
}

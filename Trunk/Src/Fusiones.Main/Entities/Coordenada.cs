using System;

namespace Fusioness.Entities
{
    public class Coordenada : EntityBase
    {
        public int IdCoordenada { get; set; }
        public int IdRota { get; set; }
        public Nullable<int> IdTipoCoordenada { get; set; }
        public double Latitude { get; set; }
        public double Longitude { get; set; }
        public Nullable<DateTime> Data { get; set; }
        public virtual Rota Rota { get; set; }
        public virtual TipoCoordenada TipoCoordenada { get; set; }
    }
}


namespace Fusioness.Entities
{
    public class Bicicleta : EntityBase
    {
        public int IdBicicleta { get; set; }
        public int IdUsuario { get; set; }
        public string Modelo { get; set; }
        public string Marca { get; set; }
        public virtual Usuario Usuario { get; set; }
    }
}
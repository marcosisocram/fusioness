using System.Collections.Generic;
using Fusioness.FusionessWS;

namespace Fusioness.Models.Bicicletas
{
    public class BicicletaModel
    {
        public string Mensagem { get; set; }
        public Bicicleta Bicicleta { get; set; }
        public List<Bicicleta> ListaBicicletasPorUsuario {get;set;}
    }
}
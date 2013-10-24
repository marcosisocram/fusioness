using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using Fusioness.FusionessWS;
using System.Web.Mvc;

namespace Fusioness.Models.Bicicletas
{
    public class BicicletaModel
    {
        public string Mensagem { get; set; }
        public Bicicleta Bicicleta { get; set; }
        public List<Bicicleta> ListaBicicletasPorUsuario { get; set; }

        public bool ValidarBicicleta(ModelStateDictionary ModelState)
        {
            bool retorno = true;
            if (string.IsNullOrWhiteSpace(Bicicleta.Modelo))
            {
                ModelState.AddModelError("Modelo", "Preencha o modelo");
                retorno = false;
            }
            if (string.IsNullOrWhiteSpace(Bicicleta.Marca))
            {
                ModelState.AddModelError("Marca", "Preencha a marca");
                retorno = false;
            }
            
            return retorno;
        }
    }
}
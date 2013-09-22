using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Fusioness.Entities;

namespace Fusioness.Models.Bicicletas
{
    public class BicicletaModel
    {
        public string Mensagem { get; set; }
        public Bicicleta Bicicleta { get; set; }
    }
}
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Fusioness.Entities
{
    public class UsuarioTokenSenha : EntityBase
    {
        public int ID { get; set; }
        public string Token { get; set; }
        public DateTime DataDeGeracao { get; set; }
        public int UsuarioID { get; set; }
    }
}

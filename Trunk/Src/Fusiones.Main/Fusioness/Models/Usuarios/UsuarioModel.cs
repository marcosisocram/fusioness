using System.ComponentModel.DataAnnotations;
using System.Linq;
using Fusioness.FusionessWS;

namespace Fusioness.Models.Usuarios
{
    public class UsuarioModel
    {
        public string Mensagem { get; set; }
        private Usuario _Usuario;

        public Usuario Usuario
        {
            get 
            {
                if (_Usuario == null)
                {
                    _Usuario = new Usuario();
                }
                return _Usuario;
            }
            set { _Usuario = value; }
        }        
    }
}
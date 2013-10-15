using System.ComponentModel.DataAnnotations;
using System.Linq;
using Fusioness.FusionessWS;
using System.Web.Mvc;

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

        public bool ValidarUsuario(ModelStateDictionary ModelState)
        {
            bool retorno = true;
            if (string.IsNullOrWhiteSpace(Usuario.Nome))
            {
                ModelState.AddModelError("Nome", "Preecha o nome");
                retorno = false;
            }
            if (string.IsNullOrWhiteSpace(Usuario.Login))
            {
                ModelState.AddModelError("Login", "Preecha o login");
                retorno = false;
            }
            if (string.IsNullOrWhiteSpace(Usuario.Senha))
            {
                ModelState.AddModelError("Senha", "Preecha a senha");
                retorno = false;
            }
            if (string.IsNullOrWhiteSpace(Usuario.Email))
            {
                ModelState.AddModelError("Email", "Preecha o e-mail");
                retorno = false;
            }
            else if (!System.Text.RegularExpressions.Regex.IsMatch(Usuario.Email, @"^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$"))
            {
                ModelState.AddModelError("Email", "e-mail inválido");
                retorno = false;
            }
            if (Usuario.Idade == null)
            {
                ModelState.AddModelError("Idade", "Preecha a idade");
                retorno = false;
            }
            else if (Usuario.Idade <= 0 || Usuario.Idade > 100)
            {
                ModelState.AddModelError("Idade", "idade inválida");
                retorno = false;
            }
            if (string.IsNullOrWhiteSpace(Usuario.Sexo))
            {
                ModelState.AddModelError("Sexo", "Preecha o sexo");
                retorno = false;
            }
            else if (!Usuario.Sexo.Equals("M", System.StringComparison.InvariantCultureIgnoreCase) && !Usuario.Sexo.Equals("F", System.StringComparison.InvariantCultureIgnoreCase))
            {
                ModelState.AddModelError("Sexo", "sexo inválido. M/F por favor.");
                retorno = false;
            }

            return retorno;
        }
    }
}
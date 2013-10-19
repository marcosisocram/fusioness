using System.ComponentModel.DataAnnotations;
using System.Linq;
using Fusioness.FusionessWS;
using System.Web.Mvc;
using System.Collections.Generic;

namespace Fusioness.Models.Usuarios
{
    public class UsuarioModel
    {
        public string Mensagem { get; set; }
        private Usuario _Usuario;        
        public IEnumerable<SelectListItem> Sexos { get; set; }
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
                ModelState.AddModelError("Nome", "Preencha o nome");
                retorno = false;
            }
            if (string.IsNullOrWhiteSpace(Usuario.Login))
            {
                ModelState.AddModelError("Login", "Preencha o login");
                retorno = false;
            }
            if (string.IsNullOrWhiteSpace(Usuario.Senha))
            {
                ModelState.AddModelError("Senha", "Preencha a senha");
                retorno = false;
            }
            if (string.IsNullOrWhiteSpace(Usuario.Email))
            {
                ModelState.AddModelError("Email", "Preencha o e-mail");
                retorno = false;
            }
            else if (!System.Text.RegularExpressions.Regex.IsMatch(Usuario.Email, @"^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$"))
            {
                ModelState.AddModelError("Email", "E-mail inválido");
                retorno = false;
            }
            if (Usuario.Idade == null)
            {
                ModelState.AddModelError("Idade", "Preencha a idade");
                retorno = false;
            }
            else if (Usuario.Idade <= 0 || Usuario.Idade > 100)
            {
                ModelState.AddModelError("Idade", "Idade inválida");
                retorno = false;
            }
            if (string.IsNullOrWhiteSpace(Usuario.Sexo))
            {
                ModelState.AddModelError("Sexo", "Preencha o sexo");
                retorno = false;
            }
            else if (!Usuario.Sexo.Equals("M", System.StringComparison.InvariantCultureIgnoreCase) && !Usuario.Sexo.Equals("F", System.StringComparison.InvariantCultureIgnoreCase))
            {
                ModelState.AddModelError("Sexo", "Sexo inválido. M/F por favor.");
                retorno = false;
            }

            return retorno;
        }

        public void CarregarParametrosView()
        {            
            Sexos = new[]
            {
                new SelectListItem { Value = "M", Text = "Masculino" },
                new SelectListItem { Value = "F", Text = "Feminino" },                
            };
        }
    }
}
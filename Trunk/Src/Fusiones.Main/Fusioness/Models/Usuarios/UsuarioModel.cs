using System.ComponentModel.DataAnnotations;
using System.Linq;
using Fusioness.FusionessWS;
using System.Web.Mvc;
using System.Collections.Generic;
using System;

namespace Fusioness.Models.Usuarios
{
    public class UsuarioModel
    {
        public string Mensagem { get; set; }
        private Usuario _Usuario;        

        public IList<Evento> UltimosEventos { get; set; }
        public IList<ComentarioEvento> UltimosComentarios { get; set; }

        public IEnumerable<SelectListItem> Sexos { get; set; }

        public Usuario UsuarioLogado { get; set; }

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

        public int IdadeUsuario
        {
            get
            {
                return DateTime.Now.Year - Usuario.DataDeNascimento.Year;
            }
        }

        public string SexoUsuario
        {
            get 
            {
                if (Usuario.Sexo.Equals("M"))
                {
                    return "Masculino";
                }
                return "Feminino";
            }
        }
        public bool IsLoginOK { get; set; }
        public bool IsEmailOK { get; set; }
        public bool IsSenhaOK { get; set; }
        public string NovaSenha { get; set; }

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
            else if (!IsLoginOK)
            {
                ModelState.AddModelError("Login", "Já existe um usuário com esse login");
                retorno = false;
            }
            if (string.IsNullOrWhiteSpace(Usuario.Senha))
            {
                ModelState.AddModelError("Senha", "Preencha a senha");
                retorno = false;
            }
            else if (!IsSenhaOK)
            {
                ModelState.AddModelError("Senha", "A senha digitada não confere com a senha em nosso sistema");
                retorno = false;
            }
            if (string.IsNullOrWhiteSpace(Usuario.Email))
            {
                ModelState.AddModelError("Email", "Preencha o e-mail");
                retorno = false;
            }
            else if (!IsEmailOK)
            {
                ModelState.AddModelError("Email", "Já existe um usuário com esse e-mail");
                retorno = false;
            }
            else if (!System.Text.RegularExpressions.Regex.IsMatch(Usuario.Email, @"^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$"))
            {
                ModelState.AddModelError("Email", "E-mail inválido");
                retorno = false;
            }
            if (Usuario.DataDeNascimento == null)
            {
                ModelState.AddModelError("Idade", "Preencha a data de nascimento");
                retorno = false;
            }
            else
            {
                var idade = DateTime.Now.Year - Usuario.DataDeNascimento.Year;
                if (idade <= 18 || idade > 100)
                {
                    ModelState.AddModelError("Idade", "Idade inválida. Idade deve ser maior que 18 e menor que 100.");
                    retorno = false;
                }
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

        public bool IsContato(int IdUsuarioDetalhar)
        {
            MainService Servico = new MainService();
            return Servico.ListarContatosDoUsuario(this.UsuarioLogado).Any(c => c.IdUsuario == this.UsuarioLogado.IdUsuario && c.IdContato == IdUsuarioDetalhar);
        }

        public bool IsMySelf(int IdUsuarioDetalhar)
        {
            return this.UsuarioLogado.IdUsuario == IdUsuarioDetalhar;
        }

        public bool IsConvitePendente(int IdUsuarioDetalhar)
        {
            MainService Servico = new MainService();
            var convites = Servico.ListarConvitesDoUsuario(this.UsuarioLogado);
            return convites.Any(c => c.IdUsuario == IdUsuarioDetalhar);
        }

        public bool IsConviteJaEfetuado(int IdUsuarioDetalhar)
        {
            MainService Servico = new MainService();
            var convitesFeitos = Servico.ListarConvitesFeitosPeloUsuario(this.UsuarioLogado);
            return convitesFeitos.Any(c => c.IdContato == IdUsuarioDetalhar);
        }
    }
}
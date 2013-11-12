using System.ComponentModel.DataAnnotations;
using System.Linq;
using Fusioness.FusionessWS;
using System.Web.Mvc;
using System.Collections.Generic;
using System;

namespace Fusioness.Models.Usuarios
{
    public class RecuperarSenhaModel
    {
        public string Mensagem { get; set; }
        public bool Isvalid { get; set; }
        public string NovaSenha { get; set; }
        public string NovaSenhaRpt { get; set; }
        public string Token { get; set; }
        public bool IsSenhaNova { get; set; }
        private Usuario _Usuario;

        public Usuario Usuario
        {
            get 
            {
                if (_Usuario == null)
                    _Usuario = new Usuario();
                return _Usuario; 
            }
            set { _Usuario = value; }
        }
        

        public bool ValidaModel(bool IsGet)
        {
            bool ret = true;
            if (string.IsNullOrWhiteSpace(Token))
            {
                Mensagem = "Token inválido.";
                ret = false;
            }
            else if(Usuario==null || Usuario.IdUsuario==0)
            {
                Mensagem = "Não existe usuário com esse token.";
                ret = false;
            }
            else if (!IsGet && string.IsNullOrWhiteSpace(NovaSenha))
            {
                Mensagem = "Preencha senha.";
                ret = false;
            }
            else if (!IsGet && NovaSenha!=NovaSenhaRpt)
            {
                Mensagem = "As duas senhas são diferentes.";
                ret = false;
            }
            return ret;
        }
    }
}
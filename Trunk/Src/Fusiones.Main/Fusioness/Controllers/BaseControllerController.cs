using System;
using System.Web;
using System.Web.Mvc;
using System.Web.Script.Serialization;
using Fusioness.Entities;
using Fusioness.Models.Seguranca;

namespace Fusioness.Controllers
{
    [Autorizar]
    public class BaseController : Controller
    {
        #region Propriedades
        private FusionessWS.MainService _Servico;
        public FusionessWS.MainService Servico
        {
            get
            {
                return _Servico ?? (_Servico = new FusionessWS.MainService());
            }
        }

        private JavaScriptSerializer _Serializer;
        public JavaScriptSerializer Serializer
        {
            get
            {
                return _Serializer ?? (_Serializer = new JavaScriptSerializer());
            }
        }

        public Usuario UsuarioLogado { get { return ObterUsuarioLogado(Request.RequestContext.HttpContext); } }
        
        private const string CHAVE_USUARIO_LOGADO = "LUK";
        #endregion

        #region Metodos
        #region Publicos
        public static Usuario ObterUsuarioLogado(HttpContextBase context)
        {
            if (context == null || context.Session == null || context.Session.Count == 0) return null;
            var usuarioLogado = context.Session[CHAVE_USUARIO_LOGADO];
            return usuarioLogado != null ? (Usuario)usuarioLogado : null;
        }

        public void EfetuarLogon(Usuario usuario)
        {
            EfetuarLogon(usuario, Request.RequestContext.HttpContext);
        }

        public void EfetuarLogon(Usuario usuario, HttpContextBase context)
        {
            if (context == null || context.Session == null) throw new Exception("Sessão inválida.");
            if (usuario == null || string.IsNullOrWhiteSpace(usuario.Login) || string.IsNullOrWhiteSpace(usuario.Senha)) throw new Exception("Usuário não preenchido corretamente.");
            
            context.Session[CHAVE_USUARIO_LOGADO] = usuario;
        }

        public void EfetuarLogout()
        {
            EfetuarLogout(Request.RequestContext.HttpContext);
        }

        public void EfetuarLogout(HttpContextBase context)
        {
            if (context == null || context.Session == null) throw new Exception("Sessão inválida.");
            context.Session.Clear();
            context.Session.Abandon();
        }

        /// <summary>
        /// Método responsável por exibir mensagens para o usuário.
        /// </summary>
        /// <param name="conteudo">Conteudo do modal. Aceita HTML strings</param>
        /// <param name="titulo">Titulo do modal</param>
        /// <param name="width">Largura do modal apresentado</param>
        public void ExibirModal(string conteudo, string titulo = "Informação do Sistema", int width = 400)
        {
            TempData["MODAL_TITLE"] = titulo;
            TempData["MODAL_CONTENT"] = conteudo;
            TempData["MODAL_WIDTH"] = width;
        }
        #endregion

        #region Privados
        #endregion
        #endregion
    }
}

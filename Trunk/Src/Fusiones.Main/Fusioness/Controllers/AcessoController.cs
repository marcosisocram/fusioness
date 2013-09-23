using System;
using System.Web.Mvc;
using Fusioness.Entities;
using Fusioness.Models.Account;
using Fusioness.Models.Seguranca;
using Fusioness.Models.Util;

namespace Fusioness.Controllers
{
    public class AcessoController : BaseController
    {
        [PermiteAnonimo]
        public ActionResult Index()
        {
            return View();
        }

        [PermiteAnonimo]
        [HttpPost]
        public ActionResult Entrar(AcessoModel model)
        {
            try
            {
                //Converte para a entidade do WS
                var usuarioWS = model.UsuarioLogado.GetEntityService<Usuario, FusionessWS.Usuario>();
                usuarioWS = Servico.ValidarLogonUsuario(usuarioWS);

                //Converte da entidade do WS 
                model.UsuarioLogado = usuarioWS.GetEntity<FusionessWS.Usuario, Usuario>();
                if (model.UsuarioLogado == null || model.UsuarioLogado.IdUsuario <= 0) throw new Exception("Usuário inválido.");
                EfetuarLogon(model.UsuarioLogado);
                
                return RedirectToAction("Index", "Home");
            }
            catch (Exception)
            {
                ExibirModal("Logon Inválido.");
                return RedirectToAction("Index");
            }
        }

        [HttpPost]
        public ActionResult Sair(AcessoModel model)
        {
            EfetuarLogout();
            return RedirectToAction("Index");
        }
    }
}

using System;
using System.Web.Mvc;
using Fusioness.Models.Acesso;
using Fusioness.Models.Seguranca;

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
                model.UsuarioLogado = Servico.ValidarLogonUsuario(model.UsuarioLogado);
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

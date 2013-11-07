using System;
using System.Web.Mvc;
using Fusioness.Models.Acesso;
using Fusioness.Models.Seguranca;

namespace Fusioness.Controllers
{
    [OutputCacheAttribute(VaryByParam = "*", Duration = 0, NoStore = true)]
    public class AcessoController : BaseController
    {
        [PermiteAnonimo]
        public ActionResult Index()
        {
            var usuarioLogado = BaseController.ObterUsuarioLogado(HttpContext);
            if(usuarioLogado!=null)
                return RedirectToAction("Index", "Home");
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

        public ActionResult Sair(AcessoModel model)
        {
            EfetuarLogout();
            return RedirectToAction("Index");
        }
    }
}

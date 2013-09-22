using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Fusioness.Entities;
using Fusioness.Models.Account;
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
            string resultadoValidacao = null;
            try
            {
                resultadoValidacao = Servico.ValidarLogonUsuario(Serializer.Serialize(model.UsuarioLogado));
                EfetuarLogon((Usuario)Serializer.Deserialize(resultadoValidacao, typeof(Usuario)));
                return RedirectToAction("Index", "Home");
            }
            catch (Exception ex)
            {
                ExibirModal(resultadoValidacao, "Logon Inválido.");
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

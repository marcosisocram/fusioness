using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Fusioness.FusionessWS;
using Fusioness.Models.Usuarios;

namespace Fusioness.Controllers
{
    public class UsuarioController : Controller
    {
        public ActionResult Index()
        {
            return View(new IndexModel());
        }

        public ActionResult Contato()
        {
            return View(new IndexModel());
        }

        public ActionResult InsertUsuario(IndexModel model)
        {
            MainService service = new MainService();
            TempData["MSG"] = service.InsertUsuario(model.usuario.Nome, model.usuario.Login, model.usuario.Senha, model.usuario.Email, model.usuario.Idade.Value, model.usuario.Sexo[0], model.usuario.UrlImagem);
            return RedirectToAction("index");
        }
    }
}

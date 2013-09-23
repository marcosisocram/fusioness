using System.Web.Mvc;
using Fusioness.Models.Usuarios;

namespace Fusioness.Controllers
{
    public class UsuarioController : BaseController
    {
        public ActionResult Index(UsuarioModel model)
        {
            return View(model);
        }

        public ActionResult InsertUsuario(UsuarioModel model)
        {
            if (model.Usuario.IdUsuario > 0) return UpdateUsuario(model);
            model.Usuario = Servico.InsertUsuario(model.Usuario);
            
            return RedirectToAction("index", model);
        }

        public ActionResult UpdateUsuario(UsuarioModel model)
        {
            model.Usuario = Servico.UpdateUsuario(model.Usuario);
            
            return RedirectToAction("index", model);
        
        }
    }
}

using System.Web.Mvc;
using Fusioness.Entities;
using Fusioness.Models.Usuarios;
using Fusioness.Models.Util;

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
            model.Usuario = Servico.InsertUsuario(model.Usuario.GetEntityService<Usuario, FusionessWS.Usuario>()).GetEntity<FusionessWS.Usuario, Usuario>();
            
            return RedirectToAction("index", model);
        }

        public ActionResult UpdateUsuario(UsuarioModel model)
        {
            model.Usuario = Servico.UpdateUsuario(model.Usuario.GetEntityService<Usuario, FusionessWS.Usuario>()).GetEntity<FusionessWS.Usuario, Usuario>();
            
            return RedirectToAction("index", model);
        
        }
    }
}

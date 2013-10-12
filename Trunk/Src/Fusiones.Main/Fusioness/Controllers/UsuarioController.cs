using System.Web.Mvc;
using Fusioness.Models.Usuarios;
using Fusioness.Models.Seguranca;

namespace Fusioness.Controllers
{
    public class UsuarioController : BaseController
    {
        public ActionResult Index(UsuarioModel model)
        {
            return View(model);
        }
        
        [PermiteAnonimo]
        public ActionResult InsertUsuario(UsuarioModel model)
        {
            if (model.Usuario.IdUsuario > 0) return UpdateUsuario(model);
            model.Usuario = Servico.InserirUsuario(model.Usuario);
            
            return RedirectToAction("index", model);
        }

        public ActionResult UpdateUsuario(UsuarioModel model)
        {
            model.Usuario = Servico.AlterarUsuario(model.Usuario);
            
            return RedirectToAction("index", model);
        
        }
    }
}

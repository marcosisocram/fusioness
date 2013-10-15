using System.Web.Mvc;
using Fusioness.Models.Usuarios;
using Fusioness.Models.Seguranca;
using System.Web;

namespace Fusioness.Controllers
{
    public class UsuarioController : BaseController
    {
        [PermiteAnonimo]
        public ActionResult Index(UsuarioModel model)
        {
            model.Usuario = BaseController.ObterUsuarioLogado(Request.RequestContext.HttpContext);
            return View(model);
        }
        
        [PermiteAnonimo]
        public ActionResult InsertUsuario(UsuarioModel model)
        {
            if (model.ValidarUsuario(ModelState))
            {
                if (model.Usuario.IdUsuario > 0)
                {
                    return UpdateUsuario(model);
                }
                model.Usuario = Servico.InserirUsuario(model.Usuario);
                return RedirectToAction("index", model);
            }
            return View("index", model);
        }

        public ActionResult UpdateUsuario(UsuarioModel model)
        {
            model.Usuario = Servico.AlterarUsuario(model.Usuario);
            
            return RedirectToAction("index", model);
        
        }        
    }
}

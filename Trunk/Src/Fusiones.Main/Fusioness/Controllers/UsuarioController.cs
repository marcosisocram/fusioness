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
            return View("Perfil", model);
        }

        [PermiteAnonimo]
        [HttpPost]
        public ActionResult InserirAlterarUsuario(UsuarioModel model)
        {
            if (model.ValidarUsuario(ModelState))
            {
                if (model.Usuario.IdUsuario > 0)
                {
                    model.Usuario = Servico.AlterarUsuario(model.Usuario);
                }
                else
                {
                    model.Usuario = Servico.InserirUsuario(model.Usuario);
                }
                return RedirectToAction("Index", model);
            }
            else
            {
                return View(model);
            }
        }

        [PermiteAnonimo]
        [HttpGet]
        public ActionResult InserirAlterarUsuario()
        {
            return View();
        }

                
        
    }
}

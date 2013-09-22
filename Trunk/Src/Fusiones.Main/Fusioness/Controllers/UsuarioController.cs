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

            model.Mensagem = Servico.InsertUsuario(Serializer.Serialize(model.Usuario));
            if(!string.IsNullOrWhiteSpace(model.Mensagem))ExibirModal(model.Mensagem);

            return RedirectToAction("index", model);
        }

        public ActionResult UpdateUsuario(UsuarioModel model)
        {
            model.Mensagem = Servico.UpdateUsuario(Serializer.Serialize(model.Usuario));
            if (!string.IsNullOrWhiteSpace(model.Mensagem)) ExibirModal(model.Mensagem);
            return RedirectToAction("index", model);
        
        }
    }
}

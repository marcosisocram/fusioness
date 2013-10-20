using System.Linq;
using System.Web.Mvc;
using Fusioness.Models.Contatos;

namespace Fusioness.Controllers
{
    public class ContatoController : BaseController
    {
        public ActionResult Index(ContatoModel model)
        {
            var idsContatos = Servico.ListarContatosDoUsuario(UsuarioLogado).Select(c => c.IdContato).ToList();
            if (idsContatos.Any()) model.ListaDeUsuarios = Servico.ObterUsuariosIds(idsContatos.ToArray());
            return View(model);
        }

        public ActionResult AdicionarContato(ContatoModel model)
        {
            //TODO: IMPLEMENTAR ROTINA
            return RedirectToAction("Index", model);
        }

        [HttpGet]
        public ActionResult ListarTodos()
        {
            var model = new ContatoModel();
            model.ListaDeUsuarios = Servico.ListarUsuarios();
            //model.Usuario = BaseController.ObterUsuarioLogado(Request.RequestContext.HttpContext);
            //model.CarregarParametrosView();
            return View("index",model);
        }
    }
}

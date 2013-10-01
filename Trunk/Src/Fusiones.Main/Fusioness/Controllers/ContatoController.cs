using System.Web.Mvc;
using Fusioness.Models.Contatos;

namespace Fusioness.Controllers
{
    public class ContatoController : BaseController
    {
        public ActionResult Index(ContatoModel model)
        {
            model.ListaDeUsuarios = Servico.ListarContatosPorUsuario(UsuarioLogado);
            return View(model);
        }

        public ActionResult AdicionarContato(ContatoModel model)
        {
            //TODO: IMPLEMENTAR ROTINA
            return RedirectToAction("Index", model);
        }
    }
}

using System.Web.Mvc;
using Fusioness.Entities;
using Fusioness.Models.Contatos;
using Fusioness.Models.Util;

namespace Fusioness.Controllers
{
    public class ContatoController : BaseController
    {
        public ActionResult Index(ContatoModel model)
        {

            model.ListaDeUsuarios = Servico.CarregarContatos(UsuarioLogado.IdUsuario).GetEntity<FusionessWS.Usuario, Usuario>();
            return View(model);
        }

        public ActionResult AdicionarContato(ContatoModel model)
        {
            //TODO: IMPLEMENTAR ROTINA
            return RedirectToAction("Index", model);
        }
    }
}

using System.Web.Mvc;
using Fusioness.Models.Bicicletas;

namespace Fusioness.Controllers
{
    public class BicicletaController : BaseController
    {
        public ActionResult Index(BicicletaModel model)
        {
            if (!string.IsNullOrWhiteSpace(model.Mensagem)) ExibirModal(model.Mensagem);
            return View();
        }

        public ActionResult InsertBicicleta(BicicletaModel model)
        {
            model.Bicicleta.IdUsuario = 7;
            model.Bicicleta = Servico.InserirBicicleta(model.Bicicleta);

            return RedirectToAction("index", model);
        }
    }
}

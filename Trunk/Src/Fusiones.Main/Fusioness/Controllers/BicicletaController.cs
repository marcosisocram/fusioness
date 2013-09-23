using System.Web.Mvc;
using Fusioness.Models.Bicicletas;
using Fusioness.Entities;
using Fusioness.Models.Util;

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
            
            var bicicletaWS = model.Bicicleta.GetEntityService<Bicicleta, FusionessWS.Bicicleta>();
            model.Bicicleta = Servico.InsertBicicleta(bicicletaWS).GetEntity<FusionessWS.Bicicleta, Bicicleta>();

            return RedirectToAction("index", model);
        }
    }
}

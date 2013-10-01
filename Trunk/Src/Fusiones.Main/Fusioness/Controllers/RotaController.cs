using System.Web.Mvc;
using Fusioness.Models.Rotas;
using Fusioness.FusionessWS;

namespace Fusioness.Controllers
{
    public class RotaController : BaseController
    {
        public ActionResult Index(RotaModel model)
        {
            //model.TiposDeDificuldade = Servico.ListarTiposDeDificuldade();
            //model.TiposDePista = Servico.ListarTiposDePista();
            //model.TiposDeQualidade = Servico.ListarTiposDeQualidade();
            //model.TiposDeRotas = Servico.ListarTipoRotas();

            return View(model);
        }

        public ActionResult InserirOuAlterarRota(RotaModel model)
        {
            //if (model.Rota.IdRota > 0) model.Rota = Servico.AlterarRota(model.Rota);
            //else model.Rota = Servico.InserirRota(model.Rota);

            if (model.Rota == null || model.Rota.IdRota <= 0) ExibirModal("Erro ao cadastrar rota.");

            return RedirectToAction("index", model.Rota);
        }
    }
}

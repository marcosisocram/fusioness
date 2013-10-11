using System.Web.Mvc;
using Fusioness.Models.Rotas;
using Fusioness.FusionessWS;

namespace Fusioness.Controllers
{
    public class RotaController : BaseController
    {
        public ActionResult Index(RotaModel model)
        {
            model.ListaRotas = Servico.ListarRotasPorUsuario(this.UsuarioLogado);
            return View(model);
        }

        public ActionResult Details(int Id = 0)
        {
            RotaModel model = new RotaModel();

            model.TiposDeDificuldade = Servico.ListarDificuldades();
            model.TiposDePista = Servico.ListarTiposPista();
            model.TiposDeQualidade = Servico.ListarQualidadesRota();
            model.TiposDeRotas = Servico.ListarTiposRota();
            model.Rota = new Rota() { IdRota = Id };
            model.Rota = Servico.ObterRotaPorId(model.Rota);

            return View("InserirAlterarRota", model);
        }

        public ActionResult InserirOuAlterarRota(RotaModel model)
        {
            model.Rota.IdUsuario = this.UsuarioLogado.IdUsuario; 

            if (model.Rota.IdRota > 0) model.Rota = Servico.AlterarRota(model.Rota);
            else model.Rota = Servico.InserirRota(model.Rota);

            if (model.Rota == null || model.Rota.IdRota <= 0) ExibirModal("Erro ao cadastrar rota.");
            else ExibirModal("Rota cadastrada com sucesso!");

            return RedirectToAction("index", model.Rota);
        }
    }
}

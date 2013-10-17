using System.Web.Mvc;
using Fusioness.Models.Rotas;
using Fusioness.FusionessWS;
using System.Collections.Generic;

namespace Fusioness.Controllers
{
    public class RotaController : BaseController
    {
        public ActionResult Index(RotaModel model)
        {
            model.ListaRotas = Servico.ListarRotasPorUsuario(this.UsuarioLogado);
            return View(model);
        }

        public ActionResult Detalhar(int Id = 0)
        {
            RotaModel model = new RotaModel();

            model.carregarParametrosView();

            model.Rota = new Rota() { IdRota = Id };
            model.Rota = Servico.ObterRotaPorId(model.Rota);

            return View("InserirAlterarRota", model);
        }

        public ActionResult InserirAlterarRota(RotaModel model)
        {
            if (model.Rota != null)
            {
                model.Rota.IdUsuario = this.UsuarioLogado.IdUsuario;

                Coordenada c1 = new Coordenada();
                c1.Latitude = -8.05076226;
                c1.Longitude = -34.87983403;

                Coordenada c2 = new Coordenada();
                c2.Latitude = -8.03076226;
                c2.Longitude = -35.87983403;

                model.Rota.Coordenadas = new Coordenada[2];

                model.Rota.Coordenadas[0] = c1;
                model.Rota.Coordenadas[1] = c2;

                if (model.Rota.IdRota > 0) model.Rota = Servico.AlterarRota(model.Rota);
                else model.Rota = Servico.InserirRota(model.Rota);

                if (model.Rota == null || model.Rota.IdRota <= 0) ExibirModal("Erro ao cadastrar rota.");
                else ExibirModal("Rota cadastrada com sucesso!");

                return RedirectToAction("index", model);
            }
            else
            {
                model.carregarParametrosView();
                return View(model);
            }
        }
      
    }
}



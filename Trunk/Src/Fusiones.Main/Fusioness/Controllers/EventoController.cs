using System.Web.Mvc;
using Fusioness.FusionessWS;
using Fusioness.Models.Eventos;
using Fusioness.FusionessWS;

namespace Fusioness.Controllers
{
    public class EventoController : BaseController
    {
        public ActionResult Index(EventoModel model)
        {
            model.ListaEventos = Servico.ListarEventos();
            return View(model);
        }


        public ActionResult Details(int Id = 0)
        {
            EventoModel model = new EventoModel();
            model.ListaRotas = Servico.ListarRotasPorUsuario(this.UsuarioLogado);
            model.Evento = new Evento() { IdEvento = Id };
            model.Evento = Servico.ObterEventoPorId(model.Evento);

            return View("InserirAlterarEvento", model);
        }

        public ActionResult InserirOuAlterarEvento(EventoModel model)
        {
            model.Evento.IdUsuario = this.UsuarioLogado.IdUsuario;

            if (model.Evento.IdEvento > 0)
            {
                //model.Evento = Servico.Alterar
            }

            /*
             if (model.Rota.IdRota > 0) model.Rota = Servico.AlterarRota(model.Rota);
            else model.Rota = Servico.InserirRota(model.Rota);

            if (model.Rota == null || model.Rota.IdRota <= 0) ExibirModal("Erro ao cadastrar rota.");
            else ExibirModal("Rota cadastrada com sucesso!");*/

            return RedirectToAction("index", model.Evento);
        }

        public ActionResult Details(EventoModel model, int? id)
        {
            model.Evento = Servico.ObterEventoPorId(new Evento{IdEvento = id.HasValue ? id.Value : 0});
            return View(model);

        }

    }
}

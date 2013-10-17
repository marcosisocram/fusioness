using System;
using System.Linq;
using System.Web.Mvc;
using Fusioness.FusionessWS;
using Fusioness.Models.Eventos;

namespace Fusioness.Controllers
{
    public class EventoController : BaseController
    {
        public ActionResult Index(EventoModel model)
        {
            model.ListaEventos = Servico.ListarEventos(new int[]{});
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

        public ActionResult Convites(EventoModel model)
        {
            var respostas = Servico.ListarRespostas();
            model.ListaConviteEventos = Servico.ObterConvitesEventosDoUsuario(UsuarioLogado);

            foreach (var convite in model.ListaConviteEventos)
                convite.Resposta = convite.IdResposta.HasValue ? respostas.First(r => r.IdResposta == convite.IdResposta) : respostas.First(r => r.IdResposta == 3);

            if (model.ListaConviteEventos.Any())
                model.ListaEventos = Servico.ListarEventos(model.ListaConviteEventos.Select(c => c.IdEvento).ToArray());
            return View(model);
        }

        public ActionResult ResponderConviteEvento(int idEvento, bool aceito)
        {
            Servico.ResponderConviteEvento(new ConviteEvento { IdEvento = idEvento }, aceito);
            return RedirectToAction("Convites");
        }

        public ActionResult ExcluirEvento(EventoModel model, int IdEvento)
        {
            Servico.RemoverEvento(new Evento() { IdEvento = IdEvento});
            return RedirectToAction("index", model);
        }

    }
}

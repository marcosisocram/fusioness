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
            model.ListaEventosQueSouDono = Servico.ListarEventosPorUsuario(UsuarioLogado);
            return View(model);
        }

        [HttpPost]
        public ActionResult InserirAlterarEvento(EventoModel model)
        {
            model.Evento.IdUsuario = this.UsuarioLogado.IdUsuario;
            model.ListaEventosQueSouDono = Servico.ListarEventosPorUsuario(UsuarioLogado);

            if (model.Evento.IdEvento > 0)
            {
                var eventoAlterado = Servico.AlterarEvento(model.Evento);
                if (eventoAlterado != null && eventoAlterado.IdEvento > 0)
                {
                    ExibirModal("Evento alterado com sucesso.");
                    return RedirectToAction("index");
                }

                ExibirModal("Não foi possível efetuar a alteração. Por favor verifique se preencheu corretamente os campos.");
                return InserirAlterarEvento(model.Evento.IdEvento);
            }

            return RedirectToAction("index");
        }

        [HttpGet]
        public ActionResult InserirAlterarEvento(int idEvento = 0)
        {
            var model = new EventoModel();
            model.ListaRotas = Servico.ListarRotasPorUsuario(UsuarioLogado);
            model.Evento = Servico.ObterEventoPorId(new Evento { IdEvento = idEvento });
            model.ListaEventosQueSouDono = Servico.ListarEventosPorUsuario(UsuarioLogado);

            return View("InserirAlterarEvento", model);
        }

        public ActionResult Convites(EventoModel model)
        {
            model.RespostasPossiveis = Servico.ListarRespostas();
            model.ListaConviteEventos = Servico.ObterConvitesEventosDoUsuario(UsuarioLogado);

            foreach (var convite in model.ListaConviteEventos)
                convite.Resposta = convite.IdResposta.HasValue ? model.RespostasPossiveis.First(r => r.IdResposta == convite.IdResposta) : model.RespostasPossiveis.First(r => r.IdResposta == 3);

            if (model.ListaConviteEventos.Any())
                model.ListaEventos = Servico.ListarEventos(model.ListaConviteEventos.Select(c => c.IdEvento).ToArray());
            return View(model);
        }

        public ActionResult ResponderConviteEvento(int idEvento, int idResposta)
        {
            Servico.ResponderConviteEvento(new ConviteEvento { IdEvento = idEvento }, new Resposta{ IdResposta = idResposta});
            return RedirectToAction("Convites");
        }

        public ActionResult ExcluirEvento(EventoModel model, int idEvento)
        {
            Servico.RemoverEvento(new Evento { IdEvento = idEvento });
            return RedirectToAction("index", model);
        }

    }
}

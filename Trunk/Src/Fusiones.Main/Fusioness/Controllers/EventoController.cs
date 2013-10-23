using System;
using System.Collections;
using System.Collections.Generic;
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

            if (model.Evento.IdEvento > 0)
            {
                var eventoAlterado = Servico.AlterarEvento(model.Evento);
                if (eventoAlterado != null && eventoAlterado.IdEvento > 0)
                {
                    ExibirModal("Evento alterado com sucesso.");
                    return View(model);
                }

                ExibirModal("Não foi possível efetuar a alteração. Por favor verifique se preencheu corretamente os campos.");
                return View(model);
            }
            else
            {
                var eventoCadastrado = Servico.InserirEvento(model.Evento);

                if (eventoCadastrado != null && eventoCadastrado.IdEvento > 0)
                {
                    ExibirModal("Evento cadastrado com sucesso.");
                    return RedirectToAction("Index");
                }

                ExibirModal("Não foi possível efetuar a alteração. Por favor verifique se preencheu corretamente os campos.");
                return RedirectToAction("Index");
            }
        }

        [HttpGet]
        public ActionResult InserirAlterarEvento()
        {
            var model = new EventoModel();
            model.ListaRotas = Servico.ListarRotasPorUsuario(UsuarioLogado);
            model.Evento = new Evento();
            model.IsCadastroEvento = true;

            return View("InserirAlterarEvento", model);
        }

        public ActionResult Detalhar(int idEvento = 0)
        {
            if (idEvento == 0) return RedirectToAction("Index");

            var model = new EventoModel();
            model.Evento = Servico.ObterEventoPorId(new Evento { IdEvento = idEvento });
            model.ListaRotas = Servico.ListarRotasPorUsuario(UsuarioLogado);
            model.ListaEventosQueSouDono = Servico.ListarEventosPorUsuario(UsuarioLogado);
            model.ListaComentariosEvento = Servico.ListarComentariosPorEvento(new Evento { IdEvento = idEvento });

            var idsContatos = Servico.ListarContatosDoUsuario(UsuarioLogado).ToList().Select(c => c.IdContato).ToList();
            if (idsContatos.Any()) model.ListaDeContatosDoUsuario = Servico.ObterUsuariosIds(idsContatos.ToArray()).ToList();

            return View("InserirAlterarEvento", model);
        }

        public ActionResult VerConvitesEvento(EventoModel model)
        {
            model.RespostasPossiveis = Servico.ListarRespostas();
            model.ListaConviteEventos = Servico.ObterConvitesEventosDoUsuario(UsuarioLogado);

            foreach (var convite in model.ListaConviteEventos)
                convite.Resposta = convite.IdResposta.HasValue ? model.RespostasPossiveis.First(r => r.IdResposta == convite.IdResposta) : model.RespostasPossiveis.First(r => r.IdResposta == 3);

            if (model.ListaConviteEventos.Any())
                model.ListaEventos = Servico.ListarEventos(model.ListaConviteEventos.Select(c => c.IdEvento).ToArray());
            return View("Convites", model);
        }

        public ActionResult ResponderConviteEvento(int idEvento, int idResposta)
        {
            Servico.ResponderConviteEvento(new ConviteEvento { IdEvento = idEvento, IdContato = UsuarioLogado.IdUsuario}, new Resposta{ IdResposta = idResposta});
            return RedirectToAction("VerConvitesEvento");
        }

        public ActionResult ExcluirEvento(EventoModel model)
        {
            Servico.RemoverEvento(model.Evento);
            return RedirectToAction("index", model);
        }

        public ActionResult Convidar(int[] idsAmigos, EventoModel model)
        {
            if (idsAmigos != null && idsAmigos.Any())
            {
                var convites = Servico.ConvidarUsuarios(UsuarioLogado, model.Evento, idsAmigos);
                if (convites == null)
                {
                    ExibirModal("Não foi possível efetuar parte dos convites.");
                    return Detalhar(model.Evento.IdEvento);
                }
            }

            ExibirModal("Convites feitos.");
            return RedirectToAction("Index");
        }
    }
}

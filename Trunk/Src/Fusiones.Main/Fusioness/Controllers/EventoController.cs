﻿using System;
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
        #region Evento
        public ActionResult Index(EventoModel model)
        {
            model.carregarParametrosView(UsuarioLogado, null);
            return View(model);
        }

        public ActionResult Explore(EventoModel model)
        {
            double latitude = Double.Parse(Request.QueryString["latitude"]);
            double longitude = Double.Parse(Request.QueryString["longitude"]);
            model.carregarParametrosViewExplore(UsuarioLogado, null, latitude, longitude);
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
            model.Evento = new Evento();

            model.carregarParametrosView(UsuarioLogado, null);

            model.IsCadastroEvento = true;

            return View("InserirAlterarEvento", model);
        }

        public ActionResult Detalhar(int idEvento = 0)
        {
            if (idEvento == 0) return RedirectToAction("Index");

            var model = new EventoModel();
            model.Evento = Servico.ObterEventoPorId(new Evento { IdEvento = idEvento });

            model.carregarParametrosView(UsuarioLogado, model.Evento);

            return View("InserirAlterarEvento", model);
        }


        public ActionResult ExcluirEvento(int idEvento = 0)
        {
            Servico.RemoverEvento(new Evento { IdEvento = idEvento });
            ExibirModal("Evento excluído com sucesso.");

            return RedirectToAction("index", new EventoModel());
        }

        #endregion

        #region Convites
        public ActionResult VerConvitesEvento(EventoModel model)
        {
            model.RespostasPossiveis = Servico.ListarRespostas();
            model.ListaConviteEventos = Servico.ObterConvitesEventosDoUsuario(UsuarioLogado);

            foreach (var convite in model.ListaConviteEventos)
                convite.Resposta = convite.IdResposta.HasValue ? model.RespostasPossiveis.First(r => r.IdResposta == convite.IdResposta) : new Resposta{Descricao = "Sem resposta"};

            if (model.ListaConviteEventos.Any())
                model.ListaEventos = Servico.ListarEventos(model.ListaConviteEventos.Select(c => c.IdEvento).ToArray());
            return View("Convites", model);
        }



        public ActionResult Convidar(int[] idsAmigos, EventoModel model)
        {
            if (idsAmigos != null && idsAmigos.Any() && model.Evento != null && model.Evento.IdEvento > 0)
            {
                var convites = Servico.ConvidarUsuarios(UsuarioLogado, model.Evento, idsAmigos);
                if (convites == null) return Json(false);
            }
            else return Json(false);

            return Json(true);
        }


        public ActionResult ResponderConviteEvento(int idEvento, int idResposta)
        {
            Servico.ResponderConviteEvento(new ConviteEvento { IdEvento = idEvento, IdContato = UsuarioLogado.IdUsuario }, new Resposta { IdResposta = idResposta });
            return RedirectToAction("VerConvitesEvento");
        }

        #endregion

        #region Comentario

        public ActionResult InserirComentario(EventoModel model)
        {
            model.Comentario.Data = DateTime.Now;
            model.Comentario.IdUsuario = UsuarioLogado.IdUsuario;

            var comentario = Servico.InserirComentarioEvento(model.Comentario);

            ExibirModal("Seu comentário foi salvo com sucesso.");

            return RedirectToAction("Detalhar", new { idEvento = comentario.IdEvento });
        }

        public ActionResult ExcluirComentario(int idComentario = 0)
        {
            ComentarioEvento comentario = Servico.ObterComentarioEventoPorId(new ComentarioEvento { IdComentarioEvento = idComentario });

            Servico.RemoverComentarioEvento(comentario);
            ExibirModal("Comentário excluído com sucesso.");

            return RedirectToAction("Detalhar", new {idEvento = comentario.IdEvento});
        }

        #endregion
    }
}

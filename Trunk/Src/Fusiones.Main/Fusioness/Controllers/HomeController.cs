﻿using System.IO;
using System.Web;
using System.Web.Mvc;
using Fusioness.Models.Home;
using System.Linq;
using System;
using System.Text;
using System.Threading.Tasks;

namespace Fusioness.Controllers
{
    public class HomeController : BaseController
    {
        public ActionResult Index(IndexModel model)
        {
            var usuario = BaseController.ObterUsuarioLogado(HttpContext);
            var ConvitesAmizade = Servico.ListarConvitesDoUsuario(usuario);
            var ConvitesEvento = Servico.ObterConvitesEventosDoUsuario(usuario);
            model = new IndexModel();
            model.ConvitesNaoConfirmados = Servico.ObterUsuariosIds(ConvitesAmizade.Select(c => c.IdUsuario).ToArray()).ToList();

            model.User = usuario;
            
            if (ConvitesEvento.Any(c => !c.IdResposta.HasValue))
            {
                model.EventosNaoConfirmados = Servico.ListarEventos(ConvitesEvento.Where(c => !c.IdResposta.HasValue).Select(c => c.IdEvento).ToArray()).ToList();
            }
            else
            {
                model.EventosNaoConfirmados = null;
            }
            return View(model);
        }

        public ActionResult DoSomething(IndexModel model)
        {
            return RedirectToAction("index");
        }

        public async Task<ActionResult> ConvidarPorEmail(string emails)
        {
            try
            {
                if (String.IsNullOrWhiteSpace(emails))
                {
                    throw new Exception("E-mails em branco.");
                }
                char[] separador = new char[] { ',' };
                var VetorEmails = emails.Split(separador, StringSplitOptions.RemoveEmptyEntries);
                var EmailsInvalidos = VetorEmails.Where(c => !System.Text.RegularExpressions.Regex.IsMatch(c, @"^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$"));
                if (EmailsInvalidos.Any())
                {
                    StringBuilder sb = new StringBuilder();
                    sb.Append("São e-mails inválidos: ");
                    EmailsInvalidos.ToList().ForEach(c =>
                    {
                        sb.AppendFormat("{0},", c);
                    });
                    throw new Exception(sb.ToString().TrimEnd(separador));
                }
                else
                {
                    string srt = HttpContext.Request.Url.PathAndQuery;
                    string url = HttpContext.Request.Url.AbsoluteUri.Replace(srt, "/");
                    var task = Task.Run(() => Servico.ConvidarPorEmailAsync(VetorEmails, url,BaseController.ObterUsuarioLogado(HttpContext)));
                }
                ExibirModal("Continue convidando mais amigos para nossa rede.");
            }
            catch (Exception e)
            {
                ExibirModal(e.Message);
            }
            return RedirectToAction("Index");
        }
    }
}

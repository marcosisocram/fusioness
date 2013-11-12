using System.IO;
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
            if (ConvitesEvento.Any())
            {
                model.EventosNaoConfirmados = Servico.ListarEventos(ConvitesEvento.Select(c => c.IdEvento).ToArray()).ToList();
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
        

        public ActionResult EnviarImagem(HttpPostedFileBase image)
        {
            string retorno = string.Empty;
            try
            {
                var validaImagem = new ValidarImagem(image);
                if (validaImagem.IsImagemValida)
                {
                    var ms = new MemoryStream();
                    image.InputStream.CopyTo(ms);
                    byte[] bytes = ms.ToArray();
                    var usuario = BaseController.ObterUsuarioLogado(Request.RequestContext.HttpContext);
                    string fs = Servico.InserirFotoUsuario(usuario, image.FileName, bytes);
                    usuario.UrlImagem = fs;
                    ExibirModal("Imagem enviada com sucesso.");
                }
                else
                {
                    throw new Exception(validaImagem.Retorno);
                }
            }
            catch(Exception e) 
            {
                ExibirModal(e.Message);
            }
            return RedirectToAction("Index");
        }

        public ActionResult ConvidarAmigosGMail()
        {
            return RedirectToAction("Index");
        }
    }
}

using System.IO;
using System.Web;
using System.Web.Mvc;
using Fusioness.Models.Home;
using System.Linq;
using System;

namespace Fusioness.Controllers
{
    public class HomeController : BaseController
    {
        public ActionResult Index(IndexModel model)
        {
            var usuario = BaseController.ObterUsuarioLogado(HttpContext);
            var convites = Servico.ListarConvitesDoUsuario(usuario);
            model = new IndexModel();
            model.ContatosNaoConfirmados = Servico.ObterUsuariosIds(convites.Select(c => c.IdUsuario).ToArray()).ToList();
            return View(model);
        }

        public ActionResult DoSomething(IndexModel model)
        {
            //Servico.DoSomething()
            return RedirectToAction("index");
        }


        public ActionResult ConvidarPorEmail(string email)
        {
            string retorno = string.Empty;
            try
            {
                if (System.Text.RegularExpressions.Regex.IsMatch(email, @"^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$"))
                {
                    string srt = HttpContext.Request.Url.PathAndQuery;
                    string url = HttpContext.Request.Url.AbsoluteUri.Replace(srt, "/");
                    Servico.ConvidarPorEmail(email, url);
                }
                else 
                {
                    ExibirModal("Formato de email invalido!");
                }
            }
            catch(Exception e) 
            {
                retorno = string.Format("Aconteceu um erro inesperado. Mensagem de erro: {0}.", e.Message);
            }
            return RedirectToAction("Index");
        }
        

        public ActionResult EnviarImagem(HttpPostedFileBase image)
        {
            string retorno = string.Empty;
            try
            {
                if (image == null || image.ContentLength <= 0)
                {
                    retorno = "Não foi selecionado nenhum arquivo.";
                }
                else if (!image.ContentType.ToLower().Contains("image"))
                {
                    retorno = "O arquivo selecionado não é uma imagem.";
                }
                else
                {
                    var ms = new MemoryStream();
                    image.InputStream.CopyTo(ms);
                    byte[] bytes = ms.ToArray();
                    var usuario = BaseController.ObterUsuarioLogado(Request.RequestContext.HttpContext);
                    string fs = Servico.InserirFotoUsuario(usuario, image.FileName, bytes);
                    usuario.UrlImagem = fs;
                }
            }
            catch(Exception e) 
            {
                retorno = string.Format("Aconteceu um erro inesperado. Mensagem de erro: {0}.", e.Message);
            }
            if (!string.IsNullOrEmpty(retorno)) { ExibirModal(retorno); }
            return RedirectToAction("Index");
        }
    }
}

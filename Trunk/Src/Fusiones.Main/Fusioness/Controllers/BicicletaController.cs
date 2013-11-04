using System.Web.Mvc;
using Fusioness.Models.Bicicletas;
using System.Linq;
using Fusioness.FusionessWS;
using System.Web;
using System.IO;
using System;

namespace Fusioness.Controllers
{
    public class BicicletaController : BaseController
    {
        public ActionResult Index(BicicletaModel model)
        {
            
            var usuario = BaseController.ObterUsuarioLogado(Request.RequestContext.HttpContext);
            var bicicletas = Servico.ListarBicicletasPorUsuario(usuario).OrderBy(b=>b.Marca).ThenBy(b=>b.Modelo).ToArray();
            model.ListaBicicletasPorUsuario = bicicletas.ToList();
            return View("index", model);
        }

        
        public ActionResult InserirAlterarBicicleta(BicicletaModel model)
        {

            var usuario = BaseController.ObterUsuarioLogado(Request.RequestContext.HttpContext);
            var bicicletas = Servico.ListarBicicletasPorUsuario(usuario);
            model.ListaBicicletasPorUsuario = bicicletas.ToList();
            
            if (model.ValidarBicicleta(ModelState))
            {
                
                model.Bicicleta.IdUsuario = usuario.IdUsuario;
                if (model.Bicicleta.IdBicicleta > 0)
                {
                    model.Bicicleta = Servico.AlterarBicicleta(model.Bicicleta);
                }
                else
                {
                    model.Bicicleta = Servico.InserirBicicleta(model.Bicicleta);
                }
                // model.Bicicleta = null;
                return RedirectToAction("Index", model);
            }
            else
            {
                return View("InserirAlterarBicicleta", model);
            }
        }

        public ActionResult InserirBicicleta()
        {
            var model = new BicicletaModel();
            model.Bicicleta = new Bicicleta();

            return View("InserirAlterarBicicleta", model);
        }
        

        /*
         public ActionResult EditarBicicleta(BicicletaModel model, int IdBicicleta)
        {
            model.Bicicleta = Servico.ObterBicicletaPorId(new Bicicleta() {IdBicicleta=IdBicicleta });
            var usuario = BaseController.ObterUsuarioLogado(Request.RequestContext.HttpContext);
            var bicicletas = Servico.ListarBicicletasPorUsuario(usuario);
            model.ListaBicicletasPorUsuario = bicicletas.ToList();
            return View("InserirAlterarBicicleta", model);
        }
         */

        public ActionResult EditarBicicleta(int IdBicicleta)
        {
            if (IdBicicleta == 0) return RedirectToAction("Index");

            var model = new BicicletaModel();
            model.Bicicleta = Servico.ObterBicicletaPorId(new Bicicleta() { IdBicicleta = IdBicicleta });
            
            return View("InserirAlterarBicicleta", model);
        }

        public ActionResult ExcluirBicicleta(BicicletaModel model, int IdBicicleta)
        {
            Servico.RemoverBicicleta(new Bicicleta() {IdBicicleta=IdBicicleta });
            return RedirectToAction("index", model);
        }

        public ActionResult EnviarImagem(HttpPostedFileBase image, int idbicicleta)
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
                    var bicicleta = Servico.ObterBicicletaPorId(new Bicicleta() { IdBicicleta = idbicicleta });
                    bicicleta.UrlImagem = Servico.InserirFotoBicicleta(bicicleta, image.FileName, bytes);
                }
            }
            catch (Exception e)
            {
                retorno = string.Format("Aconteceu um erro inesperado. Mensagem de erro: {0}.", e.Message);
            }
            if (!string.IsNullOrEmpty(retorno)) { ExibirModal(retorno); }
            return RedirectToAction("Index");
        }
    }
}

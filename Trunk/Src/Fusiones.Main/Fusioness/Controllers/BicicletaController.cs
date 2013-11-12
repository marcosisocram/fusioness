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
            var bicicletas = Servico.ListarBicicletasPorUsuario(usuario).OrderBy(b => b.Marca).ThenBy(b => b.Modelo).ToArray();
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
                    var bicicletaAlterada = Servico.AlterarBicicleta(model.Bicicleta);

                    if (model.Bicicleta.StatusRetorno == 0)
                    {
                        model.Bicicleta = bicicletaAlterada;
                        ExibirModal("Sua bicicleta foi alterada!");
                        return RedirectToAction("Index");
                    }
                    else
                    {
                        ExibirModal("Não foi possível efetuar a alteração, tente novamente!");
                        return View(model);
                    }
                }
                else
                {
                    model.Bicicleta.UrlImagem = "bike.jpg";
                    var bicicletaCadastrada = Servico.InserirBicicleta(model.Bicicleta);

                    if (bicicletaCadastrada.StatusRetorno == 0)
                    {
                        ExibirModal("Sua bicicleta foi cadastrada com sucesso!");
                        return RedirectToAction("Index");
                    }
                    else
                    {
                        ExibirModal("Não foi possível efetuar a alteração, tente novamente!");
                        return View(model);
                    }

                }
            }
            else
            {
                return View("InserirAlterarBicicleta", model);
            }
        }

        [HttpGet]
        public ActionResult InserirAlterarBicicleta()
        {
            var model = new BicicletaModel();
            model.Bicicleta = new Bicicleta();

            return View("InserirAlterarBicicleta", model);
        }

        public ActionResult Detalhar(int IdBicicleta = 0)
        {
            if (IdBicicleta == 0) return RedirectToAction("Index");

            var model = new BicicletaModel();
            model.Bicicleta = Servico.ObterBicicletaPorId(new Bicicleta() { IdBicicleta = IdBicicleta });

            return View("InserirAlterarBicicleta", model);
        }

        public ActionResult ExcluirBicicleta(BicicletaModel model, int IdBicicleta)
        {
            Bicicleta bicicletaRemover = Servico.RemoverBicicleta(new Bicicleta() { IdBicicleta = IdBicicleta });

            if (bicicletaRemover.StatusRetorno == 0)
            {
                ExibirModal("Sua bicicleta foi excluída... Cadastre logo outra!");
                return RedirectToAction("index", model);    
            }
            else
            {
                ExibirModal("Ocorreu algum erro na exclusão de sua bicicleta, tente novamente.");
                return RedirectToAction("index", model);       
            }
        }

        public ActionResult EnviarImagem(HttpPostedFileBase image, int idbicicleta)
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
                    var bicicleta = Servico.ObterBicicletaPorId(new Bicicleta() { IdBicicleta = idbicicleta });
                    bicicleta = Servico.InserirFotoBicicleta(bicicleta, image.FileName, bytes);
                    ExibirModal("Imagem enviada com sucesso.");
                }
                else
                {
                    throw new Exception(validaImagem.Retorno);
                }
            }
            catch (Exception e)
            {
                ExibirModal(e.Message);
            }
            return RedirectToAction("Index");
        }
    }
}

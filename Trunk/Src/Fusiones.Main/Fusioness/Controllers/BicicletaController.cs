using System.Web.Mvc;
using Fusioness.Models.Bicicletas;
using System.Linq;
using Fusioness.FusionessWS;

namespace Fusioness.Controllers
{
    public class BicicletaController : BaseController
    {
        public ActionResult Index(BicicletaModel model)
        {
            //if (!string.IsNullOrWhiteSpace(model.Mensagem)) ExibirModal(model.Mensagem);
            var usuario = BaseController.ObterUsuarioLogado(Request.RequestContext.HttpContext);
            var bicicletas = Servico.ListarBicicletasPorUsuario(usuario);
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
                return RedirectToAction("index", model);
            }
            else
            {                
                return View("index", model);
            }
        }

        public ActionResult EditarBicicleta(BicicletaModel model, int IdBicicleta)
        {
            model.Bicicleta = Servico.ObterBicicletaPorId(new Bicicleta() {IdBicicleta=IdBicicleta });
            var usuario = BaseController.ObterUsuarioLogado(Request.RequestContext.HttpContext);
            var bicicletas = Servico.ListarBicicletasPorUsuario(usuario);
            model.ListaBicicletasPorUsuario = bicicletas.ToList();
            return View("index", model);
        }

        public ActionResult ExcluirBicicleta(BicicletaModel model, int IdBicicleta)
        {
            Servico.RemoverBicicleta(new Bicicleta() {IdBicicleta=IdBicicleta });
            return RedirectToAction("index", model);
        }
    }
}

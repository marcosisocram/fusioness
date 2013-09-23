using System.Web.Mvc;
using Fusioness.Models.Rotas;
using Fusioness.FusionessWS;

namespace Fusioness.Controllers
{
    public class RotaController : BaseController
    {
        public ActionResult Index(RotaModel model)
        {
            model.RotasDoUsuario = Servico.GetRotas(4);
            model.TiposDeRotas = Servico.CarregarTipoRotas();

            return View(model);
        }

        public ActionResult QualificarRota(RotaModel model)
        {
            var rota = new Rota
            {
                IdRota = model.RotaSelecionada.IdRota,
                IdTipoRota = model.TiposDeRotaSelecionada.IdTipoRota,
                IdUsuario = UsuarioLogado.IdUsuario
            };

            model.RotaSelecionada = Servico.QualificarRota(rota);
            return RedirectToAction("index");
        }
    }
}

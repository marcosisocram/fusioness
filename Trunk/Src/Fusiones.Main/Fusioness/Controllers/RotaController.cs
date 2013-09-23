using System.Web.Mvc;
using Fusioness.Entities;
using Fusioness.Models.Rotas;
using Fusioness.Models.Util;

namespace Fusioness.Controllers
{
    public class RotaController : BaseController
    {
        public ActionResult Index(RotaModel model)
        {
            model.RotasDoUsuario = Servico.GetRotas(4).GetEntity<FusionessWS.Rota, Rota>();
            model.TiposDeRotas = Servico.CarregarTipoRotas().GetEntity<FusionessWS.TipoRota, TipoRota>();

            return View(model);
        }

        public ActionResult QualificarRota(RotaModel model)
        {
            var rota = new Rota
            {
                IdRota = model.RotaSelecionada.IdRota,
                IdTipoRota = model.TiposDeRotaSelecionada.IdTipoRota,
                IdUsuario = UsuarioLogado.IdUsuario
            }.GetEntityService<Rota, FusionessWS.Rota>();

            model.RotaSelecionada = Servico.QualificarRota(rota).GetEntity<FusionessWS.Rota, Rota>();
            return RedirectToAction("index");
        }
    }
}

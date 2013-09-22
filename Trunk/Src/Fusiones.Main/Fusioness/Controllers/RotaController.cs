using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Fusioness.Entities;
using Fusioness.FusionessWS;
using Fusioness.Models.Rotas;

namespace Fusioness.Controllers
{
    public class RotaController : BaseController
    {
        public ActionResult Index(RotaModel model)
        {
            var rotasUsuario = Servico.GetRotas(4);
            var tiposDeRota = Servico.CarregarTipoRotas();

            model.RotasDoUsuario = Serializer.Deserialize<IList<Rota>>(rotasUsuario);
            model.TiposDeRotas = Serializer.Deserialize<IList<TipoRota>>(tiposDeRota);

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

            Servico.QualificarRota(Serializer.Serialize(rota));
            return RedirectToAction("index");
        }
    }
}

using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Fusioness.FusionessWS;
using Fusioness.Models.Bicicletas;
using Fusioness.Entities;
using System.Web.Script.Serialization;

namespace Fusioness.Controllers
{
    public class BicicletaController : BaseController
    {
        public ActionResult Index(BicicletaModel model)
        {
            if (!string.IsNullOrWhiteSpace(model.Mensagem)) ExibirModal(model.Mensagem);
            return View();
        }

        public ActionResult InsertBicicleta(BicicletaModel model)
        {
            model.Bicicleta.IdUsuario = 7;
            string bicicletaSerializado = Serializer.Serialize(model.Bicicleta);

            model.Mensagem = Servico.InsertBicicleta(bicicletaSerializado);
            return RedirectToAction("index", model);
        }
    }
}

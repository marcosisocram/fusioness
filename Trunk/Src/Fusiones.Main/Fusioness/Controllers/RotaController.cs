using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Fusioness.FusionessWS;
using Fusioness.Models.Rotas;

namespace Fusioness.Controllers
{
    public class RotaController : Controller
    {
        //
        // GET: /Bicicleta/

        public ActionResult Index()
        {
            return View();
        }

        public ActionResult QualificarRota(IndexModel model)
        {
            MainService service = new MainService();

            TempData["MSG"] = service.QualificarRota(model.rota.IdRota, model.rota.IdTipoRota);
            return RedirectToAction("index");
        }
    }
}

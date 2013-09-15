using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Fusioness.FusionessWS;
using Fusioness.Models.Bicicletas;

namespace Fusioness.Controllers
{
    public class BicicletaController : Controller
    {
        //
        // GET: /Bicicleta/

        public ActionResult Index()
        {
            return View();
        }

        public ActionResult InsertBicicleta(IndexModel model)
        {
            MainService service = new MainService();

            TempData["MSG"] = service.InsertBicicleta(model.bicicleta.Marca, model.bicicleta.Modelo);
            return RedirectToAction("index");
        }
    }
}

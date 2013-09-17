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

        public ActionResult InsertBicicleta(BicicletaModel model)
        {
            MainService service = new MainService();
            int idUsuario = 7;
            TempData["MSG"] = service.InsertBicicleta(model.Bicicleta.Marca, model.Bicicleta.Modelo, idUsuario);
            return RedirectToAction("index");
        }
    }
}

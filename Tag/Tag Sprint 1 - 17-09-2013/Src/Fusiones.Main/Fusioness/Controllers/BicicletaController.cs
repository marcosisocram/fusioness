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

            model.Bicicleta.IdUsuario = 7;
            string bicicletaSerializado = new JavaScriptSerializer().Serialize(model.Bicicleta);            
            
            TempData["MSG"] = service.InsertBicicleta(bicicletaSerializado);
            return RedirectToAction("index");
        }
    }
}

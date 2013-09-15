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
        public ActionResult Index()
        {
            MainService service = new MainService();
            //ViewData["rotasUsuario"] = new Fusioness.Models.Rotas.IndexModel().rotasUsuario;
            //ViewData["tiposDeRota"] = new Fusioness.Models.Rotas.IndexModel().tiposRota;
            var rotasUsuario = from x in service.GetRotas(4).Split(".".ToArray(),StringSplitOptions.RemoveEmptyEntries)
                               let z = x.Split(':')
                               select new
                                   {
                                       IdRota = z.FirstOrDefault()
                                   };
            var tiposDeRota = from x in service.CarregarTipoRotas().Split(".".ToArray(), StringSplitOptions.RemoveEmptyEntries)
                              let z = x.Split(':')
                              select new
                              {
                                  IdTipoRota = z.ElementAt(0),
                                  Descricao = z.ElementAt(1),
                              };
            ViewData["rotasUsuario"] = rotasUsuario;
            ViewData["tiposDeRota"] = tiposDeRota;
            return View();
        }

        public ActionResult QualificarRota(string IdRota, string IdTipoRota)
        {
            MainService service = new MainService();
            TempData["MSG"] = service.QualificarRota(Convert.ToInt32(IdRota), Convert.ToInt32(IdTipoRota), 4);
            return RedirectToAction("index");
        }
    }
}

using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Fusioness.FusionessWS;
using Fusioness.Models.Home;

namespace Fusioness.Controllers
{
    public class HomeController : BaseController
    {
        public ActionResult Index()
        {
            return View(new IndexModel());
        }

        public ActionResult DoSomething(IndexModel model)
        {
            return RedirectToAction("index");
        }
    }
}

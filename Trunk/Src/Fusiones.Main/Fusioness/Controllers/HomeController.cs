using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Fusioness.Business;
using Fusioness.Models.Home;

namespace Fusioness.Controllers
{
    public class HomeController : Controller
    {
        public ActionResult Index()
        {
            return View(new IndexModel());
        }

        public ActionResult DoSomething(IndexModel model)
        {
            Facade.Instance.DoSomething(model.User);

            return RedirectToAction("index");
        }
    }
}

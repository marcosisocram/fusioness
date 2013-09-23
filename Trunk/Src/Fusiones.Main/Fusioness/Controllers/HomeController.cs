using System.Web.Mvc;
using Fusioness.Models.Home;

namespace Fusioness.Controllers
{
    public class HomeController : BaseController
    {
        public ActionResult Index(IndexModel model)
        {
            return View(model);
        }

        public ActionResult DoSomething(IndexModel model)
        {
            //Servico.DoSomething()
            return RedirectToAction("index");
        }
    }
}

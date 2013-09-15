using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Fusioness.FusionessWS;
using Fusioness.Models.Contatos;

namespace Fusioness.Controllers
{
    public class ContatoController : Controller
    {
        //public ActionResult Index()
        //{
        //    return View(new IndexModel());
        //}

        public ActionResult CarregarContatos(IndexModel model)
        {
            MainService service = new MainService();
            TempData["MSG"] = service.CarregarContatos(1);
            string[] lst = service.CarregarContatos(1).Split('|');
            SelectList list = new SelectList(lst);
            ViewBag.myList = list;
            return RedirectToAction("index");
        }

        public ActionResult Index()
        {
            MainService service = new MainService();
            TempData["MSG"] = service.CarregarContatos(1);
            string[] lst = service.CarregarContatos(1).Split(new[] { '|' }, StringSplitOptions.RemoveEmptyEntries);

            Dictionary<string, int> dic = new Dictionary<string, int>();
            int index = lst.Length;
            for (int i = 0; i < index; i = i + 2)
            {
                dic.Add(lst[i], Convert.ToInt32(lst[i + 1]));
            }
            SelectList list = new SelectList(dic);
            ViewBag.myList = list;
            ViewData["Nomes"] = list;
            return View();
        }
    }
}

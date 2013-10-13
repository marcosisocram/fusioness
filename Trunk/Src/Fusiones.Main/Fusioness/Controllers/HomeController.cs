﻿using System.IO;
using System.Web;
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

        public ActionResult EnviarImagem(HttpPostedFileBase image)
        {
            try
            {
                if (image!=null && image.ContentLength > 0)
                {
                    var ms = new MemoryStream();
                    image.InputStream.CopyTo(ms);
                    byte[] bytes = ms.ToArray();
                    string fs = Servico.InserirFotoUsuario(BaseController.ObterUsuarioLogado(Request.RequestContext.HttpContext), image.FileName, bytes);
                }
            }
            catch 
            {
            }
            return View("index");
        }
    }
}

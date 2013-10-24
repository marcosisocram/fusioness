using System.IO;
using System.Web;
using System.Web.Mvc;
using Fusioness.Models.Home;
using System.Linq;

namespace Fusioness.Controllers
{
    public class HomeController : BaseController
    {
        public ActionResult Index(IndexModel model)
        {
            var usuario = BaseController.ObterUsuarioLogado(HttpContext);
            var convites = Servico.ListarConvitesDoUsuario(usuario);
            model.ContatosNaoConfirmados = Servico.ObterUsuariosIds(convites.Select(c => c.IdUsuario).ToArray()).ToList();
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
                    var usuario = BaseController.ObterUsuarioLogado(Request.RequestContext.HttpContext);
                    string fs = Servico.InserirFotoUsuario(usuario, image.FileName, bytes);
                    usuario.UrlImagem = fs;
                }
            }
            catch 
            {
            }

            return View("index");
        }
    }
}

using System.Collections.Generic;
using System.Web.Mvc;
using Fusioness.Entities;
using Fusioness.Models.Contatos;

namespace Fusioness.Controllers
{
    public class ContatoController : BaseController
    {
        public ActionResult Index(ContatoModel model)
        {
            var usuariosSerializados = Servico.CarregarContatos(UsuarioLogado.IdUsuario);
            model.ListaDeUsuarios = Serializer.Deserialize<IList<Usuario>>(usuariosSerializados);
            return View(model);
        }

        public ActionResult AdicionarContato(ContatoModel model)
        {
            //TODO: IMPLEMENTAR ROTINA
            return RedirectToAction("Index", model);
        }
    }
}

using System.Web.Mvc;
using Fusioness.FusionessWS;
using Fusioness.Models.Eventos;

namespace Fusioness.Controllers
{
    public class EventoController : BaseController
    {
        public ActionResult Index(EventoModel model)
        {
            model.ListaEventos = Servico.ListarEventos();
            return View(model);
        }

        public ActionResult Details(EventoModel model, int? id)
        {
            model.Evento = Servico.ObterEventoPorId(new Evento{IdEvento = id.HasValue ? id.Value : 0});
            return View(model);
        }

    }
}

using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
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

        public ActionResult Details(EventoModel model)
        {
            model.Evento = Servico.ObterEventoPorId(model.Evento);
            return View(model);
        }

    }
}

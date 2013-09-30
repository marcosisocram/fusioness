using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Fusioness.Models;

namespace Fusioness.Controllers
{
    public class EventoController : BaseController
    {
        //
        // GET: /Evento/

        public ActionResult Index()
        {
            Models.Eventos.EventoModel eventoModel = new Models.Eventos.EventoModel();
            eventoModel.eventos = Servico.CarregarEventos().ToList();
            return View(eventoModel);
        }

        public ActionResult Details(int id)
        {
            Models.Eventos.EventoModel eventoModel = new Models.Eventos.EventoModel();
            eventoModel.eventoSelecionado = Servico.ObterEventoPorId(id);
            return View(eventoModel);
        }

    }
}

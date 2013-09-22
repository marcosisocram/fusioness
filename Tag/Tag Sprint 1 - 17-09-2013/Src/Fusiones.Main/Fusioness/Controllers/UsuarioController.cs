﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Fusioness.FusionessWS;
using Fusioness.Models.Usuarios;

namespace Fusioness.Controllers
{
    public class UsuarioController : Controller
    {
        public ActionResult Index()
        {
            return View(new UsuarioModel());
        }

        public ActionResult Contato()
        {
            return View(new UsuarioModel());
        }

        public ActionResult InsertUsuario(UsuarioModel model)
        {
            MainService service = new MainService();
            TempData["MSG"] = service.InsertUsuario(model.Usuario.Nome, model.Usuario.Login, model.Usuario.Senha, model.Usuario.Email, model.Usuario.Idade.Value, model.Usuario.Sexo[0], model.Usuario.UrlImagem);
            return RedirectToAction("index");
        }

        public ActionResult UpdateUsuario(UsuarioModel model)
        {
            MainService service = new MainService();
            //TempData["MSG"] = service.UpdateUsuario(model.Usuario.IdUsuario, model.Usuario.Nome, model.Usuario.Login, model.Usuario.Senha, model.Usuario.Email, model.Usuario.Idade.Value, model.Usuario.Sexo[0], model.Usuario.UrlImagem);
            return RedirectToAction("index");
        
        }


    }
}
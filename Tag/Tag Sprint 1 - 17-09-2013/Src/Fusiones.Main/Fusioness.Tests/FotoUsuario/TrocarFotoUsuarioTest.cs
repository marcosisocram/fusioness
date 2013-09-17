﻿using System;
using Fusioness.Entities;
using Fusioness.Business.Usuarios;
using Microsoft.VisualStudio.TestTools.UnitTesting;

namespace Fusioness.Tests.AdcFotosUsuario
{
    [TestClass]
    public class TrocarFotoUsuarioTest
    {
        
        [TestMethod]
        public void TrocarFoto()
        {            
            var usuarioBus = new UsuariosBusiness();
            var usuario = usuarioBus.ObterUsuarioPorId( 4 ); // Previamente cadastrado
            
            Assert.IsNotNull(usuario);

            usuario.UrlImagem = "http://lorempixel.com/50/50/people/2/"; // url de exemplo

            usuarioBus.UpdateUsuario(usuario);

            var usuario2 = usuarioBus.ObterUsuarioPorId(4); // Previamente cadastrado
            Assert.IsTrue(usuario2.UrlImagem.Equals("http://lorempixel.com/50/50/people/2/"));

            //Voltando a imagem anterior
            usuario.UrlImagem = "http://lorempixel.com/50/50/people/1/"; // url de exemplo
            usuarioBus.UpdateUsuario(usuario);
        }
    }
}

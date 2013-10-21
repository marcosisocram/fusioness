using System;
using System.Linq;
using Fusioness.Business.ConvitesEventos;
using Fusioness.Entities;
using Microsoft.VisualStudio.TestTools.UnitTesting;

namespace Fusioness.Tests.ConvitesEventos
{
    [TestClass]
    public class ConviteEventoBusinessTest
    {
        [TestMethod]
        public void ObtemOsConvitesFeitosAoUsuario()
        {
            var convidado = new Usuario { IdUsuario = 4 }; // informações previamente inseridas no banco
            var conviteEventoBus = new ConviteEventoBusiness();
            var convitesEventos = conviteEventoBus.ObterConvitesFeitosAoUsuario(convidado);
                                        
            Assert.IsNotNull(convitesEventos);
            Assert.IsTrue(convitesEventos.Any());
            Assert.IsFalse(convitesEventos.Any(c => c.IdContato != convidado.IdUsuario));
            Assert.IsFalse(convitesEventos.Any(c => c.IdEvento == 0));
            Assert.IsFalse(convitesEventos.Any(c => c.IdUsuario == 0));
        }

        [TestMethod]
        public void ObterConviteFeitoAoUsuarioParaOEvento()
        {
            var convidado = new Usuario { IdUsuario = 4 }; // informações previamente inseridas no banco
            var evento = new Evento { IdEvento = 1 }; // informações previamente inseridas no banco
            var conviteEventoBus = new ConviteEventoBusiness();
            var conviteEvento = conviteEventoBus.ObterConviteFeitoAoUsuarioParaOEvento(convidado, evento);

            //Assert.IsNotNull(conviteEvento);
            //Assert.IsTrue(conviteEvento.IdContato == convidado.IdUsuario);
            //Assert.IsTrue(conviteEvento.IdEvento == evento.IdEvento);
            //Assert.IsFalse(conviteEvento.IdUsuario == 0);
        }

        [TestMethod]
        public void ResponderAoConvite()
        {
            var convite = new ConviteEvento { IdUsuario = 3, IdContato = 4, IdEvento = 1}; // informações previamente inseridas no banco
            var resposta = new Resposta { IdResposta = 1 }; // informações previamente inseridas no banco
            var conviteEventoBus = new ConviteEventoBusiness();
            var conviteEvento = conviteEventoBus.ResponderAoConvite(convite, resposta);

            Assert.IsNotNull(conviteEvento);
            //Assert.IsTrue(conviteEvento.IdResposta == resposta.IdResposta);
        }
    }
}

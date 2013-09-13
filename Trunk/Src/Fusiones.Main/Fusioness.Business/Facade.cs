using System;
using System.Collections.Generic;
using System.Linq;
using Fusioness.Business.ConvitesEventos;
using Fusioness.Business.Usuarios;
using Fusioness.Entities;

namespace Fusioness.Business
{
    public class Facade
    {
        #region Properties
        private readonly IUsuarioBusiness UsuarioBus;
        private readonly IConviteEventoBusiness ConviteEventoBus;
        #endregion

        #region Constructor
        private static Facade _Instance;
        public static Facade Instance
        {
            get {
                return _Instance ?? (_Instance = new Facade());
            }
        }
        
        private Facade()
        {
            UsuarioBus = new UsuariosBusiness();
            ConviteEventoBus = new ConviteEventoBusiness();
        }

        #endregion

        #region Methods
        
        #region Public
        
        #region Usuario
        
        public void DoSomething(Usuario usuario)
        {
            UsuarioBus.DoSomething(usuario);
        }

        #endregion

        #region ConviteEvento

        public ConviteEvento ObterConviteFeitoAoUsuarioParaOEvento(Usuario convidado, Evento evento)
        {
            return ConviteEventoBus.ObterConviteFeitoAoUsuarioParaOEvento(convidado, evento);
        }

        public IList<ConviteEvento> ObterConvitesFeitosAoUsuario(Usuario convidado)
        {
            return ConviteEventoBus.ObterConvitesFeitosAoUsuario(convidado);
        }

        public ConviteEvento ResponderAoConvite(ConviteEvento convite, Resposta resposta)
        {
            return ConviteEventoBus.ResponderAoConvite(convite, resposta);
        }

        #endregion

        #endregion

        #region Private

        #endregion
        #endregion
    }
}

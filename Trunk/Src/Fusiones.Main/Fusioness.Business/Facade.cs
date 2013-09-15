using System;
using System.Collections.Generic;
using System.Linq;
using Fusioness.Business.ConvitesEventos;
using Fusioness.Business.Usuarios;
using Fusioness.Entities;
using Fusioness.Business.Bicicletas;
using Fusioness.Business.Eventos;
using Fusioness.Business.Rotas;

namespace Fusioness.Business
{
    public class Facade
    {
        #region Properties
        private readonly IUsuarioBusiness UsuarioBus;
        private readonly IEventoBusiness EventoBus;
        private readonly IRotaBusiness RotaBus;
        private readonly IConviteEventoBusiness ConviteEventoBus;
        private readonly IBicicletaBusiness BicicletaBus;
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
            BicicletaBus = new BicicletasBusiness();
        }

        #endregion

        #region Methods
        
        #region Public
        
        #region Usuario
        
        public void DoSomething(Usuario usuario)
        {
            UsuarioBus.DoSomething(usuario);
        }

        public void InsertUsuario(Usuario usuario)
        {
            UsuarioBus.InsertUsuario(usuario);
        }

        public List<Usuario> CarregarContatos(int idUsuario)
        {
            return UsuarioBus.CarregarContatos(idUsuario);
        }

        public void AdicionarUsuarioARede(Contato contato)
        {
            UsuarioBus.AdicionarUsuarioARede(contato);
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

        #region Bicicleta

        public void InsertBicicleta(Bicicleta bicicleta)
        {
            BicicletaBus.InsertBicicleta(bicicleta);
        }

        #endregion

        #endregion

        #region Private

        #endregion
        #endregion

        public List<Rota> CarregarRotas()
        {
            return RotaBus.CarregarRotas();
        }

        public List<Evento> CarregarEventos()
        {
            return EventoBus.CarregarEventos();
        }

        public void QualificarRota(int IdRota, int IdTipoRota, int IdUsuario)
        {
            UsuarioBus.QualificarRota(IdRota, IdTipoRota, IdUsuario);
        }
    }
}

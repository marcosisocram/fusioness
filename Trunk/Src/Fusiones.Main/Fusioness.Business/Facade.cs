using System;
using System.Collections.Generic;
using System.Linq;
using Fusioness.Business.ConvitesEventos;
using Fusioness.Business.Usuarios;
using Fusioness.Entities;
using Fusioness.Business.Bicicletas;
using Fusioness.Business.Eventos;
using Fusioness.Business.Rotas;
using Fusioness.Business.TiposRota;

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
        private readonly ITipoRotaBusiness TipoRotaBus;
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
            RotaBus = new RotaBusiness();
            TipoRotaBus = new TipoRotaBusiness();
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

        public void UpdateUsuario(Usuario usuario)
        {
            UsuarioBus.UpdateUsuario(usuario);
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

        #region Rota

        public string CarregarRotas()
        {
            return RotaBus.CarregarRotas();
        }
        public string GetRotas(int IdUsuario)
        {
            return RotaBus.GetRotas(IdUsuario);
        }

        public String CarregarTipoRotas()
        {
            return TipoRotaBus.GetTipoRotas();
        }

        public void QualificarRota(int IdRota, int IdTipoRota, int IdUsuario) 
        {
            //UsuarioBus.QualificarRota(IdRota, IdTipoRota, IdUsuario);
        }

        

        #endregion

        #region Evento
        
        public string CarregarEventos()
        {
            return EventoBus.CarregarEventos();
        }
        //public List<Evento> CarregarEventos()
        //{
        //    return new List<Evento>();
        //}
        #endregion
        
        #endregion

        #region Private

        #endregion
        #endregion



       

       
    }
}

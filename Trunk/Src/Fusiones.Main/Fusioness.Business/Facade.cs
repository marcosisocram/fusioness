using System;
using System.Collections.Generic;
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
            EventoBus = new EventoBusiness();
        }

        #endregion

        #region Methods
        
        #region Public
        
        #region Usuario

        public Usuario ValidarLogonUsuario(Usuario usuario)
        {
            return UsuarioBus.ValidarLogonUsuario(usuario);
        }

        public void DoSomething(Usuario usuario)
        {
            UsuarioBus.DoSomething(usuario);
        }

        public Usuario InsertUsuario(Usuario usuario)
        {
            return UsuarioBus.InsertUsuario(usuario);
        }

        public Usuario UpdateUsuario(Usuario usuario)
        {
            return UsuarioBus.UpdateUsuario(usuario);
        }

        public List<Usuario> CarregarContatos(int idUsuario)
        {
            return UsuarioBus.CarregarContatos(idUsuario);
        }

        public Contato AdicionarUsuarioARede(Contato contato)
        {
            return UsuarioBus.AdicionarUsuarioARede(contato);
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

        public Bicicleta InsertBicicleta(Bicicleta bicicleta)
        {
            return BicicletaBus.InsertBicicleta(bicicleta);
        }

        #endregion

        #region Rota

        public Rota InsertRota(Rota rota)
        {
            return RotaBus.InsertRota(rota);
        }
        
        public List<Rota> CarregarRotas()
        {
            return RotaBus.CarregarRotas();
        }
        
        public List<Rota> CarregarRotasPorUsuario(int IdUsuario)
        {
            return RotaBus.CarregarRotasPorUsuario(IdUsuario);
        }

        public IList<TipoRota> CarregarTipoRotas()
        {
            return TipoRotaBus.GetTipoRotas();
        }

        public Rota QualificarRota(Rota rota) 
        {
            //UsuarioBus.QualificarRota(IdRota, IdTipoRota, IdUsuario);
            throw new NotImplementedException();
        }

        

        #endregion

        #region Evento

        public Evento InsertEvento(Evento evento)
        {
            return EventoBus.InsertEvento(evento);
        }
        
        public List<Evento> CarregarEventos()
        {
            return EventoBus.CarregarEventos();
        }

        public Evento ObterEventoPorId(int id)
        {
            return EventoBus.ObterEventoPorId(id);
        }
        #endregion
        
        #endregion

        #endregion
       
    }
}

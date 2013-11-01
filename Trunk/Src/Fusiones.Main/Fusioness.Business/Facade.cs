using System;
using System.Collections.Generic;
using Fusioness.Business.Contatos;
using Fusioness.Business.ConvitesEventos;
using Fusioness.Business.Respostas;
using Fusioness.Business.Usuarios;
using Fusioness.Entities;
using Fusioness.Business.Bicicletas;
using Fusioness.Business.Eventos;
using Fusioness.Business.Rotas;
using Fusioness.Business.TiposRota;
using Fusioness.Business.TiposPista;
using Fusioness.Business.Dificuldades;
using Fusioness.Business.QualidadesRota;
using Fusioness.Business.ComentariosEvento;
using Fusioness.Business.Coordenadas;
using Fusioness.Business.EventosUsuarios;

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
        private readonly ITipoPistaBusiness TipoPistaBus;
        private readonly IDificuldadeBusiness DificuldadeBus;
        private readonly IQualidadeRotaBusiness QualidadeRotaBus;
        private readonly ICoordenadaBusiness CoordenadaBus;
        private readonly IComentarioEventoBusiness ComentarioEventoBus;
        private readonly IRespostaBusiness RespostaBus;
        private readonly IContatoBusiness ContatoBus;
        private readonly IEventoUsuarioBusiness EventoUsuarioBus;

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
            BicicletaBus = new BicicletaBusiness();
            RotaBus = new RotaBusiness();
            TipoRotaBus = new TipoRotaBusiness();
            EventoBus = new EventoBusiness();
            TipoPistaBus = new TipoPistaBusiness();
            DificuldadeBus = new DificuldadeBusiness();
            QualidadeRotaBus = new QualidadeRotaBusiness();
            CoordenadaBus = new CoordenadaBusiness();
            ContatoBus = new ContatoBusiness();
            ComentarioEventoBus = new ComentarioEventoBusiness();
            RespostaBus = new RespostaBusiness();
            EventoUsuarioBus = new EventoUsuarioBusiness();
        }

        #endregion

        #region Methods
        
        #region Usuario

        public Usuario ValidarLogonUsuario(Usuario usuario)
        {
            return UsuarioBus.ValidarLogonUsuario(usuario);
        }

        public Usuario InserirUsuario(Usuario usuario)
        {
            return UsuarioBus.InserirUsuario(usuario);
        }
        public Usuario AlterarUsuario(Usuario usuario)
        {
            return UsuarioBus.AlterarUsuario(usuario);
        }
        public void RemoverUsuario(Usuario usuario)
        {
            UsuarioBus.RemoverUsuario(usuario);
        }
        public Usuario ObterUsuarioPorId(Usuario usuario)
        {
            return UsuarioBus.ObterUsuarioPorId(usuario);
        }
        public List<Usuario> ListarUsuarios()
        {
            return UsuarioBus.ListarUsuarios();
        }
        public string InserirFotoUsuario(Usuario usuario, byte[] bytes, string filename, string dirbase)
        {
            return UsuarioBus.InserirFotoUsuario(usuario,bytes,filename,dirbase);
        }
        public List<Usuario> ObterUsuariosIds(List<int> idsUsuario)
        {
            return UsuarioBus.ObterUsuariosIds(idsUsuario);
        }
        public List<Usuario> ListarUsuariosPorNome(string nome, int idUsuario)
        {
            return UsuarioBus.ListarUsuariosPorNome(nome, idUsuario);
        }        
        #endregion

        #region ConviteEvento

        public IList<ConviteEvento> ListarConviteEventos()
        {
            return ConviteEventoBus.ListarConvitesEventos();
        }

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

        public List<ConviteEvento> ConvidarUsuarios(Usuario usuario, Evento evento, List<int> idsAmigoss)
        {
            return ConviteEventoBus.ConvidarUsuarios(usuario, evento, idsAmigoss);
        }
        #endregion

        #region Bicicleta
        public Bicicleta InserirBicicleta(Bicicleta bicicleta)
        {
            return BicicletaBus.InserirBicicleta(bicicleta);
        }
        public Bicicleta AlterarBicicleta(Bicicleta bicicleta)
        {
            return BicicletaBus.AlterarBicicleta(bicicleta);
        }
        public void RemoverBicicleta(Bicicleta bicicleta)
        {
            BicicletaBus.RemoverBicicleta(bicicleta);
        }
        public Bicicleta ObterBicicletaPorId(Bicicleta bicicleta)
        {
            return BicicletaBus.ObterBicicletaPorId(bicicleta);
        }
        public List<Bicicleta> ListarBicicletasPorUsuario(Usuario usuario)
        {
            return BicicletaBus.ListarBicicletasPorUsuario(usuario);
        }
        public string InserirBicicleta(Bicicleta bicicleta, byte[] bytes, string filename, string dirBase)
        {
            return BicicletaBus.InserirFotoBicicleta(bicicleta, bytes, filename, dirBase);
        }
        #endregion

        #region Rota
        public Rota InserirRota(Rota rota)
        {
            return RotaBus.InserirRota(rota);
        }
        public Rota AlterarRota(Rota rota)
        {
            return RotaBus.AlterarRota(rota);
        }
        public void RemoverRota(Rota rota)
        {
            RotaBus.RemoverRota(rota);
        }
        public Rota ObterRotaPorId(Rota rota)
        {
            return RotaBus.ObterRotaPorId(rota);
        }
        public List<Rota> ListarRotas()
        {
            return RotaBus.ListarRotas();
        }
        public List<Rota> ListarRotasPorUsuario(Usuario usuario)
        {
            return RotaBus.ListarRotasPorUsuario(usuario);
        }
        
        #endregion

        #region ComentarioEvento

        public ComentarioEvento InserirComentarioEvento(ComentarioEvento comentario)
        {
            return ComentarioEventoBus.InserirComentarioEvento(comentario);
        }

        public ComentarioEvento AlterarComentarioEvento(ComentarioEvento comentario)
        {
            return ComentarioEventoBus.AlterarComentarioEvento(comentario);
        }

        public void RemoverComentarioEvento(ComentarioEvento comentario)
        {
            ComentarioEventoBus.RemoverComentarioEvento(comentario);
        }

        public ComentarioEvento ObterComentarioEventoPorId(ComentarioEvento comentario)
        {
            return ComentarioEventoBus.ObterComentarioEventoPorId(comentario);
        }

        public List<ComentarioEvento> ListarComentariosPorEvento(Evento evento)
        {
            return ComentarioEventoBus.ListarComentariosPorEvento(evento);
        }

        public List<ComentarioEvento> ListarComentariosPorUsuario(Usuario usuario)
        {
            return ComentarioEventoBus.ListarComentariosPorUsuario(usuario);
        }

        #endregion

        #region TipoRota
        public List<TipoRota> ListarTiposRota()
        {
            return TipoRotaBus.ListarTiposRota();
        }

        #endregion

        #region TipoPista
        public List<TipoPista> ListarTiposPista()
        {
            return TipoPistaBus.ListarTiposPista();
        }

        #endregion

        #region Dificuldade
        public List<Dificuldade> ListarDificuldades()
        {
            return DificuldadeBus.ListarDificuldades();
        }

        #endregion

        #region QualidadeRota
        public List<QualidadeRota> ListarQualidadesRota()
        {
            return QualidadeRotaBus.ListarQualidadesRota();
        }

        #endregion

        #region Evento

        public Evento InserirEvento(Evento evento)
        {
            return EventoBus.InserirEvento(evento);
        }
        public Evento AlterarEvento(Evento evento)
        {
            return EventoBus.AlterarEvento(evento);
        }
        public void RemoverEvento(Evento evento)
        {
            EventoBus.RemoverEvento(evento);
        }
        public Evento ObterEventoPorId(Evento evento)
        {
            return EventoBus.ObterEventoPorId(evento);
        }
        public List<Evento> ListarEventos(params int[] ids)
        {
            return EventoBus.ListarEventos(ids);
        }
        public List<Evento> ListarEventosPorUsuario(Usuario usuario)
        {
            return EventoBus.ListarEventosPorUsuario(usuario);
        }

        public List<Evento> ListarEventosComDistancia(double latitudeAtual, double longitudeAtual)
        {
            return EventoBus.ListarEventosComDistancia(latitudeAtual, longitudeAtual);
        }

        #endregion

        #region Coordenadas

        public List<Coordenada> InserirListaCoordenadas(List<Coordenada> listaCoordenadas)
        {
            return CoordenadaBus.InserirListaCoordenadas(listaCoordenadas);
        }

        public List<Coordenada> ListarCoordenadasPorRota(Rota rota)
        {
            return CoordenadaBus.ListarCoordenadasPorRota(rota);
        }

        public List<Coordenada> ListarPontosReferenciaPorRota(Rota rota)
        {
            return CoordenadaBus.ListarPontosReferenciaPorRota(rota);
        }

        public void RemoverCoordenada(Coordenada coordenada)
        {
            CoordenadaBus.RemoverCoordenada(coordenada);
        }
        
        #region Respostas
        public List<Resposta> ListarRespostas()
        {
            return RespostaBus.ListarRespostas();
        }
        #endregion

        #endregion

        #region Contato
        public Contato InserirContato(Contato contato)
        {
            return ContatoBus.InserirContato(contato);
        }
        public List<Contato> ListarContatosDoUsuario(Usuario usuario)
        {
            return ContatoBus.ListarContatosDoUsuario(usuario);
        }

        public List<Contato> ListarContatos()
        {
            return ContatoBus.ListarContatos();
        }

        public Contato AlterarContato(Contato contato)
        {
            return ContatoBus.AlterarContato(contato);
        }

        public bool ExcluirContato(Contato contato)
        {
            return ContatoBus.ExcluirContato(contato);
        }
        public List<Contato> ListarConvitesDoUsuario(Usuario usuario)
        {
            return ContatoBus.ListarConvitesDoUsuario(usuario);
        }
        #endregion

        #region EventoUsuario
        public EventoUsuario InserirEventoUsuario(EventoUsuario eventoUsuario)
        {
            return EventoUsuarioBus.InserirEventoUsuario(eventoUsuario);
        }
        #endregion

        #endregion
    }
}

using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.Script.Serialization;
using System.Web.Script.Services;
using System.Web.Services;
using Fusioness.Business;
using Fusioness.Entities;

namespace Fusioness.Services
{
    /// <summary>
    /// Summary description for MainService
    /// </summary>
    [WebService(Namespace = "http://tempuri.org/")]
    [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
    [ToolboxItem(false)]
    [ScriptService]
    public class MainService : WebService
    {
        /// <summary>
        /// Réplica da precarga do banco
        /// </summary>
        internal Resposta RespostasPrecarga(bool? resposta)
        {
            if (resposta.HasValue) // se há uma resposta informada obtém as resposta devida com base na precarga
                return resposta.Value ? new Resposta { IdResposta = 2 } : new Resposta { IdResposta = 1 };

            // se não houver resposta, retorna reposta "Não sei" (com base na precarga)
            return new Resposta { IdResposta = 3 };
        }

        public JavaScriptSerializer Serializer = new JavaScriptSerializer();

        #region HelloWorld
        [WebMethod]
        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        public string HelloWorld()
        {

            return Serializer.Serialize("Hello World");
        }

        #endregion
        
        #region Bicicleta
        [WebMethod]
        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        public Bicicleta InserirBicicleta(Bicicleta bicicleta)
        {
            try
            {
                return Facade.Instance.InserirBicicleta(bicicleta);
            }
            catch
            {
                return default(Bicicleta);
            }
        }


        [WebMethod]
        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        public Bicicleta AlterarBicicleta(Bicicleta bicicleta)
        {
            try
            {
                return Facade.Instance.AlterarBicicleta(bicicleta);
            }
            catch
            {
                return default(Bicicleta);
            }
        }

        [WebMethod]
        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        public void RemoverBicicleta(Bicicleta bicicleta)
        {
            try
            {
                Facade.Instance.RemoverBicicleta(bicicleta);
            }
            catch
            {
                //TODO: LogFile();
            }
        }

        [WebMethod]
        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        public Bicicleta ObterBicicletaPorId(Bicicleta bicicleta)
        {
            try
            {
                return Facade.Instance.ObterBicicletaPorId(bicicleta);
            }
            catch
            {
                return default(Bicicleta);
            }
        }

        [WebMethod]
        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        public List<Bicicleta> ListarBicicletasPorUsuario(Usuario usuario)
        {
            try
            {
                return Facade.Instance.ListarBicicletasPorUsuario(usuario);
            }
            catch
            {
                return new List<Bicicleta>();
            }
        }

        #endregion

        #region Usuario

        [WebMethod]
        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        public Usuario ValidarLogonUsuario(Usuario usuario)
        {
            try
            {
                return Facade.Instance.ValidarLogonUsuario(usuario);
            }
            catch (Exception)
            {
                return default(Usuario);
            }
        }

        [WebMethod]
        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        public Usuario InserirUsuario(Usuario usuario)
        {
            try
            {
                usuario = Facade.Instance.InserirUsuario(usuario);
                return usuario;
            }
            catch
            {
                return default(Usuario);
            }
        }

        [WebMethod]
        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        public Usuario AlterarUsuario(Usuario usuario)
        {
            try
            {
                return Facade.Instance.AlterarUsuario(usuario);
            }
            catch
            {
                return default(Usuario);
            }
        }

        [WebMethod]
        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        public List<Usuario> ListarContatosPorUsuario(Usuario usuario)
        {
            try
            {
                return Facade.Instance.ListarContatosPorUsuario(usuario);
            }
            catch
            {
                return new List<Usuario>();
            }
        }

        [WebMethod]
        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        public string InserirFotoUsuario(Usuario usuario, string filename, byte[] bytes)
        {
            try
            {
                string dirBase = Server.MapPath("~");
                return Facade.Instance.InserirFotoUsuario(usuario, bytes, filename, dirBase);
            }
            catch (Exception)
            {
                return string.Empty;
            }
        }

        #endregion

        #region Rotas

        [WebMethod]
        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        public Rota InserirRota(Rota rota)
        {
            try
            {
                return Facade.Instance.InserirRota(rota);
            }
            catch
            {
                return default(Rota);
            }
        }

        [WebMethod]
        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        public Rota AlterarRota(Rota rota)
        {
            try
            {
                return Facade.Instance.AlterarRota(rota);
            }
            catch
            {
                return default(Rota);
            }
        }

        [WebMethod]
        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        public void RemoverRota(Rota rota)
        {
            try
            {
                Facade.Instance.RemoverRota(rota);
            }
            catch
            {
                //TODO: LogFile();
            }
        }

        [WebMethod]
        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        public Rota ObterRotaPorId(Rota rota)
        {
            try
            {
                return Facade.Instance.ObterRotaPorId(rota);
            }
            catch
            {
                return default(Rota);
            }
        }

        [WebMethod]
        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        public List<Rota> ListarRotas()
        {
            try
            {
                return Facade.Instance.ListarRotas();
            }
            catch
            {
                return new List<Rota>();
            }
        }

        [WebMethod]
        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        public List<Rota> ListarRotasPorUsuario(Usuario usuario)
        {
            try
            {
                return Facade.Instance.ListarRotasPorUsuario(usuario);
            }
            catch
            {
                return new List<Rota>();
            }
        }

        #endregion

        #region ComentarioEvento

        [WebMethod]
        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        public ComentarioEvento InserirComentarioEvento(ComentarioEvento comentario)
        {
            try
            {
                return Facade.Instance.InserirComentarioEvento(comentario);
            }
            catch
            {
                return default(ComentarioEvento);
            }
        }

        [WebMethod]
        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        public ComentarioEvento AlterarComentarioEvento(ComentarioEvento comentario)
        {
            try
            {
                return Facade.Instance.AlterarComentarioEvento(comentario);
            }
            catch
            {
                return default(ComentarioEvento);
            }
        }

        [WebMethod]
        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        public void RemoverComentarioEvento(ComentarioEvento comentario)
        {
            try
            {
                Facade.Instance.RemoverComentarioEvento(comentario);
            }
            catch
            {
                //TODO: LogFile();
            }
        }

        [WebMethod]
        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        public ComentarioEvento ObterComentarioEventoPorId(ComentarioEvento comentario)
        {
            try
            {
                return Facade.Instance.ObterComentarioEventoPorId(comentario);
            }
            catch
            {
                return default(ComentarioEvento);
            }
        }

        [WebMethod]
        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        public List<ComentarioEvento> ListarComentariosPorEvento(Evento evento)
        {
            try
            {
                return Facade.Instance.ListarComentariosPorEvento(evento);
            }
            catch
            {
                return new List<ComentarioEvento>();
            }
        }

        #endregion

        #region TipoRota

        [WebMethod]
        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        public List<TipoRota> ListarTiposRota()
        {
            try
            {
                return Facade.Instance.ListarTiposRota();
            }
            catch
            {
                return new List<TipoRota>();
            }
        }

        #endregion

        #region TipoPista

        [WebMethod]
        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        public List<TipoPista> ListarTiposPista()
        {
            try
            {
                return Facade.Instance.ListarTiposPista();
            }
            catch
            {
                return new List<TipoPista>();
            }
        }

        #endregion

        #region Dificuldade

        [WebMethod]
        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        public List<Dificuldade> ListarDificuldades()
        {
            try
            {
                return Facade.Instance.ListarDificuldades();
            }
            catch
            {
                return new List<Dificuldade>();
            }
        }

        #endregion

        #region QualidadeRota

        [WebMethod]
        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        public List<QualidadeRota> ListarQualidadesRota()
        {
            try
            {
                return Facade.Instance.ListarQualidadesRota();
            }
            catch
            {
                return new List<QualidadeRota>();
            }
        }

        #endregion

        #region Evento
        [WebMethod]
        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        public List<Evento> ListarEventos(params int[] ids)
        {
            try
            {
                return Facade.Instance.ListarEventos(ids);
            }
            catch
            {
                return new List<Evento>();
            }
        }

        [WebMethod]
        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        public List<Evento> ListarEventosPorUsuario(Usuario usuario)
        {
            try
            {
                return Facade.Instance.ListarEventosPorUsuario(usuario);
            }
            catch
            {
                return new List<Evento>();
            }
        }

        [WebMethod]
        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        public Evento AlterarEvento(Evento evento)
        {
            try
            {
                return Facade.Instance.AlterarEvento(evento);
            }
            catch
            {
                return default(Evento);
            }
        }

        [WebMethod]
        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        public void RemoverEvento(Evento evento)
        {
            try
            {
                Facade.Instance.RemoverEvento(evento);
            }
            catch
            {
                //TODO: LogFile();
            }
        }

        [WebMethod]
        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        public Evento ObterEventoPorId(Evento evento)
        {
            try
            {
                return Facade.Instance.ObterEventoPorId(evento);
            }
            catch
            {
                return new Evento();
            }
        }
        #endregion

        #region Coordenadas

        [WebMethod]
        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        public List<Coordenada> InserirListaCoordenadas(List<Coordenada> listaCoordenadas)
        {
            try
            {
                return Facade.Instance.InserirListaCoordenadas(listaCoordenadas);
            }
            catch
            {
                return new List<Coordenada>();
            }
        }

        [WebMethod]
        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        public List<Coordenada> ListarCoordenadasPorRota(Rota rota)
        {
            try
            {
                return Facade.Instance.ListarCoordenadasPorRota(rota);
            }
            catch
            {
                return new List<Coordenada>();
            }
        }

        #endregion

        #region ConviteEvento
        [WebMethod]
        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        public List<ConviteEvento> ListarConvitesEventos()
        {
            try
            {
                return Facade.Instance.ListarConviteEventos().ToList();
            }
            catch
            {
                return new List<ConviteEvento>();
            }
        }

        [WebMethod]
        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        public List<ConviteEvento> ObterConvitesEventosDoUsuario(Usuario usuario)
        {
            try
            {
                return Facade.Instance.ObterConvitesFeitosAoUsuario(usuario).ToList();
            }
            catch
            {
                return new List<ConviteEvento>();
            }
        }

        [WebMethod]
        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        public ConviteEvento ResponderConviteEvento(ConviteEvento convite, bool? resposta)
        {
            try
            {
                return Facade.Instance.ResponderAoConvite(convite, RespostasPrecarga(resposta));
            }
            catch
            {
                return new ConviteEvento();
            }
        }
        #endregion

        #region Respostas
        [WebMethod]
        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        public List<Resposta> ListarRespostas()
        {
            try
            {
                return Facade.Instance.ListarRespostas();
            }
            catch
            {
                return new List<Resposta>();
            }
        }
        #endregion
    }
}

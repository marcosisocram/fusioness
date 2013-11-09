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
using System.Net.Mail;
using System.Net;

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
            catch (Exception e)
            {
                return (Bicicleta)TratarRetorno(bicicleta, e);
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
            catch (Exception e)
            {
                return (Bicicleta)TratarRetorno(bicicleta, e);
            }
        }

        [WebMethod]
        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        public Bicicleta RemoverBicicleta(Bicicleta bicicleta)
        {
            try
            {
                Facade.Instance.RemoverBicicleta(bicicleta);
                return new Bicicleta();
            }
            catch (Exception e)
            {
                return (Bicicleta)TratarRetorno(bicicleta, e);
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
            catch (Exception e)
            {
                return (Bicicleta)TratarRetorno(bicicleta, e);
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

        [WebMethod]
        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        public Bicicleta InserirFotoBicicleta(Bicicleta bicicleta, string filename, byte[] bytes)
        {
            try
            {
                string dirBase = Server.MapPath("~");
                return Facade.Instance.InserirFotoBicicleta(bicicleta, bytes, filename, dirBase);
            }
            catch (Exception e)
            {
                return (Bicicleta)TratarRetorno(bicicleta, e);
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

        [WebMethod]
        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        public List<Usuario> ObterUsuariosIds(List<int> idsUsuario)
        {
            try
            {
                return Facade.Instance.ObterUsuariosIds(idsUsuario);
            }
            catch (Exception)
            {
                return new List<Usuario>();
            }
        }

        [WebMethod]
        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        public List<Usuario> ListarUsuarios()
        {
            try
            {
                return Facade.Instance.ListarUsuarios();
            }
            catch (Exception)
            {
                return new List<Usuario>();
            }
        }

        [WebMethod]
        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        public List<Usuario> ListarUsuariosPorNome(string nome, int idUsuario)
        {
            try
            {
                return Facade.Instance.ListarUsuariosPorNome(nome, idUsuario);
            }
            catch (Exception)
            {
                return new List<Usuario>();
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

        [WebMethod]
        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        public List<ComentarioEvento> ListarComentariosPorUsuario(Usuario usuario)
        {
            try
            {
                return Facade.Instance.ListarComentariosPorUsuario(usuario);
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
        public Evento InserirEvento(Evento evento)
        {
            try
            {
                return Facade.Instance.InserirEvento(evento);
            }
            catch
            {
                return new Evento();
            }
        }

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

        [WebMethod]
        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        public List<Evento> ListarEventosComDistancia(double latitudeAtual, double longitudeAtual)
        {
            try
            {
                return Facade.Instance.ListarEventosComDistancia(latitudeAtual, longitudeAtual);
            }
            catch
            {
                return new List<Evento>();
            }
        }

        [WebMethod]
        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        public List<Evento> ListarEventosProximos(double latitudeMin, double latitudeMax, double longitudeMin, double longitudeMax)
        {
            try
            {
                return Facade.Instance.ListarEventosProximos(latitudeMin, latitudeMax, longitudeMin, longitudeMax);
            }
            catch
            {
                return new List<Evento>();
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
                string dirBase = Server.MapPath("~");
                return Facade.Instance.InserirListaCoordenadas(listaCoordenadas, dirBase);
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

        [WebMethod]
        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        public List<Coordenada> ListarPontosReferenciaPorRota(Rota rota)
        {
            try
            {
                return Facade.Instance.ListarPontosReferenciaPorRota(rota);
            }
            catch
            {
                return new List<Coordenada>();
            }
        }

        [WebMethod]
        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        public void RemoverCoordenada(Coordenada coordenada)
        {
            try
            {
                Facade.Instance.RemoverCoordenada(coordenada);
            }
            catch
            {
                //log
            }
        }

        [WebMethod]
        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        public double ConsultarDuracaoRota(int idRota)
        {
            try
            {
                return Facade.Instance.ConsultarDuracaoRota(idRota);
            }
            catch
            {
                return 0;
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
        public ConviteEvento ResponderConviteEvento(ConviteEvento convite, Resposta resposta)
        {
            try
            {
                return Facade.Instance.ResponderAoConvite(convite, resposta);
            }
            catch
            {
                return new ConviteEvento();
            }
        }

        [WebMethod]
        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        public List<ConviteEvento> ConvidarUsuarios(Usuario usuario, Evento evento, List<int> idsAmigos)
        {
            try
            {
                return Facade.Instance.ConvidarUsuarios(usuario, evento, idsAmigos);
            }
            catch (Exception)
            {
                return new List<ConviteEvento>();
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

        #region Contato
        [WebMethod]
        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        public List<Contato> ListarContatosDoUsuario(Usuario usuario)
        {
            try
            {
                return Facade.Instance.ListarContatosDoUsuario(usuario);
            }
            catch
            {
                return new List<Contato>();
            }
        }

        [WebMethod]
        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        public List<Contato> ListarContatos()
        {
            try
            {
                return Facade.Instance.ListarContatos();
            }
            catch
            {
                return new List<Contato>();
            }
        }

        [WebMethod]
        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        public Contato InserirContato(Contato contato)
        {
            try
            {
                return Facade.Instance.InserirContato(contato);
            }
            catch
            {
                return new Contato();
            }
        }

        [WebMethod]
        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        public Contato AlterarContato(Contato contato)
        {
            try
            {
                return Facade.Instance.AlterarContato(contato);
            }
            catch
            {
                return new Contato();
            }
        }

        [WebMethod]
        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        public bool ExcluirContato(Contato contato)
        {
            try
            {
                return Facade.Instance.ExcluirContato(contato);
            }
            catch
            {
                return false;
            }
        }

        [WebMethod]
        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        public List<Contato> ListarConvitesDoUsuario(Usuario usuario)
        {
            try
            {
                return Facade.Instance.ListarConvitesDoUsuario(usuario);
            }
            catch
            {
                return new List<Contato>();
            }
        }

        [WebMethod]
        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        public List<Contato> ListarConvitesFeitosPeloUsuario(Usuario usuario)
        {
            try
            {
                return Facade.Instance.ListarConvitesFeitosPeloUsuario(usuario);
            }
            catch
            {
                return new List<Contato>();
            }
        }
        #endregion

        #region EventoUsuario
        [WebMethod]
        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        public EventoUsuario InserirEventoUsuario(EventoUsuario eventoUsuario)
        {
            try
            {
                return Facade.Instance.InserirEventoUsuario(eventoUsuario);
            }
            catch (Exception)
            {
                return new EventoUsuario();
            }
        }
        
        [WebMethod]
        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        public EventoUsuario AlterarEventoUsuario(EventoUsuario eventoUsuario)
        {
            try
            {
                return Facade.Instance.AlterarEventoUsuario(eventoUsuario);
            }
            catch (Exception)
            {
                return new EventoUsuario();
            }
        }

        [WebMethod]
        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        public List<EventoUsuario> ListarEventoUsuario(Usuario usuario)
        {
            try
            {
                return Facade.Instance.ListarEventoUsuario(usuario);
            }
            catch (Exception)
            {
                return new List<EventoUsuario>();
            }
        }

        [WebMethod]
        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        public List<EventoUsuario> ListarUsuariosEvento(Evento evento)
        {
            try
            {
                return Facade.Instance.ListarUsuariosEvento(evento);
            }
            catch (Exception)
            {
                return new List<EventoUsuario>();
            }
        }

        [WebMethod]
        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        public EventoUsuario ObterEventoUsuario(Evento evento, Usuario usuario)
        {
            try
            {
                return Facade.Instance.ObterEventoUsuario(evento, usuario);
            }
            catch (Exception)
            {
                return new EventoUsuario();
            }
        }

        [WebMethod]
        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        public string ObterMeuTempoNoEvento(EventoUsuario eventoUsuario)
        {
            try
            {
                return Facade.Instance.ObterMeuTempoNoEvento(eventoUsuario).ToString();
            }
            catch (Exception)
            {
                return new TimeSpan(0, 0, 0, 0, 0).ToString();
            }
        }
        #endregion

        #region Outros
        [WebMethod]
        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        public void ConvidarPorEmail(string mail, string url)
        {
            var fromAddress = new MailAddress("fusionessapp@gmail.com", "Convite Fusioness");
            var toAddress = new MailAddress(mail, mail);
            const string fromPassword = "Unibratec";
            const string subject = "Venha fazer parte do Fusioness!";
            string body = "Click no link para criar o seu perfil \n" + url;

            var smtp = new SmtpClient
            {
                Host = "smtp.gmail.com",
                Port = 587,
                EnableSsl = true,
                DeliveryMethod = SmtpDeliveryMethod.Network,
                UseDefaultCredentials = false,
                Credentials = new NetworkCredential(fromAddress.Address, fromPassword)
            };
            var message = new MailMessage(fromAddress, toAddress)
            {
                Subject = subject,
                Body = body
            };

            smtp.Send(message);
        }
        #endregion

        #region Util

        private EntityBase TratarRetorno(EntityBase objeto, Exception e)
        {
            objeto.StatusRetorno = 1;
            objeto.DescricaoRetorno = e.Message;
            return objeto;
        }

        #endregion
    }
}

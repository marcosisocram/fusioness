using System;
using System.Collections.Generic;
using System.ComponentModel;
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
        public List<Evento> ListarEventos()
        {
            try
            {
                return Facade.Instance.ListarEventos();
            }
            catch
            {
                return new List<Evento>();
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
        
    }
}

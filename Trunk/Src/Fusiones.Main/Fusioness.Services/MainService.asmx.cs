using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Linq;
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

        [WebMethod]
        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        public string HelloWorld()
        {
            return Serializer.Serialize("Hello World");
        }

        [WebMethod]
        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        public Usuario ValidarLogonUsuario(Usuario usuario)
        {
            try
            {
                usuario = Facade.Instance.ValidarLogonUsuario(usuario);
                return usuario;
            }
            catch (Exception)
            {
                return default(Usuario);
            }
        }

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
        public List<TipoRota> ListarTipoRotas()
        {
            try
            {
                return Facade.Instance.ListarTipoRotas();
            }
            catch
            {
                return new List<TipoRota>();
            }
        }

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
                return Facade.Instance.ObterEventoPorId(evento); ;
            }
            catch
            {
                return new Evento();
            }
        }
    }
}

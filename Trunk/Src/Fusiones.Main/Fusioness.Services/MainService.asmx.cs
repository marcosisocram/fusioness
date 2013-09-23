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
        public Usuario DoSomething(Usuario usuario)
        {
            try
            {
                Facade.Instance.DoSomething(usuario);
                return usuario;
            }
            catch
            {
                return default(Usuario);
            }
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
        public Bicicleta InsertBicicleta(Bicicleta bicicleta)
        {
            try
            {
                return Facade.Instance.InsertBicicleta(bicicleta);
            }
            catch
            {
                return default(Bicicleta);
            }
        }

        [WebMethod]
        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        public Usuario InsertUsuario(Usuario usuario)
        {
            try
            {
                usuario = Facade.Instance.InsertUsuario(usuario);
                return usuario;
            }
            catch
            {
                return default(Usuario);
            }
        }

        [WebMethod]
        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        public Usuario UpdateUsuario(Usuario usuario)
        {
            try
            {
                return Facade.Instance.UpdateUsuario(usuario);
            }
            catch
            {
                return default(Usuario);
            }
        }

        [WebMethod]
        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        public List<Usuario> CarregarContatos(int idUsuario)
        {
            try
            {
                return Facade.Instance.CarregarContatos(idUsuario);
            }
            catch
            {
                return new List<Usuario>();
            }
        }

        [WebMethod]
        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        public Rota QualificarRota(Rota rota)
        {
            try
            {
                return Facade.Instance.QualificarRota(rota);
            }
            catch
            {
                return default(Rota);
            }
        }

        [WebMethod]
        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        public List<Rota> GetRotas(int IdUsuario)
        {
            try
            {
                return Facade.Instance.CarregarRotasPorUsuario(IdUsuario);
            }
            catch
            {
                return new List<Rota>();
            }
        }

        [WebMethod]
        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        public List<Rota> CarregarRotas()
        {
            try
            {
                return Facade.Instance.CarregarRotas();
            }
            catch
            {
                return new List<Rota>();
            }
        }

        [WebMethod]
        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        public List<TipoRota> CarregarTipoRotas()
        {
            try
            {
                return Facade.Instance.CarregarTipoRotas().ToList();
            }
            catch
            {
                return new List<TipoRota>();
            }
        }

        //[WebMethod]
        //[ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        //public string CarregarEventos()
        //{
        //    try
        //    {
        //        List<Evento> eventos = Facade.Instance.CarregarEventos();
        //        string str = "";

        //        foreach (var evento in eventos)
        //        {
        //            str += evento.IdEvento + "|";
        //        }
        //        return Serializer.Serialize(str);
        //    }
        //    catch
        //    {
        //        return Serializer.Serialize("done with error!");
        //    }
        //}
    }
}

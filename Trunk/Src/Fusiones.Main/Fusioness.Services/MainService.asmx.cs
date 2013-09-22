using System;
using System.ComponentModel;
using System.IO;
using System.Linq;
using System.Text;
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
        public string ValidarLogonUsuario(string usuarioSerializado)
        {
            try
            {
                var usuario = Serializer.Deserialize<Usuario>(usuarioSerializado);
                var usuarioValidado = Facade.Instance.ValidarLogonUsuario(usuario);
                if (usuarioValidado == null || usuarioValidado.IdUsuario <= 0) throw new Exception("Usuário inválido.");
                
                // limpando para evitar referencia circular

                return Serializer.Serialize(usuarioValidado);
            }
            catch (Exception ex)
            {
                return Serializer.Serialize(ex);
            }
        }

        [WebMethod]
        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        public string HelloWorld()
        {
            return Serializer.Serialize("Hello World");
        }

        [WebMethod]
        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        public string DoSomething(string nomeDoUsuario)
        {
            try
            {
                var usuario = new Usuario
                {
                    Nome = nomeDoUsuario,
                    Login = "login",
                    Senha = "senha",
                    Email = "email",
                    Sexo = "M"
                };

                Facade.Instance.DoSomething(usuario);
                return Serializer.Serialize("done successfully!");
            }
            catch
            {
                return Serializer.Serialize("done with error!");
            }
        }

        [WebMethod]
        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        public string InsertBicicleta(string bicicletaSerializado)
        {
            try
            {
                var bicicletaDesserializado = Serializer.Deserialize<Bicicleta>(bicicletaSerializado);

                Facade.Instance.InsertBicicleta(bicicletaDesserializado);
                return Serializer.Serialize("Bicicleta Cadastrada com Sucesso!");
            }
            catch
            {
                return Serializer.Serialize("Error ao Cadastrar Bicicleta!");
            }
        }

        [WebMethod]
        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        public string InsertUsuario(string usuarioSerializado)
        {
            try
            {
                var usuario = Serializer.Deserialize<Usuario>(usuarioSerializado);
                Facade.Instance.InsertUsuario(usuario);
                return Serializer.Serialize("done successfully!");
            }
            catch
            {
                return Serializer.Serialize("done with error!");
            }
        }

        [WebMethod]
        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        public string UpdateUsuario(string usuarioSerializado)
        {
            try
            {
                var usuario = Serializer.Deserialize<Usuario>(usuarioSerializado);
                Facade.Instance.UpdateUsuario(usuario);                
                return Serializer.Serialize("done successfully!");
            }
            catch
            {
                return Serializer.Serialize("done with error!");
            }
        }

        [WebMethod]
        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        public string CarregarContatos(int idUsuario)
        {
            try
            {
                return Serializer.Serialize(Facade.Instance.CarregarContatos(idUsuario));
            }
            catch
            {
                return Serializer.Serialize("done with error!");
            }
        }

        [WebMethod]
        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        public string QualificarRota(string rotaSerializada)
        {
            try
            {
                var rota = Serializer.Deserialize<Rota>(rotaSerializada);
                Facade.Instance.QualificarRota(rota);
                return Serializer.Serialize("done successfully!");
            }
            catch
            {
                return Serializer.Serialize("done with error!");
            }
        }

        [WebMethod]
        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        public string GetRotas(int IdUsuario)
        {
            try
            {
                return Serializer.Serialize(Facade.Instance.CarregarRotasPorUsuario(IdUsuario));
            }
            catch
            {
                return Serializer.Serialize("done with error!");
            }
        }

        [WebMethod]
        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        public string CarregarRotas()
        {
            try
            {
                return Serializer.Serialize(Facade.Instance.CarregarRotas());
            }
            catch
            {
                return Serializer.Serialize("done with error!");
            }
        }

        [WebMethod]
        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        public string CarregarTipoRotas()
        {
            try
            {
                return Serializer.Serialize(Facade.Instance.CarregarTipoRotas());
            }
            catch
            {
                return Serializer.Serialize("done with error!");
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

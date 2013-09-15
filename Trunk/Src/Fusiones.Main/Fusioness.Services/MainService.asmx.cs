using System;
using System.Collections.Generic;
using System.ComponentModel;
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

        [WebMethod]
        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        public string HelloWorld()
        {
            return new JavaScriptSerializer().Serialize("Hello World");
        }

        [WebMethod]
        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        public string DoSomething(string nomeDoUsuario)
        {
            try
            {
                var usuario = new Usuario { Nome = nomeDoUsuario };
                usuario.Login = "login";
                usuario.Senha = "senha";
                usuario.Email = "email";
                usuario.Sexo = "M";

                Facade.Instance.DoSomething(usuario);
                return new JavaScriptSerializer().Serialize("done successfully!");
            }
            catch
            {
                return new JavaScriptSerializer().Serialize("done with error!");
            }
        }

        [WebMethod]
        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        public string InsertBicicleta(string marca, string modelo)
        {
            try
            {
                var bicicleta = new Bicicleta();
                bicicleta.Marca = marca;
                bicicleta.Modelo = modelo;
                bicicleta.IdUsuario = 7;

                Facade.Instance.InsertBicicleta(bicicleta);
                return new JavaScriptSerializer().Serialize("Bicicleta Cadastrada com Sucesso!");
            }
            catch
            {
                return new JavaScriptSerializer().Serialize("Error ao Cadastrar Bicicleta!");
            }
        }
    }
}

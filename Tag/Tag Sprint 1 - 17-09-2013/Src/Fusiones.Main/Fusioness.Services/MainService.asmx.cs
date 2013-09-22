﻿using System;
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
        public string InsertBicicleta(string bicicletaSerializado)
        {
            try
            {
                Bicicleta bicicletaDesserializado = (Bicicleta)new JavaScriptSerializer().Deserialize(bicicletaSerializado, typeof(Bicicleta));

                Facade.Instance.InsertBicicleta(bicicletaDesserializado);
                return new JavaScriptSerializer().Serialize("Bicicleta Cadastrada com Sucesso!");
            }
            catch
            {
                return new JavaScriptSerializer().Serialize("Error ao Cadastrar Bicicleta!");
            }
        }

        [WebMethod]
        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        public string InsertUsuario(string nome, string login, string senha, string email, int idade, char sexo, string UrlImagem)
        {
            try
            {
                var usuario = new Usuario()
                {
                    Nome=nome,
                    Login=login,
                    Senha=senha,
                    Email=email,
                    Idade=idade,
                    Sexo=sexo.ToString(),
                    UrlImagem=UrlImagem
                };
                Facade.Instance.InsertUsuario(usuario);
                return new JavaScriptSerializer().Serialize("done successfully!");
            }
            catch
            {
                return new JavaScriptSerializer().Serialize("done with error!");
            }
        }

        [WebMethod]
        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        public string UpdateUsuario(int id, string nome, string login, string senha, string email, int idade, char sexo, string UrlImagem)
        {
            try
            {
                var usuario = new Usuario()
                {
                    IdUsuario = id,
                    Nome = nome,
                    Login = login,
                    Senha = senha,
                    Email = email,
                    Idade = idade,
                    Sexo = sexo.ToString(),
                    UrlImagem = UrlImagem
                };
                Facade.Instance.UpdateUsuario(usuario);                
                return new JavaScriptSerializer().Serialize("done successfully!");
            }
            catch
            {
                return new JavaScriptSerializer().Serialize("done with error!");
            }
        }

        [WebMethod]
        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        public string CarregarContatos(int idUsuario)
        {
            try
            {
                List<Usuario> usuarios = Facade.Instance.CarregarContatos(idUsuario);
                string str = "";

                foreach (var usuario in usuarios)
                {
                    str += usuario.Nome + "|" + usuario.IdUsuario + "|";   
                }
                return new JavaScriptSerializer().Serialize(str);
            }
            catch
            {
                return new JavaScriptSerializer().Serialize("done with error!");
            }
        }

        [WebMethod]
        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        public string QualificarRota(int IdRota, int IdTipoRota, int IdUsuario)
        {
            try
            {
                Facade.Instance.QualificarRota(IdRota,IdTipoRota,IdUsuario);
                return new JavaScriptSerializer().Serialize("done successfully!");
            }
            catch
            {
                return new JavaScriptSerializer().Serialize("done with error!");
            }
        }

        [WebMethod]
        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        public string GetRotas(int IdUsuario)
        {
            try
            {
                return Facade.Instance.GetRotas(IdUsuario);
                return new JavaScriptSerializer().Serialize("done successfully!");
            }
            catch
            {
                return new JavaScriptSerializer().Serialize("done with error!");
            }
        }

        [WebMethod]
        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        public string CarregarRotas()
        {
            try
            {
                return Facade.Instance.CarregarRotas();
                //return new JavaScriptSerializer().Serialize("done successfully!");
            }
            catch
            {
                return new JavaScriptSerializer().Serialize("done with error!");
            }
        }

        [WebMethod]
        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        public string CarregarTipoRotas()
        {
            try
            {
                return Facade.Instance.CarregarTipoRotas();
                //return new JavaScriptSerializer().Serialize("done successfully!");
            }
            catch
            {
                return new JavaScriptSerializer().Serialize("done with error!");
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
        //        return new JavaScriptSerializer().Serialize(str);
        //    }
        //    catch
        //    {
        //        return new JavaScriptSerializer().Serialize("done with error!");
        //    }
        //}
    }
}
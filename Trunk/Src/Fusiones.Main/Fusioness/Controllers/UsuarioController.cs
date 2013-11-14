using System.Web.Mvc;
using Fusioness.Models.Usuarios;
using Fusioness.Models.Seguranca;
using System.Web;
using System.Linq;
using System.Collections.Generic;
using Fusioness.FusionessWS;
using System;
using System.IO;


namespace Fusioness.Controllers
{
    public class UsuarioController : BaseController
    {
        [PermiteAnonimo]
        public ActionResult Index(UsuarioModel model)
        {
            return RedirectToAction("InserirAlterarUsuario");
        }

        [PermiteAnonimo]
        [HttpPost]
        public ActionResult InserirAlterarUsuario(UsuarioModel model)
        {
            bool IsAdd = model.Usuario.IdUsuario == 0;
            var usuarios = Servico.ListarUsuarios();
            var usuariologado = BaseController.ObterUsuarioLogado(HttpContext);
            model.IsEmailOK = CheckEmail(usuarios, usuariologado,model.Usuario);
            model.IsLoginOK = CheckLogin(usuarios, usuariologado,model.Usuario);
            model.IsSenhaOK = CheckSenha(usuariologado, model.Usuario);

            if (model.ValidarUsuario(ModelState))
            {
                if (IsAdd)
                {
                    model.Usuario.UrlImagem = "avatar.png";
                    model.Usuario = Servico.InserirUsuario(model.Usuario);
                }
                else
                {
                    if (!string.IsNullOrWhiteSpace(model.NovaSenha))
                    {
                        model.Usuario.Senha = model.NovaSenha;
                    }
                    model.Usuario = Servico.AlterarUsuario(model.Usuario);
                }
                // atualiza o usuario na session ou nao vai mostrar os dados corretos no reload
                try
                {
                    (new BaseController()).EfetuarLogon(model.Usuario, HttpContext);
                }
                catch (System.Exception ex)
                {
                    ExibirModal(ex.Message);
                }
                
                return IsAdd ? RedirectToAction("Index","Home") : RedirectToAction("Index", model);
            }
            else
            {
                model.CarregarParametrosView();
                return View(model);
            }
        }

        [PermiteAnonimo]
        [HttpGet]
        public ActionResult InserirAlterarUsuario()
        {
            var model = new UsuarioModel();
            model.Usuario = BaseController.ObterUsuarioLogado(Request.RequestContext.HttpContext);
            model.CarregarParametrosView();
            return View(model);
        }

        [PermiteAnonimo]
        [HttpGet]
        public ActionResult Registrar()
        {
            var model = new UsuarioModel();
            model.Usuario = BaseController.ObterUsuarioLogado(Request.RequestContext.HttpContext);
            model.CarregarParametrosView();
            return View(model);
        }

        [PermiteAnonimo]
        [HttpPost]
        public ActionResult Registrar(UsuarioModel model)
        {
            return InserirAlterarUsuario(model);
        }

        [HttpGet]
        public ActionResult VerPerfilUsuario(int IdUsuario)
        {
            if (IdUsuario <= 0) return RedirectToAction("Index", "Home");
            var model = new UsuarioModel();
            model.Usuario = Servico.ObterUsuariosIds(new int[] { IdUsuario }).FirstOrDefault();
            
            var eventosDoUsuario = Servico.ListarEventosPorUsuario(new Usuario {IdUsuario = IdUsuario}).ToList();
            if (eventosDoUsuario.Any())
            {
                eventosDoUsuario = eventosDoUsuario.OrderBy(e => e.Data).ToList();
                if(IdUsuario != UsuarioLogado.IdUsuario) eventosDoUsuario = eventosDoUsuario.Where(e => e.Publico).ToList();
                model.UltimosEventos = eventosDoUsuario.Take(10).ToList();
            }

            var comentarios = Servico.ListarComentariosPorUsuario(new Usuario {IdUsuario = IdUsuario}).ToList();
            if (comentarios.Any())
            {
                var idsEventos = comentarios.Select(e => e.IdEvento).Distinct().ToArray();
                var eventosComentario = Servico.ListarEventos(idsEventos).ToList();
                comentarios.ForEach(c => c.Evento = eventosComentario.First(e => e.IdEvento == c.IdEvento));
                if (IdUsuario != UsuarioLogado.IdUsuario) comentarios = comentarios.Where(c => c.Evento.Publico).ToList();
                comentarios = comentarios.OrderBy(c => c.Data).ToList();
                comentarios.Reverse();
                comentarios = comentarios.GroupBy(c => c.IdEvento).Select(c => c.First()).ToList();
                model.UltimosComentarios = comentarios.Take(10).ToList();
            }

            //eu posso visualizar meu proprio perfil
            model.UsuarioLogado = this.UsuarioLogado;
                                    
            return View("Perfil",model);
        }

        public ActionResult EnviarImagem(HttpPostedFileBase image)
        {
            string retorno = string.Empty;
            try
            {
                var validaImagem = new ValidarImagem(image);
                if (validaImagem.IsImagemValida)
                {
                    var ms = new MemoryStream();
                    image.InputStream.CopyTo(ms);
                    byte[] bytes = ms.ToArray();
                    var usuario = BaseController.ObterUsuarioLogado(Request.RequestContext.HttpContext);
                    string fs = Servico.InserirFotoUsuario(usuario, image.FileName, bytes);
                    usuario.UrlImagem = fs;
                    ExibirModal("Imagem enviada com sucesso.");
                }
                else
                {
                    throw new Exception(validaImagem.Retorno);
                }
            }
            catch (Exception e)
            {
                ExibirModal(e.Message);
            }
            return RedirectToAction("Index");
        }

        [PermiteAnonimo]
        [HttpPost]
        public ActionResult GerarTokenRecuperarSenha(string email)
        {
            try
            {
                var usuario = Servico.ListarUsuariosPorEmail(email);
                if (string.IsNullOrWhiteSpace(email) || !System.Text.RegularExpressions.Regex.IsMatch(email, @"^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$"))
                {
                    ExibirModal("e-mail inválido.");
                }
                else if (usuario == null || usuario.IdUsuario == 0)
                {
                    ExibirModal("e-mail não cadastrado em nosso sistema.");
                }
                else
                {
                    string srt = HttpContext.Request.Url.PathAndQuery;
                    string url = HttpContext.Request.Url.AbsoluteUri.Replace(srt, "/");
                    Servico.GerarTokenUsuarioSemSenha(usuario, url);
                    ExibirModal(String.Format("e-mail enviado para {0} com instruções para reset de password.", email));
                }
            }
            catch (Exception e)
            {
                ExibirModal(e.Message);
            }
            return View("EsqueciMinhaSenha");
        }

        [PermiteAnonimo]
        public ActionResult EsqueciMinhaSenha()
        {
            return View("EsqueciMinhaSenha");
        }

        [PermiteAnonimo]
        [HttpGet]
        public ActionResult RecuperarMinhaSenha(string token)
        {
            var model = new RecuperarSenhaModel();
            model.Token = token;
            model.Usuario = Servico.ObterUsuarioPorToken(token);
            model.Isvalid = model.ValidaModel(true);
            return View("RecuperarMinhaSenha",model);
        }
        [PermiteAnonimo]
        [HttpPost]
        public ActionResult RecuperarMinhaSenha(RecuperarSenhaModel model)
        {
            model.Usuario = Servico.ObterUsuarioPorToken(model.Token);
            model.Isvalid = model.ValidaModel(false);
            if (model.Isvalid)
            {
                var usertokensenha = Servico.ObterUsuarioTokenSenhaPorToken(model.Token);
                usertokensenha.JaUsado = true;
                usertokensenha = Servico.AlterarUsuarioTokenSenha(usertokensenha);
                model.Usuario.Senha = model.NovaSenha;
                model.Usuario = Servico.AlterarUsuario(model.Usuario);
                model.IsSenhaNova = true;
                model.Mensagem = "Senha alterada com sucesso. Clique voltar.";
            }
            return View("RecuperarMinhaSenha", model);
        }

        private bool CheckEmail(Usuario[] usuarios,Usuario usuariologado, Usuario usuariomodel)
        {
            // se o e-mail já existir e não for do mesmo usuário que está mudando o perfil ret false
            bool ret = true;
            if (usuarios.Select(c => c.Email).Contains(usuariomodel.Email))
            {
                ret = usuariologado != null && usuariomodel.Email == usuariologado.Email;
            }
            return ret;
        }

        private bool CheckLogin(Usuario[] usuarios,Usuario usuariologado, Usuario usuariomodel)
        {
            // se o login já existir e não for do mesmo usuário que está mudando o perfil ret false
            bool ret = true;
            if (usuarios.Select(c => c.Login).Contains(usuariomodel.Login))
            {
                ret = usuariologado != null && usuariomodel.Login == usuariologado.Login;
            }
            return ret;
        }

        private bool CheckSenha(Usuario usuariologado, Usuario usuario)
        {
            return usuariologado == null || usuariologado.Senha == usuario.Senha;
        }
    }
}

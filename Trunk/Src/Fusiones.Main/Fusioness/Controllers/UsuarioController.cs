using System.Web.Mvc;
using Fusioness.Models.Usuarios;
using Fusioness.Models.Seguranca;
using System.Web;
using System.Linq;
using System.Collections.Generic;
using Fusioness.FusionessWS;


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
            var model = new UsuarioModel();
            model.Usuario = Servico.ObterUsuariosIds(new int[] { IdUsuario }).FirstOrDefault();
            //eu posso visualizar meu proprio perfil
            model.UsuarioLogado = this.UsuarioLogado;
                                    
            return View("Perfil",model);
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
            return usuariologado.Senha == usuario.Senha;
        }
    }
}

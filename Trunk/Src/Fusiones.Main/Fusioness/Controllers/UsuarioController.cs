using System.Web.Mvc;
using Fusioness.Models.Usuarios;
using Fusioness.Models.Seguranca;
using System.Web;
using System.Linq;
using System.Collections.Generic;

namespace Fusioness.Controllers
{
    public class UsuarioController : BaseController
    {
        [PermiteAnonimo]
        public ActionResult Index(UsuarioModel model)
        {
            //model.Usuario = BaseController.ObterUsuarioLogado(Request.RequestContext.HttpContext);
            //return View("InserirAlterarUsuario", model);
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

            if (model.ValidarUsuario(ModelState))
            {
                if (IsAdd)
                {
                    model.Usuario = Servico.InserirUsuario(model.Usuario);
                }
                else
                {
                    model.Usuario = Servico.AlterarUsuario(model.Usuario);
                }
                // atualiza o usuario na session ou nao vai mostrar os dados corretos no reload
                (new BaseController()).EfetuarLogon(model.Usuario,HttpContext);
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

        [HttpGet]
        public ActionResult VerPerfilUsuario(int IdUsuario)
        {
            var model = new UsuarioModel();
            model.Usuario = Servico.ObterUsuariosIds(new int[] { IdUsuario }).FirstOrDefault();
            //eu posso visualizar meu proprio perfil
            var usuarioLogado = BaseController.ObterUsuarioLogado(Request.RequestContext.HttpContext);
            model.IsMyself = usuarioLogado.IdUsuario == IdUsuario;
            //eu posso add/del um contato
            var lstContatos = Servico.ListarContatosDoUsuario(usuarioLogado);
            var contato = lstContatos.Where(c => c.IdUsuario == usuarioLogado.IdUsuario && c.IdContato == IdUsuario).FirstOrDefault();
            model.IsContato = contato != null;
            return View("Perfil",model);
        }

        private bool CheckEmail(FusionessWS.Usuario[] usuarios,FusionessWS.Usuario usuariologado, FusionessWS.Usuario usuariomodel)
        {
            // se o e-mail já existir e não for do mesmo usuário que está mudando o perfil ret false
            bool ret = true;
            if (usuarios.Select(c => c.Email).Contains(usuariomodel.Email))
            {
                ret = usuariologado != null && usuariomodel.Email == usuariologado.Email;
            }
            return ret;
        }

        private bool CheckLogin(FusionessWS.Usuario[] usuarios,FusionessWS.Usuario usuariologado, FusionessWS.Usuario usuariomodel)
        {
            // se o login já existir e não for do mesmo usuário que está mudando o perfil ret false
            bool ret = true;
            if (usuarios.Select(c => c.Login).Contains(usuariomodel.Login))
            {
                ret = usuariologado != null && usuariomodel.Login == usuariologado.Login;
            }
            return ret;
        }
    }
}

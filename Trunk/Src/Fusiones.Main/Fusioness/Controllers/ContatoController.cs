using System;
using System.Linq;
using System.Web.Mvc;
using Fusioness.FusionessWS;
using Fusioness.Models.Contatos;

namespace Fusioness.Controllers
{
    public class ContatoController : BaseController
    {
        public ActionResult Index(ContatoModel model)
        {
            var idsContatos = Servico.ListarContatosDoUsuario(UsuarioLogado).Select(c => c.IdContato).ToList();
            if (idsContatos.Any()) model.ListaDeUsuarios = Servico.ObterUsuariosIds(idsContatos.ToArray());
            return View(model);
        }

        public ActionResult AdicionarRemoverContato(int IdContato, bool IsAdd)
        {
            var usuarioLogado = BaseController.ObterUsuarioLogado(Request.RequestContext.HttpContext);
            if (IsAdd)
            {
                var NovoContato = new Contato()
                {
                    IdUsuario = usuarioLogado.IdUsuario,
                    IdContato = IdContato
                };
                NovoContato = Servico.InserirContato(NovoContato);
            }
            else
            {
                var lstContatos = Servico.ListarContatosDoUsuario(usuarioLogado);
                var contato = lstContatos.Where(c => c.IdUsuario == usuarioLogado.IdUsuario && c.IdContato == IdContato).FirstOrDefault();
                if (contato != null)
                {
                    Servico.ExcluirContato(contato);
                }
            }
            return RedirectToAction("ListarTodos");
        }

        [HttpGet]
        public ActionResult ListarTodos()
        {
            var model = new ContatoModel();
            model.ListaDeUsuarios = Servico.ListarUsuarios();
            return View("index",model);
        }

        public ActionResult MeusContatos()
        {
            var model = new ContatoModel();
            var usuario = BaseController.ObterUsuarioLogado(HttpContext);
            var MeusContatos = Servico.ListarContatosDoUsuario(usuario);
            var usuarios = Servico.ObterUsuariosIds(MeusContatos.Select(c => c.IdContato).ToArray());
            model.ListaDeUsuarios = usuarios;
            return View("index", model);
        }

        public ActionResult AceitarRejeitarConvite(bool IsAceitar, int IdUsuario)
        {
            var usuariologado = BaseController.ObterUsuarioLogado(HttpContext);
            Contato contato;
            if (IsAceitar)
            {
                contato = new Contato()
                {
                    IdUsuario = usuariologado.IdUsuario,
                    IdContato = IdUsuario
                };
                contato = Servico.InserirContato(contato);
            }
            else
            {
                contato = new Contato()
                {
                    IdUsuario = IdUsuario,
                    IdContato = usuariologado.IdUsuario
                };
                var ret = Servico.ExcluirContato(contato);
            }
            return RedirectToAction("MeusContatos");
        }
    }
}

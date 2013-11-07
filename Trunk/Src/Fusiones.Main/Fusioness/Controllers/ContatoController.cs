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
            model = new ContatoModel();
            model.ListaDeUsuarios = Servico.ListarUsuarios().OrderBy(x => x.Nome).ToArray();
            return View(model);
        }

        public ActionResult AdicionarRemoverContato(int IdContato, bool IsAdd)
        {
            if (IsAdd)
            {
                var NovoContato = new Contato()
                {
                    IdUsuario = this.UsuarioLogado.IdUsuario,
                    IdContato = IdContato
                };
                NovoContato = Servico.InserirContato(NovoContato);

                if (NovoContato.StatusRetorno == 0)
                {
                    ExibirModal("O convite foi enviado com sucesso. Aguarde que o amigo o aceite =)");
                }
                else
                {
                    ExibirModal("Ocorreu algum erro ao adicionar a amizade, tente novamente.");
                }
            }
            else
            {
                if (IdContato > 0)
                {
                    var lstContatos = Servico.ListarContatosDoUsuario(this.UsuarioLogado);
                    var contato = lstContatos.Where(c => c.IdUsuario == this.UsuarioLogado.IdUsuario && c.IdContato == IdContato).FirstOrDefault();
                    if (contato != null)
                    {
                        Servico.ExcluirContato(contato);
                        ExibirModal("A amizade foi desfeita, mas ainda dá tempo de voltar atrás... Adiciona de novo!");
                    }
                }
            }

            return RedirectToAction("VerPerfilUsuario", "Usuario", new { IdUsuario = IdContato });
        }

        public ActionResult MeusContatos()
        {
            var model = new ContatoModel();
            var usuario = BaseController.ObterUsuarioLogado(HttpContext);
            var MeusContatos = Servico.ListarContatosDoUsuario(usuario);
            var usuarios = Servico.ObterUsuariosIds(MeusContatos.Select(c => c.IdContato).ToArray()).OrderBy(x => x.Nome).ToArray();
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

                if (contato.StatusRetorno == 0)
                {
                    ExibirModal("O contato foi aceito com sucesso... Sejam felizes!");
                }
                else
                {
                    ExibirModal("Ocorreu algum erro ao concretizar a amizade, tente novamente.");
                }
            }
            else
            {
                contato = new Contato()
                {
                    IdUsuario = IdUsuario,
                    IdContato = usuariologado.IdUsuario
                };
                var ret = Servico.ExcluirContato(contato);
                ExibirModal("Convite rejeitado! O seu amigo vai ficar triste... :/");
            }
            return RedirectToAction("MeusContatos");
        }
    }
}

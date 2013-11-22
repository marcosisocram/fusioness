using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Web.Mvc;
using Fusioness.FusionessWS;
using Fusioness.Models.Rotas;
using TimeSpan = System.TimeSpan;
using System.Web;
using System.IO;


namespace Fusioness.Controllers
{
    public class RotaController : BaseController
    {
        public ActionResult Index(RotaModel model)
        {
            model.ListaRotas = Servico.ListarRotasPorUsuario(this.UsuarioLogado);
            
            // Carrega os parâmetros (listas) a serem exibidas na view e 
            // preenche alguns atributos em Rota que não vêm populados pelo serviço.
            model.carregarParametrosView();

            ViewBag.Titulo = "Rotas Originais";

            return View(model);
        }

        public ActionResult ListarRotasRealizadas(RotaModel model)
        {
            model.ListaRotasOriginais = Servico.ListarRotasPorUsuario(this.UsuarioLogado);
            model.ListaRotas = Servico.ListarRotasRealizadasPorUsuario(this.UsuarioLogado);
            // Carrega os parâmetros (listas) a serem exibidas na view e 
            // preenche alguns atributos em Rota que não vêm populados pelo serviço.
            model.carregarParametrosView();

            model.ExibirFiltro = true;

            ViewBag.Titulo = "Rotas Realizadas";

            return View("Index", model);
        }

        public JsonResult ListarRotasPorRota(int id)
        {
            if (id == 0) return Json(null);

            var rotas = Servico.ListarRotasRealizadasPorRotaOriginal(new Rota { IdRota = id });

            var listaRetorno = rotas.Select(r => new
            {
                Id = r.IdRota,
                UrlImagem = "",
                r.Descricao,
            }).ToList();

            return Json(listaRetorno);

        }

        public ActionResult Detalhar(int idRota = 0)
        {
            RotaModel model = new RotaModel();

            model.carregarParametrosView();

            model.Rota = new Rota() { IdRota = idRota };
            model.Rota = Servico.ObterRotaPorId(model.Rota);
            model.ListaCoordenadas = Servico.ListarCoordenadasPorRota(model.Rota);
            model.ListaPontosReferencia = Servico.ListarPontosReferenciaPorRota(model.Rota);

            return View("InserirAlterarRota", model);
        }

        public ActionResult InserirAlterarRota(RotaModel model)
        {
            if (model.ValidarRota(ModelState))
            {
                string msg = string.Empty;

                model.Rota.IdUsuario = this.UsuarioLogado.IdUsuario;

                if (model.Rota.IdRota > 0)
                {
                    model.Rota = Servico.AlterarRota(model.Rota);
                    msg = "Rota alterada com sucesso.";
                }
                else
                {
                    model.Rota = Servico.InserirRota(model.Rota);
                    msg = "Rota cadastrada com sucesso.";
                }

                if (model.Rota == null || model.Rota.IdRota <= 0)
                {
                    ExibirModal("Erro ao cadastrar rota.");
                }
                else
                {
                    ExibirModal(msg);
                }

                return RedirectToAction("Index", model);
            }
            else
            {
                model.carregarParametrosView();
                return View(model);
            }
           
        }

        // Este método é chamado no momento que será cadastrada uma rota.
        [HttpGet]
        public ActionResult InserirAlterarRota()
        {
            RotaModel model = new RotaModel();
            model.carregarParametrosView();
            return View(model); 
        }

        public ActionResult RemoverPontoDeReferencia(int id)
        {
            Servico.RemoverPontoDeReferencia(new Coordenada() { IdCoordenada = id });
            return Redirect(Request.UrlReferrer.ToString());
        }

        public ActionResult RemoverImagem(int id)
        {
            Servico.RemoverImagemPontoDeReferencia(new Coordenada() { IdCoordenada = id });
            return Redirect(Request.UrlReferrer.ToString());
        }

    }
}



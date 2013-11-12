using System.Web.Mvc;
using Fusioness.Models.Rotas;
using Fusioness.FusionessWS;
using System.Collections.Generic;


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
            model.carregarAtributos();
            
            return View(model);
        }

        public ActionResult Detalhar(int Id = 0)
        {
            RotaModel model = new RotaModel();

            model.carregarParametrosView();

            model.Rota = new Rota() { IdRota = Id };
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
                    // Criando as coordenadas fake.
                    //criarCoordenadas(model);
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

        private void criarCoordenadas(RotaModel model)
        {
            // ----------------------------Código MOCK apenas para ver se cadastra coordenadas corretamente.--------------------------
            Coordenada c1 = new Coordenada();
            c1.Latitude = -8.05076226;
            c1.Longitude = -34.87983403;

            Coordenada c2 = new Coordenada();
            c2.Latitude = -8.03076226;
            c2.Longitude = -35.87983403;

            List<Coordenada> listaCoordenadas = new List<Coordenada>();
            listaCoordenadas.Add(c1);
            listaCoordenadas.Add(c2);

            c1.IdRota = model.Rota.IdRota;
            c2.IdRota = model.Rota.IdRota;

            Servico.InserirListaCoordenadas(listaCoordenadas.ToArray());

            // ---------------------------Fim do código MOCK------------------------------------------------------------------------

        }

    }
}



using System.Collections.Generic;
using Fusioness.FusionessWS;
using System.Web.Mvc;
using System.Linq;
using System.Linq.Expressions;
using System;

namespace Fusioness.Models.Rotas
{
    public class RotaModel
    {
        public Rota Rota{ get; set; }
        public IList<TipoPista> TiposDePista { get; set; }
        public IList<Dificuldade> TiposDeDificuldade { get; set; }
        public IList<QualidadeRota> TiposDeQualidade{ get; set; }
        public IList<Rota> ListaRotas { get; set; }
        public IList<Rota> ListaRotasOriginais { get; set; }
        public IList<Coordenada> ListaCoordenadas { get; set; }        
        public IList<Coordenada> ListaPontosReferencia { get; set; }
        public bool ExibirFiltro { get; set; }

        public bool ValidarRota(ModelStateDictionary ModelState)
        {
            bool retorno = true;
            if (string.IsNullOrWhiteSpace(Rota.Descricao))
            {
                ModelState.AddModelError("Descrição", "Preencha uma descrição.");
                retorno = false;
            }

            return retorno;
        }

        public void carregarParametrosView()
        {
            MainService Servico = new MainService();
            
            TiposDeDificuldade = Servico.ListarDificuldades();
            TiposDePista = Servico.ListarTiposPista();
            TiposDeQualidade = Servico.ListarQualidadesRota();
        }
        
        public string TempoMedio(int idRota, Usuario usuario)
        {
            List<double> ltTotalMinutos = new List<double>();
            string lblTempoMedio = "Tempo Médio: ";

            MainService Servico = new MainService();

            Rota[] rotasSubsequentes = Servico.ListarRotasRealizadasPorRotaOriginal(new Rota { IdRota = idRota });
            Evento[] eventos = Servico.ListarEventosPorUsuario(usuario);
            EventoUsuario[] eventosUsuario = Servico.ListarEventoUsuario(usuario);
            
            
            if (rotasSubsequentes.Length == 0 || eventos.Length == 0 || eventosUsuario.Length == 0)
            {
                return "Sem Tempo Médio";
            }

            List<Evento> ltEventos = eventos.Where(evnt => rotasSubsequentes.Any(rts => evnt.IdRota == rts.IdRota)).ToList();            
            
            List<EventoUsuario> ltEventosUsuario = eventosUsuario.Where(e => ltEventos.Any(ev => e.IdEvento == ev.IdEvento)).ToList();

            if (ltEventosUsuario != null && ltEventosUsuario.Count > 0)
            {
                DateTime dataAtual = DateTime.Now;
                foreach (var item in ltEventosUsuario)
                {
                    DateTime dateInicial;
                    int horas = 0;
                    int Minutos = 0;
                    double TotalMinutos = 0;

                    if (item.DataInicial != null)
                    {
                        dateInicial = Convert.ToDateTime(item.DataInicial);
                        if (item.DataFinal != null)
                        {
                            DateTime dataFinal = Convert.ToDateTime(item.DataFinal);
                            horas = (dataFinal - dateInicial).Hours;
                            Minutos = (dataFinal - dateInicial).Minutes;
                            TotalMinutos = (dataFinal - dateInicial).TotalMinutes;
                        }
                        else
                        {
                            horas = (dataAtual - dateInicial).Hours;
                            Minutos = (dataAtual - dateInicial).Minutes;
                            TotalMinutos = (dataAtual - dateInicial).TotalMinutes;
                        }
                    }

                    ltTotalMinutos.Add(TotalMinutos);

                }


                if (ltTotalMinutos.Count > 0)
                {
                    double tempoMedio = (ltTotalMinutos.Sum(s => s)) / ltTotalMinutos.Count;
                    lblTempoMedio += ""
                        + TimeSpan.FromMinutes(tempoMedio).Hours.ToString() + ":"
                        + TimeSpan.FromMinutes(tempoMedio).Minutes.ToString() + "h";
                }
                else
                {
                    lblTempoMedio += "0h";
                }

            }
            else { lblTempoMedio = "Sem Tempo Médio"; }
            
            return lblTempoMedio;
        }
     
    }
}
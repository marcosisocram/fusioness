﻿using System.Collections.Generic;
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
        
        public double TempoMedio(int idRota)
        {
            MainService Servico = new MainService();
            return Servico.ConsultarDuracaoRota(idRota);
        }
     
    }
}
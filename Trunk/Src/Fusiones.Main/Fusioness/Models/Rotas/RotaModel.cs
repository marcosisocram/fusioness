using System.Collections.Generic;
using Fusioness.FusionessWS;

namespace Fusioness.Models.Rotas
{
    public class RotaModel
    {
        public Rota Rota{ get; set; }
        public IList<TipoRota> TiposDeRotas { get; set; }
        public IList<TipoPista> TiposDePista { get; set; }
        public IList<Dificuldade> TiposDeDificuldade { get; set; }
        public IList<QualidadeRota> TiposDeQualidade{ get; set; }
        public IList<Rota> ListaRotas { get; set; }

        public void carregarParametrosView()
        {
            MainService Servico = new MainService();
            
            TiposDeDificuldade = Servico.ListarDificuldades();
            TiposDePista = Servico.ListarTiposPista();
            TiposDeQualidade = Servico.ListarQualidadesRota();
            TiposDeRotas = Servico.ListarTiposRota();
        }
    }
}
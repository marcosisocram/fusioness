using System.Collections.Generic;
using System.Linq;
using Fusioness.FusionessWS;

namespace Fusioness.Models.Eventos
{
    public class EventoModel
    {
        public Evento Evento { get; set; }

        #region Evento

        public IList<Rota> ListaRotas { get; set; }
        public IList<Evento> ListaEventos { get; set; }
        public IList<Evento> ListaEventosQueSouDono { get; set; }

        #endregion
       
        #region Convite e Contatos
        public IList<ConviteEvento> ListaConviteEventos { get; set; }
        public IList<Resposta> RespostasPossiveis { get; set; }
        public IList<Usuario> ListaDeContatosDoUsuario { get; set; }
        #endregion

        #region Comentários

        public ComentarioEvento Comentario { get; set; }
        public IList<ComentarioEvento> ListaComentariosEvento { get; set; }
        public IList<ComentarioEvento> ListaComentariosQueSouDono { get; set; }

        #endregion

        #region Outros
        private double latitudeAtual;
        private double longitudeAtual;
        #endregion


        public EventoModel()
        {
            ListaRotas = new List<Rota>();
            ListaEventos = new List<Evento>();
            ListaEventosQueSouDono = new List<Evento>();
            ListaConviteEventos = new List<ConviteEvento>();
            RespostasPossiveis = new List<Resposta>();
            ListaDeContatosDoUsuario = new List<Usuario>();
            ListaComentariosEvento = new List<ComentarioEvento>();
            ListaComentariosQueSouDono = new List<ComentarioEvento>();
            Comentario = new ComentarioEvento();
        }

        public void carregarParametrosView(Usuario usuarioLogado, Evento eventoSelecionado)
        {
            MainService Servico = new MainService();

            ListaEventos = Servico.ListarEventos(new int[] { });

            CarregarParametrosComunsView(Servico, usuarioLogado, eventoSelecionado);
            
        }

        public void carregarParametrosViewExplore(Usuario usuarioLogado, Evento eventoSelecionado, double latitudeAtual, double longitudeAtual)
        {
            MainService Servico = new MainService();

            ListaEventos = Servico.ListarEventosComDistancia(latitudeAtual, longitudeAtual);

            CarregarParametrosComunsView(Servico, usuarioLogado, eventoSelecionado);

        }

        private void CarregarParametrosComunsView(MainService servico, Usuario usuarioLogado, Evento eventoSelecionado)
        {
            ListaEventosQueSouDono = servico.ListarEventosPorUsuario(usuarioLogado);
            ListaRotas = servico.ListarRotasPorUsuario(usuarioLogado);

            if (eventoSelecionado != null)
            {
                ListaComentariosEvento = servico.ListarComentariosPorEvento(eventoSelecionado);
                ListaComentariosQueSouDono = servico.ListarComentariosPorUsuario(usuarioLogado);
                Comentario.IdEvento = eventoSelecionado.IdEvento;
            }

            var idsContatos = servico.ListarContatosDoUsuario(usuarioLogado).ToList().Select(c => c.IdContato).ToList();
            if (idsContatos.Any()) ListaDeContatosDoUsuario = servico.ObterUsuariosIds(idsContatos.ToArray()).ToList();
        }

        public bool SouDonoDoEvento(int idEvento)
        {
            return ListaEventosQueSouDono.Any(e => e.IdEvento == idEvento);
        }

        public bool SouDonoDoComentario(int idComentario)
        {
            return ListaComentariosQueSouDono.Any(c => c.IdComentarioEvento == idComentario);
        }

        public bool IsCadastroEvento { get; set; }

    }
}
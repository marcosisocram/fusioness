using System.Collections.Generic;
using System.Linq;
using Fusioness.FusionessWS;
using System.Web.Mvc;

namespace Fusioness.Models.Eventos
{
    public class EventoModel
    {
        #region Evento

        public Evento Evento { get; set; }
        public IList<Rota> ListaRotas { get; set; }
        public IList<Evento> ListaEventos { get; set; }
        public IList<Evento> ListaEventosQueSouDono { get; set; }
        public IList<EventoUsuario> ListaEventosUsuarioQueParticipo { get; set; }
        
        public EventoUsuario EventoUsuario { get; set; }

        private bool _IsCadastroEvento;
        public bool IsCadastroEvento
        {
            get
            {
                return this.Evento != null ? this.Evento.IdEvento == 0 : false;
            }

            set { _IsCadastroEvento = value; }
        }
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

        public bool ValidarEvento(ModelStateDictionary ModelState)
        {
            bool retorno = true;
            bool IsAdd = Evento.IdEvento == 0;

            if (string.IsNullOrWhiteSpace(Evento.Titulo))
            {
                ModelState.AddModelError("Título", "Preencha o título do seu evento.");
                retorno = false;
            }

            if (Evento.Data == null)
            {
                ModelState.AddModelError("Data do Evento", "Preencha a data que acontecerá o evento.");
                retorno = false;
            }
            
            if (string.IsNullOrWhiteSpace(Evento.Descricao))
            {
                ModelState.AddModelError("Descrição", "Preencha uma breve descrição do seu evento.");
                retorno = false;
            }

            if (Evento.IdRota == 0)
            {
                ModelState.AddModelError("Rota do Evento", "Você precisa selecionar uma rota para este evento.");
                retorno = false;
            }

            return retorno;
        }

        public EventoModel()
        {
            ListaRotas = new List<Rota>();
            ListaEventos = new List<Evento>();
            ListaEventosQueSouDono = new List<Evento>();
            ListaEventosUsuarioQueParticipo = new List<EventoUsuario>();
            
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
            ListaEventos = Servico.ListarEventos(new int[] { }).Where(e => e.IdUsuario != usuarioLogado.IdUsuario).ToList();
            CarregarParametrosComunsView(Servico, usuarioLogado, eventoSelecionado);
        }

        public void carregarParametrosViewEventosQueParticipo(Usuario usuarioLogado, Evento eventoSelecionado)
        {
            MainService Servico = new MainService();
            CarregarParametrosComunsView(Servico, usuarioLogado, eventoSelecionado);

            ListaEventosUsuarioQueParticipo = Servico.ListarEventoUsuario(usuarioLogado);

            var idsEventosParticipo = ListaEventosUsuarioQueParticipo.Select(e => e.IdEvento).ToList();
            ListaEventos = Servico.ListarEventos(idsEventosParticipo.ToArray()).ToList();
        }

        public void carregarParametrosViewMeusEventos(Usuario usuarioLogado, Evento eventoSelecionado)
        {
            MainService Servico = new MainService();
            ListaEventos = Servico.ListarEventosPorUsuario(usuarioLogado);
            CarregarParametrosComunsView(Servico, usuarioLogado, eventoSelecionado);
        }

        private void CarregarParametrosComunsView(MainService servico, Usuario usuarioLogado, Evento eventoSelecionado)
        {
            ListaRotas = servico.ListarRotasPorUsuario(usuarioLogado);
            ListaEventosQueSouDono = servico.ListarEventosPorUsuario(usuarioLogado);
            
            if (eventoSelecionado != null)
            {
                ListaComentariosEvento = servico.ListarComentariosPorEvento(eventoSelecionado);
                ListaEventosUsuarioQueParticipo = servico.ListarEventoUsuario(usuarioLogado);
                ListaComentariosQueSouDono = servico.ListarComentariosPorUsuario(usuarioLogado);
                Comentario.IdEvento = eventoSelecionado.IdEvento;
                this.EventoUsuario = servico.ObterEventoUsuario(this.Evento, usuarioLogado) ?? new EventoUsuario();
            }

            var idsContatos = servico.ListarContatosDoUsuario(usuarioLogado).ToList().Select(c => c.IdContato).ToList();
            if (idsContatos.Any()) ListaDeContatosDoUsuario = servico.ObterUsuariosIds(idsContatos.ToArray()).ToList();
        }

        public void carregarParametrosViewExplore(Usuario usuarioLogado, Evento eventoSelecionado, double latitudeAtual, double longitudeAtual)
        {
            MainService Servico = new MainService();
            ListaEventos = Servico.ListarEventosComDistancia(latitudeAtual, longitudeAtual).Where(e => e.IdUsuario != usuarioLogado.IdUsuario).ToList();
            CarregarParametrosComunsView(Servico, usuarioLogado, eventoSelecionado);
        }

        public bool SouDonoDoEvento(int idEvento)
        {
            return ListaEventosQueSouDono.Any(e => e.IdEvento == idEvento);
        }

        public bool SouDonoDoComentario(int idComentario)
        {
            return ListaComentariosQueSouDono.Any(c => c.IdComentarioEvento == idComentario);
        }

        public bool SouParticipanteDoEvento(int idEvento)
        {
            return ListaEventosUsuarioQueParticipo.Any(eu => eu.IdEvento == idEvento);
        }
    }
}
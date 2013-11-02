using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Navigation;
using Microsoft.Phone.Controls;
using Microsoft.Phone.Shell;
using Fusioness.Mobile.Util;
using System.Windows.Media;

namespace Fusioness.Mobile.Views
{
    public partial class Comentario : PhoneApplicationPage
    {
        private int EventoId = -1;

        protected override void OnNavigatedTo(NavigationEventArgs e)
        {
            base.OnNavigatedTo(e);

            string site;

            if (NavigationContext.QueryString.TryGetValue("EventoId", out site))
            {
                EventoId = Convert.ToInt32(site);
            }
        }

        public Comentario()
        {
            InitializeComponent();
        }

        private void btSalvar_Click(object sender, EventArgs e)
        {
            if (!String.IsNullOrEmpty(this.txtComentario.Text.ToString()))
            {
                FusionessWS.ComentarioEvento comentario = new FusionessWS.ComentarioEvento();
                comentario.IdEvento = EventoId;
                comentario.IdUsuario = Global.usuarioLogado.IdUsuario;
                comentario.Descricao = this.txtComentario.Text.ToString();
                comentario.Data = DateTime.Now;
                FusionessWS.MainServiceSoapClient servico = new FusionessWS.MainServiceSoapClient();
                servico.InserirComentarioEventoAsync(comentario);
                servico.InserirComentarioEventoCompleted += servico_InserirComentarioEventoCompleted;
            }
            else
            {
                MessageBox.Show("Adicione um Comentário!","Alerta!",MessageBoxButton.OK);
            }
        }

        void servico_InserirComentarioEventoCompleted(object sender, FusionessWS.InserirComentarioEventoCompletedEventArgs e)
        {
            FusionessWS.ComentarioEvento comentario = e.Result;
            if (comentario != null)
            {
                NavigationService.Navigate(new Uri("/Views/Evento.xaml?EventoId=" + EventoId.ToString(), UriKind.Relative));
            }
            else
            {
                MessageBox.Show("Não foi possivél adicionar seu comentário, Verifique sua conexão com a internet!", "Alerta!", MessageBoxButton.OK);
            }
        }

        private void btCancelar_Click(object sender, EventArgs e)
        {
            NavigationService.GoBack();
        }
    }
}
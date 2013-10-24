using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Navigation;
using Microsoft.Phone.Controls;
using Microsoft.Phone.Shell;
using System.Collections.ObjectModel;
using Fusioness.Mobile.ViewModels;
using Fusioness.Mobile.Util;

namespace Fusioness.Mobile.Views
{
    public partial class Evento : PhoneApplicationPage
    {
        public ObservableCollection<ItemViewModel> Comentarios { get; private set; }
        int EventoId = -1;
        FusionessWS.Evento evento = new FusionessWS.Evento();

        protected override void OnNavigatedTo(NavigationEventArgs e)
        {
            base.OnNavigatedTo(e);

            string site;

            if (NavigationContext.QueryString.TryGetValue("EventoId", out site))
            {
                EventoId = Convert.ToInt32(site);
            }
        }

        public Evento()
        {
            InitializeComponent();
        }

        /// <summary>
        /// Creates and adds a few ItemViewModel objects into the Items collection.
        /// </summary>
        public void LoadData()
        {
            this.Comentarios = new ObservableCollection<ItemViewModel>();

            evento.IdEvento = EventoId;

            FusionessWS.MainServiceSoapClient servico = new FusionessWS.MainServiceSoapClient();

            servico.ObterEventoPorIdAsync(evento);
            servico.ObterEventoPorIdCompleted += servico_ObterEventoPorIdCompleted;
            
        }

        void servico_ObterEventoPorIdCompleted(object sender, FusionessWS.ObterEventoPorIdCompletedEventArgs e)
        {
            evento = e.Result;
            if (evento != null)
            {
                
                    //this.imgEvento.UriSource = new Uri("http://31.media.tumblr.com/tumblr_m3evdtpgE61r2y7tvo1_1280.jpg", UriKind.Relative);//evento.UrlImagem,   
                    this.lbTituloEvento.Text = evento.Titulo;
                    //EventoData = evento.Data.ToString("dd/MM/yyyy");

                FusionessWS.MainServiceSoapClient servico = new FusionessWS.MainServiceSoapClient();
                servico.ListarComentariosPorEventoAsync(evento);
                servico.ListarComentariosPorEventoCompleted += servico_ListarComentariosPorEventoCompleted;
            }
        }

        void servico_ListarComentariosPorEventoCompleted(object sender, FusionessWS.ListarComentariosPorEventoCompletedEventArgs e)
        {
            IList<FusionessWS.ComentarioEvento> comentarios = e.Result;
            if (comentarios != null)
            {
                foreach (var item in comentarios)
                {
                    this.Comentarios.Add(new ItemViewModel()
                    {
                        ComentarioId = item.IdComentarioEvento,
                        ComentarioDescricao = item.Descricao,
                        ContatoId = item.IdUsuario,
                        ContatoImagem = "http://31.media.tumblr.com/tumblr_m3evdtpgE61r2y7tvo1_1280.jpg",
                        ContatoNome = item.Usuario.Nome
                    });
                }
                llsComentario.ItemsSource = this.Comentarios;
            }
        }

        private void PhoneApplicationPage_Loaded(object sender, RoutedEventArgs e)
        {
            LoadData();
        }
    }
}
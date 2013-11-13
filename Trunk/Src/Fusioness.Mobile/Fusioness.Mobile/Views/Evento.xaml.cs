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
using System.IO;

namespace Fusioness.Mobile.Views
{
    public partial class Evento : PhoneApplicationPage
    {
        public ObservableCollection<ItemViewModel> Comentarios { get; private set; }
        int EventoId = -1;
        int RotaId = -1;
        FusionessWS.Evento evento = new FusionessWS.Evento();
        Stream output;

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
            try
            {
                this.Comentarios = new ObservableCollection<ItemViewModel>();

                evento.IdEvento = EventoId;

                FusionessWS.MainServiceSoapClient servico = new FusionessWS.MainServiceSoapClient();

                servico.ObterEventoPorIdAsync(evento);
                servico.ObterEventoPorIdCompleted += servico_ObterEventoPorIdCompleted;
            }
            catch (Exception)
            {
                MessageBox.Show("Não foi possível enviar sua resposta, Verifique sua conexão com a internet", "Alerta!", MessageBoxButton.OK);
            }
        }

        void servico_ObterEventoPorIdCompleted(object sender, FusionessWS.ObterEventoPorIdCompletedEventArgs e)
        {
            try
            {
                evento = e.Result;
                if (evento != null)
                {
                    try
                    {
                        string file = ((String.IsNullOrEmpty(evento.UrlImagem)) ? Global.imgEventoDefault : Global.linkImagem + evento.UrlImagem);
                        output = new FileStream(file, FileMode.Open);
                        byte[] buffer = new byte[32 * 1024];
                        int read;
                        while ((read = output.Read(buffer, 0, buffer.Length)) > 0)
                        {
                            output.Write(buffer, 0, read);
                        }

                        this.imgEvento.SetSource(output);
                        output.Dispose();
                    }
                    catch (ArgumentException)
                    {
                        //Não encontrou a imagem
                    }
                    RotaId = evento.IdRota;
                    this.lbTituloEvento.Text = evento.Titulo;
                    //EventoData = evento.Data.ToString("dd/MM/yyyy");

                    FusionessWS.MainServiceSoapClient servico = new FusionessWS.MainServiceSoapClient();
                    servico.ListarComentariosPorEventoAsync(evento);
                    servico.ListarComentariosPorEventoCompleted += servico_ListarComentariosPorEventoCompleted;
                }
            }
            catch (Exception)
            {
                MessageBox.Show("Não foi possível enviar sua resposta, Verifique sua conexão com a internet", "Alerta!", MessageBoxButton.OK);
                NavigationService.GoBack();
            }
        }

        void servico_ListarComentariosPorEventoCompleted(object sender, FusionessWS.ListarComentariosPorEventoCompletedEventArgs e)
        {
            try
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
                            ContatoImagem = Global.linkImagem + ((String.IsNullOrEmpty(item.Usuario.UrlImagem)) ? Global.imgUsuarioDefault : item.Usuario.UrlImagem),
                            ContatoNome = item.Usuario.Nome
                        });
                    }
                    llsComentario.ItemsSource = this.Comentarios;
                }
            }
            catch (Exception)
            {
                MessageBox.Show("Não foi possível enviar sua resposta, Verifique sua conexão com a internet", "Alerta!", MessageBoxButton.OK);
            }
        }

        private void PhoneApplicationPage_Loaded(object sender, RoutedEventArgs e)
        {
            LoadData();
        }

        private void btComentar_Click(object sender, EventArgs e)
        {
            NavigationService.Navigate(new Uri("/Views/Comentario.xaml?EventoId=" + EventoId.ToString(), UriKind.Relative));
        }

        private void menuIniciar_Click(object sender, EventArgs e)
        {
            NavigationService.Navigate(new Uri("/Views/RotaMap.xaml?RotaId=" + RotaId.ToString() +  "&EventoId=" + EventoId.ToString(), UriKind.Relative));
        }

        private void menuVisualizarRota_Click(object sender, EventArgs e)
        {

        }

        private void menuTempoEvento_Click(object sender, EventArgs e)
        {
            NavigationService.Navigate(new Uri("/Views/TempoAtualDoEvento.xaml?EventoId=" + EventoId.ToString(), UriKind.Relative));
        }
    }
}
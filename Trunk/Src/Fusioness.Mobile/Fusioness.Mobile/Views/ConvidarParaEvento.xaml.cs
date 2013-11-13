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
    public partial class ConvidarParaEvento : PhoneApplicationPage
    {
        public ObservableCollection<ItemViewModel> Contatos { get; private set; }
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

        public ConvidarParaEvento()
        {
            InitializeComponent();
        }

        private void llsContatos_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            try
            {
                var res = (sender as LongListSelector).SelectedItem as ItemViewModel;

                MessageBoxResult result = MessageBox.Show("Deseja Convidar " + res.ContatoNome + "?", "Convidar?", MessageBoxButton.OKCancel);
                if (result == MessageBoxResult.OK)
                {
                    FusionessWS.MainServiceSoapClient servico = new FusionessWS.MainServiceSoapClient();
                    FusionessWS.Evento evento = new FusionessWS.Evento() { IdEvento = EventoId };
                    FusionessWS.ArrayOfInt idsContatos = new FusionessWS.ArrayOfInt();
                    idsContatos.Add(res.ContatoId);

                    servico.ConvidarUsuariosAsync(Global.usuarioLogado, evento, idsContatos);
                    servico.ConvidarUsuariosCompleted += servico_ConvidarUsuariosCompleted;
                }
            }
            catch (Exception)
            {
                MessageBox.Show("Não foi possível enviar sua resposta, Verifique sua conexão com a internet", "Alerta!", MessageBoxButton.OK);
            }
        }

        void servico_ConvidarUsuariosCompleted(object sender, FusionessWS.ConvidarUsuariosCompletedEventArgs e)
        {
            try
            {
                if (e.Result != null)
                {
                    MessageBox.Show("Convite enviado com sucesso.");                    
                    NavigationService.Navigate(new Uri("/MainPage.xaml", UriKind.Relative));
                }
            }
            catch (Exception)
            {
                MessageBox.Show("Não foi possível enviar sua resposta, Verifique sua conexão com a internet", "Alerta!", MessageBoxButton.OK);
            }
        }

        private void PhoneApplicationPage_Loaded(object sender, RoutedEventArgs e)
        {
            try
            {
                this.Contatos = new ObservableCollection<ItemViewModel>();

                FusionessWS.MainServiceSoapClient servico = new FusionessWS.MainServiceSoapClient();

                servico.ListarContatosDoUsuarioAsync(Global.usuarioLogado);
                servico.ListarContatosDoUsuarioCompleted += servico_ListarContatosDoUsuarioCompleted;
            }
            catch (Exception)
            {
                MessageBox.Show("Não foi possível enviar sua resposta, Verifique sua conexão com a internet", "Alerta!", MessageBoxButton.OK);
            }
        }

        void servico_ListarContatosDoUsuarioCompleted(object sender, FusionessWS.ListarContatosDoUsuarioCompletedEventArgs e)
        {
            try
            {
                IList<FusionessWS.Contato> listContatos = e.Result;
                var idsContatos = listContatos.Select(c => c.IdContato).ToList();

                FusionessWS.ArrayOfInt listIds = new FusionessWS.ArrayOfInt();
                foreach (var item in idsContatos)
                {
                    listIds.Add(item);
                }
                FusionessWS.MainServiceSoapClient servico = new FusionessWS.MainServiceSoapClient();

                servico.ObterUsuariosIdsAsync(listIds);
                servico.ObterUsuariosIdsCompleted += servico_ObterUsuariosIdsCompleted;
            }
            catch (Exception)
            {
                MessageBox.Show("Não foi possível enviar sua resposta, Verifique sua conexão com a internet", "Alerta!", MessageBoxButton.OK);
            }
        }

        void servico_ObterUsuariosIdsCompleted(object sender, FusionessWS.ObterUsuariosIdsCompletedEventArgs e)
        {
            try
            {
                IList<FusionessWS.Usuario> listContatos = e.Result;
                foreach (var item in listContatos)
                {
                    this.Contatos.Add(new ItemViewModel()
                    {
                        ContatoImagem = Global.linkImagem + ((String.IsNullOrEmpty(item.UrlImagem)) ? Global.imgUsuarioDefault : item.UrlImagem),
                        ContatoId = item.IdUsuario,
                        ContatoNome = item.Nome
                    });
                }
                llsContatos.ItemsSource = this.Contatos;
            }
            catch (Exception)
            {
                MessageBox.Show("Não foi possível enviar sua resposta, Verifique sua conexão com a internet", "Alerta!", MessageBoxButton.OK);
            }
        }
    }
}
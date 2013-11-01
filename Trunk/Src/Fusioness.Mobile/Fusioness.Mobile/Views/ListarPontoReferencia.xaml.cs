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
    public partial class ListarPontoReferencia : PhoneApplicationPage
    {
        public ObservableCollection<ItemViewModel> Pontos { get; private set; }
        int RotaId = -1;
        ItemViewModel Item;

        protected override void OnNavigatedTo(NavigationEventArgs e)
        {
            base.OnNavigatedTo(e);

            string site;

            if (NavigationContext.QueryString.TryGetValue("RotaId", out site))
            {
                RotaId = Convert.ToInt32(site);
            }

        }

        private void PhoneApplicationPage_Loaded(object sender, RoutedEventArgs e)
        {
            this.Pontos = new ObservableCollection<ItemViewModel>();

            if (RotaId != -1)
            {
                FusionessWS.MainServiceSoapClient servico = new FusionessWS.MainServiceSoapClient();

                FusionessWS.Rota rota = new FusionessWS.Rota() { IdRota = 81 };
                servico.ListarPontosReferenciaPorRotaAsync(rota);
                servico.ListarPontosReferenciaPorRotaCompleted += servico_ListarPontosReferenciaPorRotaCompleted;
            }
            else
            {
                exibirPontos();
            }
        }
        public ListarPontoReferencia()
        {
            InitializeComponent();
        }

        void servico_ListarPontosReferenciaPorRotaCompleted(object sender, FusionessWS.ListarPontosReferenciaPorRotaCompletedEventArgs e)
        {
            IList<FusionessWS.Coordenada> listCoordenadas = e.Result;

            foreach (var item in listCoordenadas)
            {
                this.Pontos.Add(new ItemViewModel()
                {
                    PontoUrlImagem = "http://31.media.tumblr.com/tumblr_m3evdtpgE61r2y7tvo1_1280.jpg",//item.UrlImagem,   
                    CoordenadaId = item.IdCoordenada,
                    PontoNome = item.NomePonto
                });
            }

            llsPontosRef.ItemsSource = Pontos;
        }

        private void exibirPontos()
        {
            foreach (var item in Global.fusCoordenadas)
            {
                if (item.IdTipoCoordenada == 2)
                {
                    this.Pontos.Add(new ItemViewModel()
                    {
                        PontoUrlImagem = "http://31.media.tumblr.com/tumblr_m3evdtpgE61r2y7tvo1_1280.jpg",//item.UrlImagem,   
                        CoordenadaId = item.IdCoordenada,
                        PontoNome = item.NomePonto
                    });
                }
            }
            llsPontosRef.ItemsSource = Pontos;
        }

        private void btCancelar_Click(object sender, EventArgs e)
        {
            NavigationService.GoBack();
        }

        private void Excluir_Click(object sender, RoutedEventArgs e)
        {
            FusionessWS.MainServiceSoapClient servico = new FusionessWS.MainServiceSoapClient();

            MessageBoxResult result = MessageBox.Show("Deseja Excluir Este Ponto?", "Alerta!", MessageBoxButton.OKCancel);
            if (result == MessageBoxResult.OK)
            {
                Item = (sender as MenuItem).DataContext as ItemViewModel;

                FusionessWS.Coordenada coordenada = new FusionessWS.Coordenada() { IdCoordenada = Item.CoordenadaId };
                servico.RemoverCoordenadaAsync(coordenada);
                servico.RemoverCoordenadaCompleted += servico_RemoverCoordenadaCompleted;                
            }
        }

        void servico_RemoverCoordenadaCompleted(object sender, System.ComponentModel.AsyncCompletedEventArgs e)
        {
            MessageBox.Show("Ponto Excluído com Sucesso!");
            llsPontosRef.ItemsSource.Remove(Item);
        }
    }
}
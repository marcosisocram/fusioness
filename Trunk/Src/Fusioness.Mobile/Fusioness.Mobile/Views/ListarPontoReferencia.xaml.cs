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

namespace Fusioness.Mobile.Views
{
    public partial class ListarPontoReferencia : PhoneApplicationPage
    {
        public ObservableCollection<ItemViewModel> Pontos { get; private set; }

        public ListarPontoReferencia()
        {
            InitializeComponent();

            this.Pontos = new ObservableCollection<ItemViewModel>();

            FusionessWS.MainServiceSoapClient servico = new FusionessWS.MainServiceSoapClient();

            FusionessWS.Rota rota = new FusionessWS.Rota() { IdRota = 81};
            servico.ListarPontosReferenciaPorRotaAsync(rota);
            servico.ListarPontosReferenciaPorRotaCompleted += servico_ListarPontosReferenciaPorRotaCompleted;

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

        private void btCancelar_Click(object sender, EventArgs e)
        {
            NavigationService.GoBack();
        }
    }
}
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Navigation;
using Microsoft.Phone.Controls;
using Microsoft.Phone.Shell;
using System.Device.Location;
using Fusioness.Mobile.Util;
using System.Collections.ObjectModel;
using Fusioness.Mobile.ViewModels;
using System.Windows.Input;

namespace Fusioness.Mobile.Views
{
    public partial class BuscarEventos : PhoneApplicationPage
    {
        GeoCoordinateWatcher watcher;
        public ObservableCollection<ItemViewModel> Eventos { get; private set; }

        public BuscarEventos()
        {
            InitializeComponent();
        }

        private void btVoltar_Click(object sender, EventArgs e)
        {
            NavigationService.GoBack();
        }

        private void PhoneApplicationPage_Loaded(object sender, RoutedEventArgs e)
        {
            this.Eventos = new ObservableCollection<ItemViewModel>();

            watcher = new GeoCoordinateWatcher(GeoPositionAccuracy.High)
            {
                MovementThreshold = 20
            };
            watcher.PositionChanged += this.watcher_PositionChanged;
            watcher.StatusChanged += this.watcher_StatusChanged;
            watcher.Start();         
        }

        #region Geolocation

        private void watcher_PositionChanged(object sender, GeoPositionChangedEventArgs<GeoCoordinate> e)
        {
            try
            {
                FusionessWS.MainServiceSoapClient servico = new FusionessWS.MainServiceSoapClient();  
                GeoCoordinate geoCoordenada = e.Position.Location;

                double latitudeMin = geoCoordenada.Latitude - Global.coordenadaRange;
                double latitudeMax = geoCoordenada.Latitude + Global.coordenadaRange;
                double longitudeMin = geoCoordenada.Longitude - Global.coordenadaRange;
                double longitudeMax = geoCoordenada.Longitude + Global.coordenadaRange;

                watcher.Stop();
                servico.ListarEventosProximosAsync(latitudeMin, latitudeMax,longitudeMin,longitudeMax);
                servico.ListarEventosProximosCompleted += servico_ListarEventosProximosCompleted;
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message.ToString(), "Erro!", MessageBoxButton.OK);
            }
        }
                
        private void watcher_StatusChanged(object sender, GeoPositionStatusChangedEventArgs e)
        {
            try
            {
                switch (e.Status)
                {
                    case GeoPositionStatus.Disabled:
                        MessageBox.Show("Não conseguimos realizar a busca com seu GPS, tente novamente mais tarde.", "Alerta", MessageBoxButton.OK);
                        break;
                    case GeoPositionStatus.NoData:
                        MessageBox.Show("Não conseguimos realizar a busca com seu GPS, tente novamente mais tarde.", "Alerta", MessageBoxButton.OK);
                        break;
                }
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message.ToString(), "Erro!", MessageBoxButton.OK);
            }
        }

        #endregion

        void servico_ListarEventosProximosCompleted(object sender, FusionessWS.ListarEventosProximosCompletedEventArgs e)
        {
            IList<FusionessWS.Evento> listEvetos = e.Result;

            foreach (var item in listEvetos)
            {
                this.Eventos.Add(new ItemViewModel()
                {
                    EventoImagem = ((String.IsNullOrEmpty(item.UrlImagem)) ? Global.imgEventoDefault : Global.linkImagem + item.UrlImagem),
                    EventoTitulo = item.Titulo,
                    EventoData = item.Data.ToString("dd/MM/yyyy"),
                    EventoId = item.IdEvento,
                    EventoDescricao = item.Descricao
                });
            }

            llsEvento.ItemsSource = Eventos;
        }

        private void txtPesquisar_KeyDown(object sender, KeyEventArgs e)
        {
            if (e.Key == Key.Enter)
            {
                
            }
        }
    }
}
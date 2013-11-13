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
using System.Collections.ObjectModel;
using System.Device.Location;
using Microsoft.Phone.Maps.Controls;
using System.Windows.Media;

namespace Fusioness.Mobile.Views
{
    public partial class VisualizarRota : PhoneApplicationPage
    {
        GeoCoordinate lastGeoCoordenada;
        int RotaId = -1;

        protected override void OnNavigatedTo(NavigationEventArgs e)
        {
            base.OnNavigatedTo(e);

            string site;

            if (NavigationContext.QueryString.TryGetValue("RotaId", out site))
            {
                RotaId = Convert.ToInt32(site);
            }
        }

        public VisualizarRota()
        {
            InitializeComponent();
        }

        private void PhoneApplicationPage_Loaded(object sender, RoutedEventArgs e)
        {
            try
            {
                FusionessWS.MainServiceSoapClient servico = new FusionessWS.MainServiceSoapClient();
                FusionessWS.Rota rota = new FusionessWS.Rota();
                rota.IdRota = RotaId;
                servico.ListarCoordenadasPorRotaAsync(rota);
                servico.ListarCoordenadasPorRotaCompleted += servico_ListarCoordenadasPorRotaCompleted;
                Mapa.ZoomLevel = 14;
            }
            catch (Exception)
            {
                MessageBox.Show("Não foi possível enviar sua resposta, Verifique sua conexão com a internet", "Alerta!", MessageBoxButton.OK);
            }
        }

        void servico_ListarCoordenadasPorRotaCompleted(object sender, FusionessWS.ListarCoordenadasPorRotaCompletedEventArgs e)
        {
            try
            {
                ObservableCollection<FusionessWS.Coordenada> listCoordenadas = e.Result;
                if (listCoordenadas != null)
                {
                    for (int i = 0; i < listCoordenadas.Count; i++)
                    {
                        GeoCoordinate geoCoordinate = new GeoCoordinate();
                        geoCoordinate.Latitude = listCoordenadas[i].Latitude;
                        geoCoordinate.Longitude = listCoordenadas[i].Longitude;

                        if (i == 0)
                        {
                            Mapa.Layers.Add(adicionar_MapLayer(geoCoordinate, "/Assets/locationGreen.png"));
                            lastGeoCoordenada = geoCoordinate;
                        }
                        else
                        {
                            MapPolyline polyline = new MapPolyline();
                            polyline.Path.Add(lastGeoCoordenada);
                            polyline.Path.Add(geoCoordinate);
                            polyline.StrokeThickness = 7;
                            polyline.StrokeColor = Colors.Green;
                            Mapa.MapElements.Add(polyline);

                            lastGeoCoordenada = geoCoordinate;
                        }

                        if (i == listCoordenadas.Count - 1)
                        {
                            Mapa.Layers.Add(adicionar_MapLayer(geoCoordinate, "/Assets/locationPink.png"));
                            Mapa.Center = new GeoCoordinate(geoCoordinate.Latitude, geoCoordinate.Longitude);
                        }
                    }

                    int center = listCoordenadas.Count / 2;
                    Mapa.Center = new GeoCoordinate(listCoordenadas[center].Latitude, listCoordenadas[center].Longitude);
                }
                else
                {
                    MessageBox.Show("Error ao visualizar rota!");
                }
            }
            catch (Exception)
            {
                MessageBox.Show("Não foi possível enviar sua resposta, Verifique sua conexão com a internet", "Alerta!", MessageBoxButton.OK);
            }
        }

        private MapLayer adicionar_MapLayer(GeoCoordinate coordenadas, string uriImage)
        {
            MapLayer mapLayer = new MapLayer();
            MapOverlay mapOverlay = new MapOverlay();
            mapOverlay.GeoCoordinate = new GeoCoordinate(coordenadas.Latitude, coordenadas.Longitude);
            mapOverlay.PositionOrigin = new Point(0.5, 0.5);

            Image image = new Image();
            image.Source = new System.Windows.Media.Imaging.BitmapImage(new Uri(uriImage, UriKind.Relative));
            //image.Opacity = 0.8;
            image.Stretch = System.Windows.Media.Stretch.Fill;
            image.Width = 40;
            image.Height = 40;

            mapOverlay.Content = image;
            mapLayer.Add(mapOverlay);

            return mapLayer;
        } 
    }
}
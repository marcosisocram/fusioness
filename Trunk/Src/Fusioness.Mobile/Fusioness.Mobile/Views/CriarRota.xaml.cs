using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Navigation;
using Microsoft.Phone.Controls;
using Microsoft.Phone.Shell;
using Microsoft.Phone.Maps.Controls;
using System.Device.Location;
using System.Windows.Shapes;
using System.Windows.Media;
using Fusioness.Mobile.ViewModels;
using Microsoft.Phone.Tasks;

namespace Fusioness.Mobile.Views
{
    public partial class CriarRota : PhoneApplicationPage
    {
        GeoCoordinate coordenadas;
        GeoCoordinateWatcher watcher;
        bool trava = true;

        public CriarRota()
        {
            InitializeComponent();
            
            MeuLocal();                      
        }

        private void MapPage_Loaded(object sender, RoutedEventArgs e)
        {
            throw new NotImplementedException();
        }

        private void MeuLocal()
        {
            watcher = new GeoCoordinateWatcher(GeoPositionAccuracy.High)
            {
                MovementThreshold = 20
            };
            watcher.PositionChanged += this.watcher_PositionChanged;
            watcher.StatusChanged += this.watcher_StatusChanged;
            watcher.Start();
        }

        private void watcher_PositionChanged(object sender, GeoPositionChangedEventArgs<GeoCoordinate> e)
        {
            coordenadas = e.Position.Location;
            Mapa.Center = new GeoCoordinate(coordenadas.Latitude, coordenadas.Longitude);
            Mapa.ZoomLevel = 17;

            /*
            BingMapsDirectionsTask rota = new BingMapsDirectionsTask(); 
            rota.Start = new LabeledMapLocation("Natal", new GeoCoordinate(-5.8, -35.2)); 
            rota.End = new LabeledMapLocation("Parnamirim", new GeoCoordinate(-5.9159, -35.2)); 
            rota.Show();
            */
            Mapa.Layers.Add(new MapLayer()
            {
                /*
                new MapOverlay()
                {
                    GeoCoordinate = new GeoCoordinate(coordenadas.Latitude, coordenadas.Longitude),                    
                    PositionOrigin = new Point(0.5,0.5),
                    Content = new Ellipse
                    {
                        Fill = new SolidColorBrush(Colors.Magenta),
                        Width = 20,
                        Height = 20
                    }
                }
                */
                new MapOverlay()
                {
                    GeoCoordinate = new GeoCoordinate(coordenadas.Latitude, coordenadas.Longitude),                    
                    PositionOrigin = new Point(0.5,0.5),
                    Content = new Image
                    {
                        Source = new System.Windows.Media.Imaging.BitmapImage(new Uri("/Assets/locationGreen.png", UriKind.Relative)),
                        Opacity = 0.8,
                        Stretch = System.Windows.Media.Stretch.Fill,
                        Width = 40,
                        Height = 40
                    }
                }
            });
            
        }

        private void watcher_StatusChanged(object sender, GeoPositionStatusChangedEventArgs e)
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
    }
}
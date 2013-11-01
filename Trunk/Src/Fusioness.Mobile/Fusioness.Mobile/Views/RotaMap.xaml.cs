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
using System.Windows.Media.Imaging;
using Microsoft.Phone.Maps.Services;
using System.Text;
using Fusioness.Mobile.Util;
using System.Collections.ObjectModel;

namespace Fusioness.Mobile.Views
{
    public partial class RotaMap : PhoneApplicationPage
    {
        GeoCoordinate lastGeoCoordenada;
        GeoCoordinateWatcher watcher;
        int RotaId = -1;
        bool addLocalizacao = false;
        Global.Acao acao = new Global.Acao();
        bool pontoReferencia = false;

        protected override void OnNavigatedTo(NavigationEventArgs e)
        {
            if (Global.fusCoordenadas.Count == 0)
            {
                base.OnNavigatedTo(e);

                string site;

                if (NavigationContext.QueryString.TryGetValue("RotaId", out site))
                {
                    RotaId = Convert.ToInt32(site);
                    acao = Global.Acao.Visualizar;
                }
                else
                {
                    acao = Global.Acao.Criar;
                }
            }
        }

        public RotaMap()
        {
            InitializeComponent();

            Global.fusCoordenadas = new List<FusionessWS.Coordenada>();
        }

        private void PhoneApplicationPage_Loaded(object sender, RoutedEventArgs e)
        {
            ApplicationBarMenuItem menuListarPontos = (ApplicationBarMenuItem)ApplicationBar.MenuItems[1];

            watcher = new GeoCoordinateWatcher(GeoPositionAccuracy.High)
            {
                MovementThreshold = 20
            };
            watcher.PositionChanged += this.watcher_PositionChanged;
            watcher.StatusChanged += this.watcher_StatusChanged;

            if (Global.fusCoordenadas.Count == 0)
            {
                if (acao == Global.Acao.Visualizar)
                {
                    Visualizar();
                    Mapa.ZoomLevel = 14;
                    menuListarPontos.IsEnabled = true;
                }
                else
                {
                    adicionarLocalizacao();
                    Mapa.ZoomLevel = 17;
                }
            }
            else if (pontoReferencia)
            {
                watcher.Start();
                pontoReferencia = false;
                menuListarPontos.IsEnabled = true;
            }
        }

        private void adicionarLocalizacao()
        {            
            watcher.Start();
            addLocalizacao = true;
        }
        private void MapPage_Loaded(object sender, RoutedEventArgs e)
        {
            throw new NotImplementedException();
        }        

        private void Visualizar()
        {
            //watcher.Start();
            FusionessWS.MainServiceSoapClient servico = new FusionessWS.MainServiceSoapClient();
            FusionessWS.Rota rota = new FusionessWS.Rota();
            rota.IdRota = RotaId;
            servico.ListarCoordenadasPorRotaAsync(rota);
            servico.ListarCoordenadasPorRotaCompleted += servico_ListarCoordenadasPorRotaCompleted;
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
                }
                else
                {
                    MessageBox.Show("Error ao visualizar rota!");
                }
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message.ToString(), "Erro", MessageBoxButton.OK);
            }
        }

        private void watcher_PositionChanged(object sender, GeoPositionChangedEventArgs<GeoCoordinate> e)
        {
            try
            {                
                GeoCoordinate geoCoordenada = e.Position.Location;
                FusionessWS.Coordenada coordenada = new FusionessWS.Coordenada();
                Mapa.Center = new GeoCoordinate(geoCoordenada.Latitude, geoCoordenada.Longitude);

                if (acao == Global.Acao.Criar)
                {
                    if (addLocalizacao)
                    {
                        Mapa.Layers.Add(adicionar_MapLayer(geoCoordenada, "/Assets/locationGreen.png"));                        
                        addLocalizacao = false;
                        watcher.Stop();
                    }
                    else
                    {
                        MapPolyline polyline = new MapPolyline();
                        polyline.Path.Add(lastGeoCoordenada);
                        polyline.Path.Add(geoCoordenada);
                        polyline.StrokeThickness = 7;
                        polyline.StrokeColor = Colors.Green;
                        Mapa.MapElements.Add(polyline);

                        if (Mapa.Layers.Count > 1)
                        {
                            Mapa.Layers.RemoveAt(Mapa.Layers.Count - 1);
                        }

                        Mapa.Layers.Add(adicionar_MapLayer(geoCoordenada, "/Assets/locationGray.png"));
                    }
                    lastGeoCoordenada = geoCoordenada;
                }
                else
                {
                    if (Mapa.Layers.Count == 2)
                    {
                        Mapa.Layers.Add(adicionar_MapLayer(geoCoordenada, "/Assets/locationGray.png"));
                    }
                    else
                    {
                        Mapa.Layers.RemoveAt(2);
                        Mapa.Layers.Add(adicionar_MapLayer(geoCoordenada, "/Assets/locationGray.png"));
                    }                    
                    Mapa.Center = new GeoCoordinate(geoCoordenada.Latitude, geoCoordenada.Longitude);
                }

                //Dados para Salvar                    
                coordenada.Data = DateTime.Now;
                coordenada.IdTipoCoordenada = 1;
                coordenada.Latitude = geoCoordenada.Latitude;
                coordenada.Longitude = geoCoordenada.Longitude;

                Global.fusCoordenadas.Add(coordenada);
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message.ToString(), "Erro!", MessageBoxButton.OK);
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

        private void btStartStop_Click(object sender, EventArgs e)
        {
            ApplicationBarIconButton btStartStop = (ApplicationBarIconButton)ApplicationBar.Buttons[0];
            ApplicationBarIconButton btSalvar = (ApplicationBarIconButton)ApplicationBar.Buttons[1];
            ApplicationBarIconButton btLimpar = (ApplicationBarIconButton)ApplicationBar.Buttons[2];
            ApplicationBarMenuItem menuPontos = (ApplicationBarMenuItem)ApplicationBar.MenuItems[0];

            if (btStartStop.IconUri.OriginalString == "/Assets/Buttons/play.png")
            {
                btStartStop.IconUri = new Uri("/Assets/Buttons/pause.png", UriKind.Relative);
                btStartStop.Text = "Parar";
                btSalvar.IsEnabled = false;
                btLimpar.IsEnabled = false;
                menuPontos.IsEnabled = true;
                watcher.Start();
            }
            else
            {
                btStartStop.IconUri = new Uri("/Assets/Buttons/play.png", UriKind.Relative);
                btStartStop.Text = "Iniciar";
                btSalvar.IsEnabled = true;
                btLimpar.IsEnabled = true;
                watcher.Stop();
            }
        }

        private void btLimpar_Click(object sender, EventArgs e)
        {
            ApplicationBarIconButton btSalvar = (ApplicationBarIconButton)ApplicationBar.Buttons[1];
            ApplicationBarIconButton btLimpar = (ApplicationBarIconButton)ApplicationBar.Buttons[2];
            btSalvar.IsEnabled = false;
            btLimpar.IsEnabled = false;
            Global.fusCoordenadas.Clear();
            if (acao == Global.Acao.Criar)
            {
                Mapa.MapElements.Clear();
                Mapa.Layers.Clear();
                adicionarLocalizacao();
            }
            else
            {
                Mapa.Layers.RemoveAt(2);
            }
                       
        }

        private void btSalvar_Click(object sender, EventArgs e)
        {            
            NavigationService.Navigate(new Uri("/Views/SalvarRota.xaml?RotaId=" + RotaId.ToString(), UriKind.Relative));
        }

        private void menuPontos_Click(object sender, EventArgs e)
        {
            pontoReferencia = true;
            watcher.Stop();
            NavigationService.Navigate(new Uri("/Views/SalvarPontoReferencia.xaml", UriKind.Relative));
        }

        private void menuListarPontos_Click(object sender, EventArgs e)
        {
            NavigationService.Navigate(new Uri("/Views/ListarPontoReferencia.xaml", UriKind.Relative));
        }   
    }

}
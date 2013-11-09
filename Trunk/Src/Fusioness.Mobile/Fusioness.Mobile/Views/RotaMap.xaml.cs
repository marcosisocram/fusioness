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
        #region Propriedades

        GeoCoordinate lastGeoCoordenada;
        GeoCoordinateWatcher watcher;
        Global.Acao acao = new Global.Acao();
        MapLayer lastMapLayer = null;
        int RotaId = -1;
        int EventoId = -1;
        bool addLocalizacao = false;
        bool pontoReferencia = false;
        bool iniciarEvento = true;
        DateTime? dataInicial = null;
        List<MapLayer> mapLayerPontosRef = new List<MapLayer>(); 
        
        #endregion

        #region Inicialize
        
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
                if (NavigationContext.QueryString.TryGetValue("EventoId", out site))
                {
                    EventoId = Convert.ToInt32(site);
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
            ApplicationBarIconButton btStartStop = (ApplicationBarIconButton)ApplicationBar.Buttons[0];
            ApplicationBarMenuItem menuListarPontos = (ApplicationBarMenuItem)ApplicationBar.MenuItems[1];
            ApplicationBarMenuItem menuExibirPontos = (ApplicationBarMenuItem)ApplicationBar.MenuItems[2];

            watcher = new GeoCoordinateWatcher(GeoPositionAccuracy.High)
            {
                MovementThreshold = 20
            };
            watcher.PositionChanged += this.watcher_PositionChanged;
            watcher.StatusChanged += this.watcher_StatusChanged;

            if (Global.fusCoordenadas.Count == 0 && !pontoReferencia)
            {
                if (acao == Global.Acao.Visualizar)
                {
                    Visualizar();
                    Mapa.ZoomLevel = 14;
                    menuListarPontos.IsEnabled = true;
                    menuExibirPontos.IsEnabled = true;
                }
                else
                {
                    adicionarLocalizacao();
                    Mapa.ZoomLevel = 17;
                }
            }
            else if (pontoReferencia && btStartStop.IconUri.OriginalString == "/Assets/Buttons/pause.png")
            {
                watcher.Start();
                pontoReferencia = false;
                menuListarPontos.IsEnabled = true;
                menuExibirPontos.IsEnabled = true;
            }


        }

        private void MapPage_Loaded(object sender, RoutedEventArgs e)
        {
            throw new NotImplementedException();
        } 

        #endregion

        #region Metodos Comuns

        private void adicionarLocalizacao()
        {
            watcher.Start();
            addLocalizacao = true;
        }

        private void Visualizar()
        {
            FusionessWS.MainServiceSoapClient servico = new FusionessWS.MainServiceSoapClient();
            FusionessWS.Rota rota = new FusionessWS.Rota();
            rota.IdRota = RotaId;
            servico.ListarCoordenadasPorRotaAsync(rota);
            servico.ListarCoordenadasPorRotaCompleted += servico_ListarCoordenadasPorRotaCompleted;
        }

        private void exibirPontos()
        {
            foreach (var item in Global.fusCoordenadas)
            {
                if (item.IdTipoCoordenada == 2)
                {
                    var mapLayer = adicionar_MapLayer(new GeoCoordinate(item.Latitude, item.Longitude), "/Assets/pontoref.png");
                    Mapa.Layers.Add(mapLayer);
                    mapLayerPontosRef.Add(mapLayer);
                }
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
        
        #endregion

        #region Geolocation

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
                            Mapa.Layers.Remove(lastMapLayer);
                        }

                        var mapLayer = adicionar_MapLayer(geoCoordenada, "/Assets/locationGray.png");
                        Mapa.Layers.Add(mapLayer);
                        lastMapLayer = mapLayer;
                    }
                    lastGeoCoordenada = geoCoordenada;
                }
                else
                {
                    if (lastMapLayer == null)
                    {
                        var mapLayer = adicionar_MapLayer(geoCoordenada, "/Assets/locationGray.png");
                        Mapa.Layers.Add(mapLayer);
                        lastMapLayer = mapLayer;
                    }
                    else
                    {
                        Mapa.Layers.Remove(lastMapLayer);
                        var mapLayer = adicionar_MapLayer(geoCoordenada, "/Assets/locationGray.png");
                        Mapa.Layers.Add(mapLayer);
                        lastMapLayer = mapLayer;
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

        #region Evento da Tela

        private void btStartStop_Click(object sender, EventArgs e)
        {
            try
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
                    if (acao == Global.Acao.Criar)
                    {
                        menuPontos.IsEnabled = true;
                    }
                    watcher.Start();

                    if (EventoId != -1 && iniciarEvento)
                    {
                        iniciarEvento = false;
                        FusionessWS.MainServiceSoapClient servico = new FusionessWS.MainServiceSoapClient();
                        dataInicial = DateTime.Now;
                        FusionessWS.EventoUsuario eventoUsuario = new FusionessWS.EventoUsuario()
                        {
                            IdEvento = EventoId,
                            IdUsuario = Global.usuarioLogado.IdUsuario,
                            DataInicial = dataInicial
                        };

                        servico.AlterarEventoUsuarioAsync(eventoUsuario);
                        servico.AlterarEventoUsuarioCompleted += servico_AlterarEventoUsuarioCompleted;
                    }
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
            catch (Exception)
            {
                MessageBox.Show("Não foi possível realizar esta ação verifique sua conexão com a internet");
            }
        }

        void servico_AlterarEventoUsuarioCompleted(object sender, FusionessWS.AlterarEventoUsuarioCompletedEventArgs e)
        {
            try
            {
                if (e.Result == null)
                {
                    //
                }
            }
            catch (Exception)
            {
                MessageBox.Show("Não foi possível realizar esta ação verifique sua conexão com a internet");
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

            if (EventoId != -1)
            {
                iniciarEvento = true;
                dataInicial = null;
            }
        }

        private void btSalvar_Click(object sender, EventArgs e)
        {
            try
            {
                FusionessWS.MainServiceSoapClient servico = new FusionessWS.MainServiceSoapClient();

                if (EventoId != -1)
                {
                    FusionessWS.EventoUsuario eventoUsuario = new FusionessWS.EventoUsuario()
                    {
                        IdEvento = EventoId,
                        IdUsuario = Global.usuarioLogado.IdUsuario,
                        DataInicial = dataInicial,
                        DataFinal = DateTime.Now
                    };

                    servico.AlterarEventoUsuarioAsync(eventoUsuario);
                    servico.AlterarEventoUsuarioCompleted += servico_AlterarEventoUsuarioCompleted;
                }
                if (acao == Global.Acao.Visualizar)
                {
                    FusionessWS.Rota rota = new FusionessWS.Rota();
                    rota.IdRota = RotaId;
                    servico.ObterRotaPorIdAsync(rota);
                    servico.ObterRotaPorIdCompleted += servico_ObterRotaPorIdCompleted;
                }
                else
                {
                    NavigationService.Navigate(new Uri("/Views/SalvarRota.xaml?RotaId=" + RotaId.ToString(), UriKind.Relative));
                }
            }
            catch (Exception)
            {
                MessageBox.Show("Não foi possível realizar esta ação verifique sua conexão com a internet");
            }
        }

        private void menuPontos_Click(object sender, EventArgs e)
        {
            pontoReferencia = true;
            watcher.Stop();
            NavigationService.Navigate(new Uri("/Views/SalvarPontoReferencia.xaml", UriKind.Relative));
        }

        private void menuListarPontos_Click(object sender, EventArgs e)
        {
            pontoReferencia = true;
            watcher.Stop();
            NavigationService.Navigate(new Uri("/Views/ListarPontoReferencia.xaml?RotaId=" + RotaId.ToString(), UriKind.Relative));
        }

        private void menuExibirPontos_Click(object sender, EventArgs e)
        {
            ApplicationBarMenuItem menuExibirPontos = (ApplicationBarMenuItem)ApplicationBar.MenuItems[2];

            if (menuExibirPontos.Text == "Exibir pontos de referência")
            {
                menuExibirPontos.Text = "Ocultar pontos de referência";

                if (RotaId != -1)
                {
                    FusionessWS.MainServiceSoapClient servico = new FusionessWS.MainServiceSoapClient();

                    FusionessWS.Rota rota = new FusionessWS.Rota() { IdRota = RotaId };
                    servico.ListarPontosReferenciaPorRotaAsync(rota);
                    servico.ListarPontosReferenciaPorRotaCompleted += servico_ListarPontosReferenciaPorRotaCompleted;
                }
                else
                {
                    exibirPontos();
                }
            }
            else
            {
                menuExibirPontos.Text = "Exibir pontos de referência";

                foreach (var item in mapLayerPontosRef)
                {
                    Mapa.Layers.Remove(item);
                }
                mapLayerPontosRef.Clear();
            }
        } 

        #endregion

        #region Serviços
        
        void servico_ListarPontosReferenciaPorRotaCompleted(object sender, FusionessWS.ListarPontosReferenciaPorRotaCompletedEventArgs e)
        {
            IList<FusionessWS.Coordenada> listCoordenadas = e.Result;

            foreach (var item in listCoordenadas)
            {
                var mapLayer = adicionar_MapLayer(new GeoCoordinate(item.Latitude, item.Longitude), "/Assets/pontoref.png");
                Mapa.Layers.Add(mapLayer);
                mapLayerPontosRef.Add(mapLayer);
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

        void servico_ObterRotaPorIdCompleted(object sender, FusionessWS.ObterRotaPorIdCompletedEventArgs e)
        {
            FusionessWS.Rota rota = e.Result;
            if (rota != null)
            {
                if (rota.IdRotaOrigem != null)
                {
                    NavigationService.Navigate(new Uri("/Views/SalvarRota.xaml?RotaId=" + rota.IdRotaOrigem.ToString(), UriKind.Relative));
                }
                else
                {
                    NavigationService.Navigate(new Uri("/Views/SalvarRota.xaml?RotaId=" + rota.IdRota.ToString(), UriKind.Relative));
                }
            }
        }
        
        #endregion
  
    }

}
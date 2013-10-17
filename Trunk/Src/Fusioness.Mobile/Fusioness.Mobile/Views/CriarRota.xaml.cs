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
    public partial class CriarRota : PhoneApplicationPage
    {
        GeoCoordinate lastGeoCoordenada;
        GeoCoordinateWatcher watcher;
        int RotaId = -1;
        bool addLocalizacao = false;
        Acao acao = new Acao();

        enum Acao
        {
            Criar = 0,
            Visualizar = 1
        }

        protected override void OnNavigatedTo(NavigationEventArgs e)
        {
            base.OnNavigatedTo(e);

            string site;

            if (NavigationContext.QueryString.TryGetValue("RotaId", out site))
            {
                RotaId = Convert.ToInt32(site);
                acao = Acao.Visualizar;
            }
            else
            {
                acao = Acao.Criar;
            }
        }

        public CriarRota()
        {
            InitializeComponent();

            watcher = new GeoCoordinateWatcher(GeoPositionAccuracy.High)
            {
                MovementThreshold = 20
            };
            watcher.PositionChanged += this.watcher_PositionChanged;
            watcher.StatusChanged += this.watcher_StatusChanged;              
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
                MessageBox.Show("Error ao visualizar RotaId!");
            }                       
        }

        private void watcher_PositionChanged(object sender, GeoPositionChangedEventArgs<GeoCoordinate> e)
        {
            try
            {                
                GeoCoordinate geoCoordenada = e.Position.Location;
                Mapa.Center = new GeoCoordinate(geoCoordenada.Latitude, geoCoordenada.Longitude);

                if (acao == Acao.Criar)
                {
                    if (addLocalizacao)
                    {
                        Mapa.Layers.Add(adicionar_MapLayer(geoCoordenada, "/Assets/locationGreen.png"));
                        Global.fusCoordenadas = new List<FusionessWS.Coordenada>();
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

                        //Dados para Salvar
                        FusionessWS.Coordenada coordenada = new FusionessWS.Coordenada();
                        coordenada.Data = DateTime.Now;
                        coordenada.Latitude = geoCoordenada.Latitude;
                        coordenada.Longitude = geoCoordenada.Longitude;

                        Global.fusCoordenadas.Add(coordenada);
                    }
                    lastGeoCoordenada = geoCoordenada;
                }
                else
                {
                    if (Mapa.Layers.Count == 2)
                    {
                        Global.fusCoordenadas = new List<FusionessWS.Coordenada>();
                        Mapa.Layers.Add(adicionar_MapLayer(geoCoordenada, "/Assets/locationGray.png"));
                    }
                    else
                    {
                        Mapa.Layers.RemoveAt(2);
                        Mapa.Layers.Add(adicionar_MapLayer(geoCoordenada, "/Assets/locationGray.png"));
                    }
                    //Dados para Salvar
                    FusionessWS.Coordenada coordenada = new FusionessWS.Coordenada();
                    coordenada.Data = DateTime.Now;
                    coordenada.Latitude = geoCoordenada.Latitude;
                    coordenada.Longitude = geoCoordenada.Longitude;                    

                    Global.fusCoordenadas.Add(coordenada);

                    Mapa.ZoomLevel = 17;
                    Mapa.Center = new GeoCoordinate(geoCoordenada.Latitude, geoCoordenada.Longitude);
                }                
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
            
            if (btStartStop.IconUri.OriginalString == "/Assets/Buttons/play.png")
            {
                btStartStop.IconUri = new Uri("/Assets/Buttons/pause.png", UriKind.Relative);
                btStartStop.Text = "Parar";
                btSalvar.IsEnabled = false;
                btLimpar.IsEnabled = false;
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
            Mapa.MapElements.Clear();
            Mapa.Layers.Clear();
            adicionarLocalizacao();           
        }

        private void btSalvar_Click(object sender, EventArgs e)
        {
            FusionessWS.Rota rota = new FusionessWS.Rota();
            rota.Descricao = "Nova Rota WP";
            rota.IdUsuario = Global.usuarioLogado.IdUsuario;

            if (acao == Acao.Criar)
                rota.IdTipoRota = 1;
            else
                rota.IdTipoRota = 2;

            rota.Coordenadas = new ObservableCollection<FusionessWS.Coordenada>();            

            foreach (var item in Global.fusCoordenadas)
            {
                rota.Coordenadas.Add(item);
            }

            FusionessWS.MainServiceSoapClient servico = new FusionessWS.MainServiceSoapClient();
            servico.InserirRotaAsync(rota);
            servico.InserirRotaCompleted += servico_InserirRotaCompleted;
        }

        void servico_InserirRotaCompleted(object sender, FusionessWS.InserirRotaCompletedEventArgs e)
        {
            try
            {
                MessageBox.Show("Rota Salva com sucesso.");
            }
            catch (Exception)
            {
                MessageBox.Show("Rota Salva com sucesso. Erro");
            }
            //FusionessWS.Rota rota = e.Result;
            //if (rota != null)
            //{
//                MessageBox.Show("Rota Salva com sucesso.");
            //}
            //else
            //{
            //    MessageBox.Show("Erro ao salvar rota");
            //} 
        }

        private void PhoneApplicationPage_Loaded(object sender, RoutedEventArgs e)
        {
            if (acao == Acao.Visualizar)
            {
                Visualizar();
                Mapa.ZoomLevel = 14;
            }
            else
            {
                adicionarLocalizacao();
                Mapa.ZoomLevel = 17;
            }
        }      
    }

}
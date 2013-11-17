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
using Fusioness.Mobile.ViewModels;
using Microsoft.Phone.Net.NetworkInformation;

namespace Fusioness.Mobile.Views
{
    public partial class SalvarRota : PhoneApplicationPage
    {
        int RotaId = -1;
        Global.Acao acao = new Global.Acao();        
        public ObservableCollection<ItemViewModel> TipoPista { get; private set; }
        public ObservableCollection<ItemViewModel> Dificuldade { get; private set; }
        public ObservableCollection<ItemViewModel> Qualidade { get; private set; }
        private FusionessWS.Rota rotaPai;

        protected override void OnNavigatedTo(NavigationEventArgs e)
        {
            base.OnNavigatedTo(e);

            string site;

            if (NavigationContext.QueryString.TryGetValue("RotaId", out site))
            {
                RotaId = Convert.ToInt32(site);
                if (RotaId != -1)
                    acao = Global.Acao.Visualizar;
                else
                    acao = Global.Acao.Criar;
            }
            else
            {
                acao = Global.Acao.Criar;
            }
        }
        public SalvarRota()
        {
            InitializeComponent();
            this.TipoPista = new ObservableCollection<ItemViewModel>();
            this.Dificuldade = new ObservableCollection<ItemViewModel>();
            this.Qualidade = new ObservableCollection<ItemViewModel>();            
            try
            {
                FusionessWS.MainServiceSoapClient servico = new FusionessWS.MainServiceSoapClient();
                servico.ListarTiposPistaAsync();
                servico.ListarTiposPistaCompleted += servico_ListarTiposPistaCompleted;
                servico.ListarDificuldadesAsync();
                servico.ListarDificuldadesCompleted += servico_ListarDificuldadesCompleted;
                servico.ListarQualidadesRotaAsync();
                servico.ListarQualidadesRotaCompleted += servico_ListarQualidadesRotaCompleted;
            }
            catch (Exception)
            {
                MessageBox.Show("Não foi possível executar esta ação, Verifique sua conexão com a internet", "Alerta!", MessageBoxButton.OK);
            }
        }

        void servico_ConsultarDuracaoRotaCompleted(object sender, FusionessWS.ConsultarDuracaoRotaCompletedEventArgs e)
        {
            double duracaoMedia = e.Result;
            this.lblDuracaoMedia.Text = "Duração Média: " + duracaoMedia.ToString("#0.00h");
        }

        private void PhoneApplicationPage_Loaded(object sender, RoutedEventArgs e)
        {
            try
            {
                if (acao == Global.Acao.Visualizar)
                {
                    FusionessWS.MainServiceSoapClient servico = new FusionessWS.MainServiceSoapClient();
                    this.txtDescricao.IsEnabled = false;
                    rotaPai = new FusionessWS.Rota();
                    rotaPai.IdRota = RotaId;
                    servico.ObterRotaPorIdAsync(rotaPai);
                    servico.ObterRotaPorIdCompleted += servico_ObterRotaPorIdCompleted;
                    servico.ConsultarDuracaoRotaAsync(RotaId);
                    servico.ConsultarDuracaoRotaCompleted += servico_ConsultarDuracaoRotaCompleted;
                }
            }
            catch (Exception)
            {
                MessageBox.Show("Não foi possível executar esta ação, Verifique sua conexão com a internet", "Alerta!", MessageBoxButton.OK);
            }
        }

        void servico_ObterRotaPorIdCompleted(object sender, FusionessWS.ObterRotaPorIdCompletedEventArgs e)
        {
            try
            {
                FusionessWS.Rota rota = e.Result;
                this.txtDescricao.Text = rota.Descricao;
            }
            catch (Exception)
            {
                MessageBox.Show("Não foi possível executar esta ação, Verifique sua conexão com a internet", "Alerta!", MessageBoxButton.OK);
            }

        }       

        void servico_ListarTiposPistaCompleted(object sender, FusionessWS.ListarTiposPistaCompletedEventArgs e)
        {
            try
            {
                IList<FusionessWS.TipoPista> tipoPistas = e.Result;
                foreach (var item in tipoPistas)
                {
                    this.TipoPista.Add(new ItemViewModel()
                    {
                        TipoPistaId = item.IdTipoPista,
                        TipoPistaDescricao = item.Descricao
                    });
                }

                this.lpkTipoPista.ItemsSource = this.TipoPista;
            }
            catch (Exception)
            {
                MessageBox.Show("Não foi possível executar esta ação, Verifique sua conexão com a internet", "Alerta!", MessageBoxButton.OK);
            }
        }        

        void servico_ListarDificuldadesCompleted(object sender, FusionessWS.ListarDificuldadesCompletedEventArgs e)
        {
            try
            {
                IList<FusionessWS.Dificuldade> dificuldades = e.Result;
                foreach (var item in dificuldades)
                {
                    this.Dificuldade.Add(new ItemViewModel()
                    {
                        DificuldadeId = item.IdDificuldade,
                        DificuldadeDescricao = item.Descricao
                    });
                }

                this.lpkDificuldade.ItemsSource = Dificuldade;
            }
            catch (Exception)
            {
                MessageBox.Show("Não foi possível executar esta ação, Verifique sua conexão com a internet", "Alerta!", MessageBoxButton.OK);
            }
        }

        void servico_ListarQualidadesRotaCompleted(object sender, FusionessWS.ListarQualidadesRotaCompletedEventArgs e)
        {
            try
            {
                IList<FusionessWS.QualidadeRota> qualidades = e.Result;
                foreach (var item in qualidades)
                {
                    this.Qualidade.Add(new ItemViewModel()
                    {
                        QualidadeId = item.IdQualidadeRota,
                        QualidadeDescricao = item.Descricao
                    });
                }
                this.lpkQualidade.ItemsSource = Qualidade;
            }
            catch (Exception)
            {
                MessageBox.Show("Não foi possível executar esta ação, Verifique sua conexão com a internet", "Alerta!", MessageBoxButton.OK);
            }
        }

       private void btSalvar_Click(object sender, EventArgs e)
       {
           try
           {
               if (!NetworkInterface.GetIsNetworkAvailable())
                   MessageBox.Show("Ative sua rede Wi-Fi ou conecte com a Rede Móvel para executar esta ação!");
               else
               {
                   if (String.IsNullOrEmpty(this.txtDescricao.Text))
                   {
                       MessageBox.Show("Informe o Nome da Rota!");
                       this.txtDescricao.Focus();
                   }
                   else
                   {
                       var tipoPista = (this.lpkTipoPista as ListPicker).SelectedItem as ItemViewModel;
                       var dificuldade = (this.lpkDificuldade as ListPicker).SelectedItem as ItemViewModel;
                       var qualidade = (this.lpkQualidade as ListPicker).SelectedItem as ItemViewModel;

                       FusionessWS.Rota rota = new FusionessWS.Rota();
                       rota.Descricao = this.txtDescricao.Text;
                       rota.IdUsuario = Global.usuarioLogado.IdUsuario;
                       rota.IdTipoPista = tipoPista.TipoPistaId;
                       rota.IdDificuldade = dificuldade.DificuldadeId;
                       rota.IdQualidadeRota = qualidade.QualidadeId;

                       if (acao == Global.Acao.Criar)
                           rota.IdTipoRota = 1;
                       else
                       {
                           rota.IdTipoRota = 2;
                           rota.IdRotaOrigem = RotaId;
                       }

                       FusionessWS.MainServiceSoapClient servico = new FusionessWS.MainServiceSoapClient();
                       servico.InserirRotaAsync(rota);
                       servico.InserirRotaCompleted += servico_InserirRotaCompleted;
                   }
               }
           }
           catch (Exception)
           {
               MessageBox.Show("Não foi possível executar esta ação, Verifique sua conexão com a internet", "Alerta!", MessageBoxButton.OK);
           }
       }

       void servico_InserirRotaCompleted(object sender, FusionessWS.InserirRotaCompletedEventArgs e)
       {
           try
           {
               FusionessWS.Rota rota = e.Result;
               if (rota != null)
               {
                   ObservableCollection<FusionessWS.Coordenada> coordenadas = new ObservableCollection<FusionessWS.Coordenada>();

                   foreach (var item in Global.fusCoordenadas)
                   {
                       item.IdRota = rota.IdRota;
                       coordenadas.Add(item);
                   }
                   FusionessWS.MainServiceSoapClient servico = new FusionessWS.MainServiceSoapClient();
                   servico.InserirListaCoordenadasAsync(coordenadas);
                   servico.InserirListaCoordenadasCompleted += servico_InserirListaCoordenadasCompleted;
               }
               else
               {
                   MessageBox.Show("Erro ao Salvar Rota.");
               }
           }
           catch (Exception)
           {
               MessageBox.Show("Não foi possível executar esta ação, Verifique sua conexão com a internet", "Alerta!", MessageBoxButton.OK);
           }
       }

       void servico_InserirListaCoordenadasCompleted(object sender, FusionessWS.InserirListaCoordenadasCompletedEventArgs e)
       {
           try
           {
               IList<FusionessWS.Coordenada> coordenadas = e.Result;

               if (coordenadas != null)
               {
                   MessageBox.Show("Rota Salva com sucesso.");                   
                   NavigationService.Navigate(new Uri("/MainPage.xaml", UriKind.Relative));                   
               }
               else
               {
                   MessageBox.Show("Erro ao Salvar Rota. Não Retornou nada.");
               }
           }
           catch (Exception)
           {
               MessageBox.Show("Não foi possível executar esta ação, Verifique sua conexão com a internet", "Alerta!", MessageBoxButton.OK);
           }
       }

       private void btCancelar_Click(object sender, EventArgs e)
       {
           NavigationService.GoBack();
       }  
    }
}
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
    public partial class TempoAtualDoEvento : PhoneApplicationPage
    {
        int EventoId = -1;
        public ObservableCollection<ItemViewModel> Contatos { get; private set; }
        /*
         * 
         * Melhor tempo / Media do tempo
         * quantidade de usuarios
        */

        public TempoAtualDoEvento()
        {
            InitializeComponent();
        }

        protected override void OnNavigatedTo(NavigationEventArgs e)
        {
            base.OnNavigatedTo(e);

            string site;

            if (NavigationContext.QueryString.TryGetValue("EventoId", out site))
            {
                EventoId = Convert.ToInt32(site);
            }
        }

        private void btVoltar_Click(object sender, EventArgs e)
        {
            NavigationService.GoBack();
        }

        private void PhoneApplicationPage_Loaded(object sender, RoutedEventArgs e)
        {
            Carregar();
        }

        private void Carregar()
        {
            try
            {
                this.Contatos = new ObservableCollection<ItemViewModel>();
                FusionessWS.MainServiceSoapClient servico = new FusionessWS.MainServiceSoapClient();

                servico.ListarUsuariosEventoAsync(new FusionessWS.Evento() { IdEvento = EventoId });
                servico.ListarUsuariosEventoCompleted += servico_ListarUsuariosEventoCompleted;
                servico.ObterEventoPorIdAsync(new FusionessWS.Evento() { IdEvento = EventoId });
                servico.ObterEventoPorIdCompleted += servico_ObterEventoPorIdCompleted;
            }
            catch (Exception)
            {
                MessageBox.Show("Não foi possível executar esta ação, Verifique sua conexão com a internet", "Alerta!", MessageBoxButton.OK);
            }
        }

        void servico_ObterEventoPorIdCompleted(object sender, FusionessWS.ObterEventoPorIdCompletedEventArgs e)
        {
            try
            {
                FusionessWS.Evento evento = e.Result;
                if (evento != null)
                {
                    this.lblDistancia.Text = "Distância: " + evento.Distancia.ToString("#0.00 Km").Replace(".", ",");
                }
            }
            catch (Exception)
            {
                MessageBox.Show("Não foi possível executar esta ação, Verifique sua conexão com a internet", "Alerta!", MessageBoxButton.OK);
            }
        }

        void servico_ListarUsuariosEventoCompleted(object sender, FusionessWS.ListarUsuariosEventoCompletedEventArgs e)
        {
            try
            {
                IList<FusionessWS.EventoUsuario> listEventoUsuario = e.Result;

                if (listEventoUsuario != null)
                {
                    DateTime dataAtual = DateTime.Now;
                    foreach (var item in listEventoUsuario)
                    {
                        DateTime dateInicial;
                        int horas = 0;
                        int Minutos = 0;
                        double TotalMinutos = 0;

                        if (item.DataInicial != null)
                        {
                            dateInicial = Convert.ToDateTime(item.DataInicial);
                            if (item.DataFinal != null)
                            {
                                DateTime dataFinal = Convert.ToDateTime(item.DataFinal);
                                horas = (dataFinal - dateInicial).Hours;
                                Minutos = (dataFinal - dateInicial).Minutes;
                                TotalMinutos = (dataFinal - dateInicial).TotalMinutes;
                            }
                            else
                            {
                                horas = (dataAtual - dateInicial).Hours;
                                Minutos = (dataAtual - dateInicial).Minutes;
                                TotalMinutos = (dataAtual - dateInicial).TotalMinutes;
                            }
                        }

                        this.Contatos.Add(new ItemViewModel()
                        {
                            ContatoImagem = Global.linkImagem + ((String.IsNullOrEmpty(item.Usuario.UrlImagem)) ? Global.imgUsuarioDefault : item.Usuario.UrlImagem),
                            ContatoTempo = horas.ToString("#0:") + Minutos.ToString("#00h"),
                            ContatoNome = item.Usuario.Nome,
                            ContatoTotalMinuto = TotalMinutos
                        });
                    }
                    llsContatos.ItemsSource = Contatos;

                    var usuariosAtivos = Contatos.Where(c => c.ContatoTotalMinuto > 0).ToList();
                    var MelhorTempo = usuariosAtivos.OrderBy(o => o.ContatoTotalMinuto).Take(3).ToList();
                    llsMelhorTempo.ItemsSource = MelhorTempo;

                    if (usuariosAtivos.Count > 0)
                    {
                        double tempoMedio = (usuariosAtivos.Sum(s => s.ContatoTotalMinuto)) / usuariosAtivos.Count;
                        this.lblTempoMedio.Text = "Tempo Médio: "
                            + TimeSpan.FromMinutes(tempoMedio).Hours.ToString() + ":"
                            + TimeSpan.FromMinutes(tempoMedio).Minutes.ToString() + "h";
                    }
                    else
                    {
                        this.lblTempoMedio.Text = "Tempo Médio: 0h";
                    }

                    this.lblQtdPaticipantes.Text = "Participantes: " + listEventoUsuario.Count.ToString();                    
                }
            }
            catch (Exception)
            {
                MessageBox.Show("Não foi possível executar esta ação, Verifique sua conexão com a internet", "Alerta!", MessageBoxButton.OK);
            }
        }

        private void btAtualizar_Click(object sender, EventArgs e)
        {
            Carregar();
        }
    }
}
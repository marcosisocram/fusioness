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
            this.Contatos = new ObservableCollection<ItemViewModel>();
            FusionessWS.MainServiceSoapClient servico = new FusionessWS.MainServiceSoapClient();

            servico.ListarUsuariosEventoAsync(new FusionessWS.Evento() { IdEvento = EventoId });
            servico.ListarUsuariosEventoCompleted += servico_ListarUsuariosEventoCompleted;
        }

        void servico_ListarUsuariosEventoCompleted(object sender, FusionessWS.ListarUsuariosEventoCompletedEventArgs e)
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

                    if (item.DataInicial != null)
                    {
                        dateInicial = Convert.ToDateTime(item.DataInicial);
                        if (item.DataFinal != null)
                        {
                            DateTime dataFinal = Convert.ToDateTime(item.DataFinal);
                            horas = (dataFinal - dateInicial).Hours;
                            Minutos = (dataFinal - dateInicial).Minutes;
                        }
                        else
                        {
                            horas = (dataAtual - dateInicial).Hours;
                            Minutos = (dataAtual - dateInicial).Minutes;
                        }
                    }

                    this.Contatos.Add(new ItemViewModel()
                    {
                        ContatoImagem = Global.linkImagem + ((String.IsNullOrEmpty(item.Usuario.UrlImagem)) ? Global.imgUsuarioDefault : item.Usuario.UrlImagem),
                        ContatoTempo = horas.ToString("#0:") + Minutos.ToString("#00h"),
                        ContatoNome = item.Usuario.Nome
                    });
                }
                llsContatos.ItemsSource = Contatos;
            }
        }

        private void btAtualizar_Click(object sender, EventArgs e)
        {
            Carregar();
        }
    }
}
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

namespace Fusioness.Mobile.Views
{
    public partial class ConvitesRecebidos : PhoneApplicationPage
    {
        public ObservableCollection<ItemViewModel> Convites { get; private set; }
        ItemViewModel Item;

        public ConvitesRecebidos()
        {
            InitializeComponent();
        }

        private void btVoltar_Click(object sender, EventArgs e)
        {
            NavigationService.GoBack();
        }

        private void PhoneApplicationPage_Loaded(object sender, RoutedEventArgs e)
        {
            try
            {
                FusionessWS.MainServiceSoapClient servico = new FusionessWS.MainServiceSoapClient();
                this.Convites = new ObservableCollection<ItemViewModel>();

                servico.ObterConvitesEventosDoUsuarioAsync(Global.usuarioLogado);
                servico.ObterConvitesEventosDoUsuarioCompleted += servico_ObterConvitesEventosDoUsuarioCompleted;
            }
            catch (Exception)
            {
                MessageBox.Show("Não foi possível enviar sua resposta, Verifique sua conexão com a internet", "Alerta!", MessageBoxButton.OK);
            }
        }

        void servico_ObterConvitesEventosDoUsuarioCompleted(object sender, FusionessWS.ObterConvitesEventosDoUsuarioCompletedEventArgs e)
        {
            try
            {
                IList<FusionessWS.ConviteEvento> listConvites = e.Result;
                if (listConvites != null)
                {
                    foreach (var item in listConvites)
                    {
                        this.Convites.Add(new ItemViewModel()
                        {
                            ContatoImagem = Global.linkImagem + ((String.IsNullOrEmpty(item.Usuario.UrlImagem)) ? Global.imgUsuarioDefault : item.Usuario.UrlImagem),
                            ContatoNome = item.Usuario.Nome,
                            ContatoId = item.IdUsuario,
                            EventoId = item.IdEvento,
                            EventoTitulo = item.Evento.Titulo,
                            EventoDescricao = item.Evento.Descricao,
                            EventoImagem = ((String.IsNullOrEmpty(item.Evento.UrlImagem)) ? Global.imgEventoDefault : Global.linkImagem + item.Evento.UrlImagem)
                        });
                    }
                    llsConvites.ItemsSource = this.Convites;
                }
            }
            catch (Exception)
            {
                MessageBox.Show("Não foi possível enviar sua resposta, Verifique sua conexão com a internet", "Alerta!", MessageBoxButton.OK);
            }       
        }

        private void btnAceitar_Click(object sender, RoutedEventArgs e)
        {
            //2	Vou
            Item = (sender as Button).DataContext as ItemViewModel;
            ResponderConvite(2);
        }

        private void btnRecusar_Click(object sender, RoutedEventArgs e)
        {
            //1	Não Vou
            Item = (sender as Button).DataContext as ItemViewModel;
            ResponderConvite(1);
        }

        private void ResponderConvite(int idResposta)
        {
            try
            {
                FusionessWS.MainServiceSoapClient servico = new FusionessWS.MainServiceSoapClient();

                FusionessWS.ConviteEvento convite = new FusionessWS.ConviteEvento()
                {
                    IdUsuario = Item.ContatoId,
                    IdContato = Global.usuarioLogado.IdUsuario,
                    IdEvento = Item.EventoId
                };

                FusionessWS.Resposta resposta = new FusionessWS.Resposta()
                {
                    IdResposta = idResposta
                };

                servico.ResponderConviteEventoAsync(convite, resposta);
                servico.ResponderConviteEventoCompleted += servico_ResponderConviteEventoCompleted;
            }
            catch (Exception)
            {
                MessageBox.Show("Não foi possível enviar sua resposta, Verifique sua conexão com a internet", "Alerta!", MessageBoxButton.OK);
            }
        }

        void servico_ResponderConviteEventoCompleted(object sender, FusionessWS.ResponderConviteEventoCompletedEventArgs e)
        {
            try
            {
                if (e.Result != null)
                {
                    this.llsConvites.ItemsSource.Remove(Item);
                }
                else
                {
                    MessageBox.Show("Não foi possível enviar sua resposta, Verifique sua conexão com a internet", "Alerta!", MessageBoxButton.OK);
                }
            }
            catch (Exception)
            {
                MessageBox.Show("Não foi possível enviar sua resposta, Verifique sua conexão com a internet", "Alerta!", MessageBoxButton.OK);
            }
        }
    }
}
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Navigation;
using Microsoft.Phone.Controls;
using Microsoft.Phone.Shell;
using System.Windows.Input;
using System.Collections.ObjectModel;
using Fusioness.Mobile.ViewModels;
using Fusioness.Mobile.Util;

namespace Fusioness.Mobile.Views
{
    public partial class BuscarContatos : PhoneApplicationPage
    {
        public ObservableCollection<ItemViewModel> Contatos { get; private set; }

        public BuscarContatos()
        {
            InitializeComponent();            
        }

        private void txtPesquisar_KeyDown(object sender, KeyEventArgs e)
        {
            try
            {
                if (e.Key == Key.Enter)
                {
                    if (!String.IsNullOrEmpty(this.txtPesquisar.Text))
                    {
                        this.Contatos = new ObservableCollection<ItemViewModel>();
                        FusionessWS.MainServiceSoapClient servico = new FusionessWS.MainServiceSoapClient();
                        servico.ListarUsuariosPorNomeAsync(this.txtPesquisar.Text.ToString(), Global.usuarioLogado.IdUsuario);
                        servico.ListarUsuariosPorNomeCompleted += servico_ListarUsuariosPorNomeCompleted;
                    }
                }
            }
            catch (Exception)
            {
                MessageBox.Show("Não foi possível executar esta ação, Verifique sua conexão com a internet", "Alerta!", MessageBoxButton.OK);
            }
        }

        void servico_ListarUsuariosPorNomeCompleted(object sender, FusionessWS.ListarUsuariosPorNomeCompletedEventArgs e)
        {
            try
            {
                IList<FusionessWS.Usuario> usuarios = e.Result;
                if (usuarios != null)
                {
                    foreach (var item in usuarios)
                    {
                        this.Contatos.Add(new ItemViewModel()
                        {
                            ContatoImagem = Global.linkImagem + ((String.IsNullOrEmpty(item.UrlImagem)) ? Global.imgUsuarioDefault : item.UrlImagem),
                            ContatoId = item.IdUsuario,
                            ContatoNome = item.Nome
                        });
                    }
                    llsContatos.ItemsSource = this.Contatos;
                }
                this.Focus();
            }
            catch (Exception)
            {
                MessageBox.Show("Não foi possível executar esta ação, Verifique sua conexão com a internet", "Alerta!", MessageBoxButton.OK);
            }
        }

        private void llsContatos_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            try
            {
                var res = (sender as LongListSelector).SelectedItem as ItemViewModel;

                MessageBoxResult result = MessageBox.Show("Deseja Adicionar " + res.ContatoNome + " aos Contatos?", "Adicionar?", MessageBoxButton.OKCancel);
                if (result == MessageBoxResult.OK)
                {
                    FusionessWS.MainServiceSoapClient servico = new FusionessWS.MainServiceSoapClient();
                    FusionessWS.Contato contato = new FusionessWS.Contato();

                    contato.IdUsuario = Global.usuarioLogado.IdUsuario;
                    contato.IdContato = res.ContatoId;

                    servico.InserirContatoAsync(contato);
                    servico.InserirContatoCompleted += servico_InserirContatoCompleted;
                }
            }
            catch (Exception)
            {
                MessageBox.Show("Não foi possível executar esta ação, Verifique sua conexão com a internet", "Alerta!", MessageBoxButton.OK);
            }
        }

        void servico_InserirContatoCompleted(object sender, FusionessWS.InserirContatoCompletedEventArgs e)
        {
            try
            {
                if (e.Result != null)
                {
                    MessageBox.Show("Contato adicionado com sucesso.");                    
                    NavigationService.Navigate(new Uri("/MainPage.xaml", UriKind.Relative));
                }
            }
            catch (Exception)
            {
                MessageBox.Show("Não foi possível executar esta ação, Verifique sua conexão com a internet", "Alerta!", MessageBoxButton.OK);
            }
        }
    }
}
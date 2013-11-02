﻿using System;
using System.Net;
using System.Collections.Generic;
using System.Linq;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Navigation;
using Microsoft.Phone.Controls;
using Microsoft.Phone.Shell;
using Microsoft.Phone.Net.NetworkInformation;
using Fusioness.Mobile.ViewModels;

namespace Fusioness.Mobile
{
    public partial class MainPage : PhoneApplicationPage
    {
        // Constructor
        public MainPage()
        {
            InitializeComponent();

            // Set the data context of the listbox control to the sample data
            DataContext = App.ViewModel;
        }
        
        // Load data for the ViewModel Items
        protected override void OnNavigatedTo(NavigationEventArgs e)
        {
            //this.llsRota.ItemsSource.Clear();
            App.ViewModel.LoadData();
        }

        private void btAdicionar_Click(object sender, EventArgs e)
        {
            if (PanoramaMain.SelectedItem == pnItemRota)
            {
                if (!NetworkInterface.GetIsNetworkAvailable())
                    MessageBox.Show("Ative sua rede Wi-Fi ou conecte com a Rede Móvel para executar esta ação!", "Alerta", MessageBoxButton.OK);
                else
                {
                    NavigationService.Navigate(new Uri("/Views/RotaMap.xaml", UriKind.Relative));
                }
            }
            else if (PanoramaMain.SelectedItem == pnItemEvento)
                MessageBox.Show("Adicionar Evento");
        }

        private void btPesquisar_Click(object sender, EventArgs e)
        {
            if (PanoramaMain.SelectedItem == pnItemContatos)
            {
                NavigationService.Navigate(new Uri("/Views/BuscarContatos.xaml", UriKind.Relative));
            }
        }

        private void llsRota_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            var res = (sender as LongListSelector).SelectedItem as ItemViewModel;

            NavigationService.Navigate(new Uri("/Views/RotaMap.xaml?RotaId=" + res.RotaId.ToString(), UriKind.Relative));
        }

        private void Excluir_Click(object sender, RoutedEventArgs e)
        {
            try
            {
                MessageBoxResult result = MessageBox.Show("Deseja Excluir Esta Rota?", "Excluir Rota?", MessageBoxButton.OKCancel);
                if (result == MessageBoxResult.OK)
                {
                    var Item = (sender as MenuItem).DataContext as ItemViewModel;                    
                    App.ViewModel.RemoverRota(Item.RotaId);

                    llsRota.ItemsSource.Remove(Item);
                    MessageBox.Show("Rota Excluída com Sucesso!");
                }
            }
            catch (Exception)
            {
                MessageBox.Show("Erro ao Excluir Rota!");
            }
        }

        private void Excluir_Contato_Click(object sender, RoutedEventArgs e)
        {
            try
            {
                var Item = (sender as MenuItem).DataContext as ItemViewModel;
                MessageBoxResult result = MessageBox.Show("Deseja Remover " + Item.ContatoNome + "dos seus Contatos?", "Atenção?", MessageBoxButton.OKCancel);
                if (result == MessageBoxResult.OK)
                {                    
                    App.ViewModel.RemoverContato(Item.ContatoId);

                    llsContatos.ItemsSource.Remove(Item);
                    MessageBox.Show("Contato Removido com Sucesso!");
                }
            }
            catch (Exception)
            {
                MessageBox.Show("Erro ao Excluir Rota!");
            }
        }

        private void llsEvento_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            var res = (sender as LongListSelector).SelectedItem as ItemViewModel;
            NavigationService.Navigate(new Uri("/Views/Evento.xaml?EventoId=" + res.EventoId.ToString(), UriKind.Relative));
        }

        private void Convidar_Click(object sender, RoutedEventArgs e)
        {
            var Item = (sender as MenuItem).DataContext as ItemViewModel;
            NavigationService.Navigate(new Uri("/Views/ConvidarParaEvento.xaml?EventoId=" + Item.EventoId.ToString(), UriKind.Relative));
        }
    }
}
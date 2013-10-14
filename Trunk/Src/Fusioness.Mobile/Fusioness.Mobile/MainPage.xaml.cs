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
            if (!App.ViewModel.IsDataLoaded)
            {
                App.ViewModel.LoadData();
            }
        }

        private void btAdicionar_Click(object sender, EventArgs e)
        {
            if (PanoramaMain.SelectedItem == pnItemRota)
            {
                if (!NetworkInterface.GetIsNetworkAvailable())
                    MessageBox.Show("Ative sua rede Wi-Fi ou conecte com a Rede Móvel para executar esta ação!", "Alerta", MessageBoxButton.OK);
                else
                {
                    NavigationService.Navigate(new Uri("/Views/CriarRota.xaml", UriKind.Relative));
                }
            }
            else if (PanoramaMain.SelectedItem == pnItemEvento)
                MessageBox.Show("Adicionar Evento");
        }

        private void btPesquisar_Click(object sender, EventArgs e)
        {
            MessageBox.Show("Pesquisar");
        }
    }
}
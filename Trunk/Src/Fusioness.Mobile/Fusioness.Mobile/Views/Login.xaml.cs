﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Navigation;
using Microsoft.Phone.Controls;
using Microsoft.Phone.Shell;
using Fusioness.Mobile.ViewModels;
using Microsoft.Phone.Net.NetworkInformation;
using Fusioness.Mobile.Util;

namespace Fusioness.Mobile.Views
{
    public partial class Login : PhoneApplicationPage
    {
        FusionessWS.Usuario usuario = new FusionessWS.Usuario();

        public Login()
        {
            if (!NetworkInterface.GetIsNetworkAvailable())
                MessageBox.Show("Ative sua rede Wi-Fi ou conecte com a Rede Móvel para executar esta ação!");
            else
                InitializeComponent();
        }

        private void btEnviar_Click(object sender, RoutedEventArgs e)
        {
            FusionessWS.MainServiceSoapClient servico = new FusionessWS.MainServiceSoapClient();

            usuario.Login = txtLogin.Text.ToString();
            usuario.Senha = txtSenha.Password.ToString();
            
            servico.ValidarLogonUsuarioAsync(usuario);
            servico.ValidarLogonUsuarioCompleted += servico_ValidarLogonUsuarioCompleted;            
        }

        void servico_ValidarLogonUsuarioCompleted(object sender, FusionessWS.ValidarLogonUsuarioCompletedEventArgs e)
        {
            try
            {
                Global.usuarioLogado = e.Result;
                if (Global.usuarioLogado != null)
                {                    
                    NavigationService.Navigate(new Uri("/MainPage.xaml", UriKind.Relative));
                }
                else
                {
                    MessageBox.Show("Usuário inválido.");
                }                
            }
            catch (Exception)
            {
                MessageBox.Show("Serviço indisponível no momento!");
            }
        }      
    }
}
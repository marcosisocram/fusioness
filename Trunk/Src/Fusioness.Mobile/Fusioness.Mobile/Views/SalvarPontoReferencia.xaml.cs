﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Navigation;
using Microsoft.Phone.Controls;
using Microsoft.Phone.Shell;
using System.Device.Location;
using Fusioness.Mobile.Util;

namespace Fusioness.Mobile.Views
{
    public partial class SalvarPontoReferencia : PhoneApplicationPage
    {
        GeoCoordinateWatcher watcherPonto;

        public SalvarPontoReferencia()
        {
            InitializeComponent();
        }

        private void btCancelar_Click(object sender, EventArgs e)
        {
            NavigationService.GoBack();
        }

        private void btSalvar_Click(object sender, EventArgs e)
        {
            if (String.IsNullOrEmpty(this.txtNomePonto.Text))
            {
                MessageBox.Show("Informe o nome do Ponto de Referência!");
                this.txtNomePonto.Focus();
            }
            else
            {
                watcherPonto = new GeoCoordinateWatcher(GeoPositionAccuracy.High)
                {
                    MovementThreshold = 20
                };
                watcherPonto.PositionChanged += this.watcher_PositionChanged;
                watcherPonto.StatusChanged += this.watcher_StatusChanged;
                watcherPonto.Start();
            }
        }

        private void watcher_PositionChanged(object sender, GeoPositionChangedEventArgs<GeoCoordinate> e)
        {
            GeoCoordinate geoCoordenada = e.Position.Location;
            FusionessWS.Coordenada coordenada = new FusionessWS.Coordenada();

            coordenada.Data = DateTime.Now;
            coordenada.IdTipoCoordenada = 2;
            coordenada.Latitude = geoCoordenada.Latitude;
            coordenada.Longitude = geoCoordenada.Longitude;
            //coordenada.UrlImagemPonto = "avatar.png";
            coordenada.NomePonto = this.txtNomePonto.Text.ToString();
            coordenada.DescricaoPonto = this.txtDescricao.Text.ToString();

            Global.fusCoordenadas.Add(coordenada);

            MessageBox.Show("Ponto de Referência Adicionado com Sucesso!");
            watcherPonto.Stop();

            NavigationService.GoBack();
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
    }
}
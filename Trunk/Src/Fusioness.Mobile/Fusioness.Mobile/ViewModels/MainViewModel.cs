using System;
using System.Collections.ObjectModel;
using System.ComponentModel;
using Fusioness.Mobile.Resources;
using System.Collections.Generic;
using Fusioness.Mobile.Util;

namespace Fusioness.Mobile.ViewModels
{
    public class MainViewModel : INotifyPropertyChanged
    {
        public MainViewModel()
        {
            
        }

        /// <summary>
        /// A collection for ItemViewModel objects.
        /// </summary>
        public ObservableCollection<ItemViewModel> Rotas { get; private set; }
        public ObservableCollection<ItemViewModel> Eventos { get; private set; }

        private string _sampleProperty = "Sample Runtime Property Value";
        /// <summary>
        /// Sample ViewModel property; this property is used in the view to display its value using a Binding
        /// </summary>
        /// <returns></returns>
        public string SampleProperty
        {
            get
            {
                return _sampleProperty;
            }
            set
            {
                if (value != _sampleProperty)
                {
                    _sampleProperty = value;
                    NotifyPropertyChanged("SampleProperty");
                }
            }
        }

        /// <summary>
        /// Sample property that returns a localized string
        /// </summary>
        public string LocalizedSampleProperty
        {
            get
            {
                return AppResources.SampleProperty;
            }
        }

        public bool IsDataLoaded
        {
            get;
            private set;
        }

        /// <summary>
        /// Creates and adds a few ItemViewModel objects into the Items collection.
        /// </summary>
        public void LoadData()
        {            
            this.Rotas = new ObservableCollection<ItemViewModel>();
            this.Eventos = new ObservableCollection<ItemViewModel>();
            FusionessWS.MainServiceSoapClient servico = new FusionessWS.MainServiceSoapClient();
            servico.ListarRotasPorUsuarioAsync(Global.usuarioLogado);
            servico.ListarRotasPorUsuarioCompleted += servico_ListarRotasPorUsuarioCompleted;
            servico.ListarEventosPorUsuarioAsync(Global.usuarioLogado);
            servico.ListarEventosPorUsuarioCompleted += servico_ListarEventosPorUsuarioCompleted;
            this.IsDataLoaded = true;
        }

        void servico_ListarEventosPorUsuarioCompleted(object sender, FusionessWS.ListarEventosPorUsuarioCompletedEventArgs e)
        {
            IList<FusionessWS.Evento> evetos = e.Result;

            foreach (var item in evetos)
            {
                this.Eventos.Add(new ItemViewModel()
                {
                    EventoImagem = "http://31.media.tumblr.com/tumblr_m3evdtpgE61r2y7tvo1_1280.jpg",//item.UrlImagem,   
                    EventoTitulo = item.Titulo,
                    EventoData = item.Data.ToString("dd/MM/yyyy")
                });
            }
        }        

        void servico_ListarRotasPorUsuarioCompleted(object sender, FusionessWS.ListarRotasPorUsuarioCompletedEventArgs e)
        {

            IList<FusionessWS.Rota> rotas = e.Result;

            foreach (var item in rotas)
            {
                this.Rotas.Add(new ItemViewModel()
                {
                    RotaId = item.IdRota,
                    RotaNome = item.Descricao.ToString()
                });
            }            
        }

        public void RemoverRota(int idRota)
        {
            FusionessWS.MainServiceSoapClient servico = new FusionessWS.MainServiceSoapClient();
            FusionessWS.Rota rota = new FusionessWS.Rota();
            rota.IdRota = idRota;
            servico.RemoverRotaAsync(rota);            
        }

        public event PropertyChangedEventHandler PropertyChanged;
        private void NotifyPropertyChanged(String propertyName)
        {
            PropertyChangedEventHandler handler = PropertyChanged;
            if (null != handler)
            {
                handler(this, new PropertyChangedEventArgs(propertyName));
            }
        }
    }
}
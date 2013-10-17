using System;
using System.ComponentModel;
using System.Diagnostics;
using System.Net;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Animation;

namespace Fusioness.Mobile.ViewModels
{
    public class ItemViewModel : INotifyPropertyChanged
    {
        private int _rotaId;
        /// <summary>
        /// Sample ViewModel property; this property is used in the view to display its value using a Binding.
        /// </summary>
        /// <returns></returns>
        public int RotaId
        {
            get
            {
                return _rotaId;
            }
            set
            {
                if (value != _rotaId)
                {
                    _rotaId = value;
                    NotifyPropertyChanged("IdRota");
                }
            }
        }

        private string _rotaNome;
        /// <summary>
        /// Sample ViewModel property; this property is used in the view to display its value using a Binding.
        /// </summary>
        /// <returns></returns>
        public string RotaNome
        {
            get
            {
                return _rotaNome;
            }
            set
            {
                if (value != _rotaNome)
                {
                    _rotaNome = value;
                    NotifyPropertyChanged("RotaNome");
                }
            }
        }

        private string _eventoImagem;
        /// <summary>
        /// Sample ViewModel property; this property is used in the view to display its value using a Binding.
        /// </summary>
        /// <returns></returns>
        public string EventoImagem
        {
            get
            {
                return _eventoImagem;
            }
            set
            {
                if (value != _eventoImagem)
                {
                    _eventoImagem = value;
                    NotifyPropertyChanged("EventoImagem");
                }
            }
        }

        private string _eventoTitulo;
        /// <summary>
        /// Sample ViewModel property; this property is used in the view to display its value using a Binding.
        /// </summary>
        /// <returns></returns>
        public string EventoTitulo
        {
            get
            {
                return _eventoTitulo;
            }
            set
            {
                if (value != _eventoTitulo)
                {
                    _eventoTitulo = value;
                    NotifyPropertyChanged("EventoTitulo");
                }
            }
        }

        private string _eventoData;
        /// <summary>
        /// Sample ViewModel property; this property is used in the view to display its value using a Binding.
        /// </summary>
        /// <returns></returns>
        public string EventoData
        {
            get
            {
                return _eventoData;
            }
            set
            {
                if (value != _eventoData)
                {
                    _eventoData = value;
                    NotifyPropertyChanged("EventoData");
                }
            }
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
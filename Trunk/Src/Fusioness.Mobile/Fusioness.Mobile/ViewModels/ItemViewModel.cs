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
        #region Rota

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
                    NotifyPropertyChanged("RotaId");
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

        #endregion

        #region Evento

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

        #endregion

        #region Tipo de Pista

        private int _tipoPistaId;
        /// <summary>
        /// Sample ViewModel property; this property is used in the view to display its value using a Binding.
        /// </summary>
        /// <returns></returns>
        public int TipoPistaId
        {
            get
            {
                return _tipoPistaId;
            }
            set
            {
                if (value != _tipoPistaId)
                {
                    _tipoPistaId = value;
                    NotifyPropertyChanged("TipoPistaId");
                }
            }
        }

        private string _tipoPistaDescricao;
        /// <summary>
        /// Sample ViewModel property; this property is used in the view to display its value using a Binding.
        /// </summary>
        /// <returns></returns>
        public string TipoPistaDescricao
        {
            get
            {
                return _tipoPistaDescricao;
            }
            set
            {
                if (value != _tipoPistaDescricao)
                {
                    _tipoPistaDescricao = value;
                    NotifyPropertyChanged("TipoPistaDescricao");
                }
            }
        } 

        #endregion

        #region Dificuldade
        
        private int _dificuldadeId;
        /// <summary>
        /// Sample ViewModel property; this property is used in the view to display its value using a Binding.
        /// </summary>
        /// <returns></returns>
        public int DificuldadeId
        {
            get
            {
                return _dificuldadeId;
            }
            set
            {
                if (value != _dificuldadeId)
                {
                    _dificuldadeId = value;
                    NotifyPropertyChanged("DificuldadeId");
                }
            }
        }

        private string _dificuldadeDescricao;
        /// <summary>
        /// Sample ViewModel property; this property is used in the view to display its value using a Binding.
        /// </summary>
        /// <returns></returns>
        public string DificuldadeDescricao
        {
            get
            {
                return _dificuldadeDescricao;
            }
            set
            {
                if (value != _dificuldadeDescricao)
                {
                    _dificuldadeDescricao = value;
                    NotifyPropertyChanged("DificuldadeDescricao");
                }
            }
        } 
        
        #endregion

        #region Qualidade da Rota

        private int _qualidadeId;
        /// <summary>
        /// Sample ViewModel property; this property is used in the view to display its value using a Binding.
        /// </summary>
        /// <returns></returns>
        public int QualidadeId
        {
            get
            {
                return _qualidadeId;
            }
            set
            {
                if (value != _qualidadeId)
                {
                    _qualidadeId = value;
                    NotifyPropertyChanged("QualidadeId");
                }
            }
        }

        private string _qualidadeDescricao;
        /// <summary>
        /// Sample ViewModel property; this property is used in the view to display its value using a Binding.
        /// </summary>
        /// <returns></returns>
        public string QualidadeDescricao
        {
            get
            {
                return _qualidadeDescricao;
            }
            set
            {
                if (value != _qualidadeDescricao)
                {
                    _qualidadeDescricao = value;
                    NotifyPropertyChanged("QualidadeDescricao");
                }
            }
        }

        #endregion

        #region Contatos

        private string _contatoImagem;
        /// <summary>
        /// Sample ViewModel property; this property is used in the view to display its value using a Binding.
        /// </summary>
        /// <returns></returns>
        public string ContatoImagem
        {
            get
            {
                return _contatoImagem;
            }
            set
            {
                if (value != _contatoImagem)
                {
                    _contatoImagem = value;
                    NotifyPropertyChanged("ContatoImagem");
                }
            }
        }

        private int _contatoId;
        /// <summary>
        /// Sample ViewModel property; this property is used in the view to display its value using a Binding.
        /// </summary>
        /// <returns></returns>
        public int ContatoId
        {
            get
            {
                return _contatoId;
            }
            set
            {
                if (value != _contatoId)
                {
                    _contatoId = value;
                    NotifyPropertyChanged("ContatoId");
                }
            }
        }


        private string _contatoNome;
        /// <summary>
        /// Sample ViewModel property; this property is used in the view to display its value using a Binding.
        /// </summary>
        /// <returns></returns>
        public string ContatoNome
        {
            get
            {
                return _contatoNome;
            }
            set
            {
                if (value != _contatoNome)
                {
                    _contatoNome = value;
                    NotifyPropertyChanged("ContatoNome");
                }
            }
        }

        #endregion

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
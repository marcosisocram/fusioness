﻿using System.Collections.Generic;
using System.Linq;
using Fusioness.FusionessWS;

namespace Fusioness.Models.Eventos
{
    public class EventoModel
    {
        private Evento _evento;
        public Evento Evento
        {
            get
            {
                if (_evento != null && string.IsNullOrWhiteSpace(_evento.UrlImagem))
                    _evento.UrlImagem = "data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAWgAAAEOCAYAAACkSI2SAAANmUlEQVR4Xu3cMW8USReG0TYIEAkhghARIhEixM8nIkKEEENsiQQSYFeDNFZvqXv69di+vuM9JJ++pTxVfar2cW97PGfn5+f/TP4QIECAQDuBM4FutycWRIAAgb8CAu0gECBAoKmAQDfdGMsiQICAQDsDBAgQaCog0E03xrIIECAg0M4AAQIEmgoIdNONsSwCBAgItDNAgACBpgIC3XRjLIsAAQIC7QwQIECgqYBAN90YyyJAgIBAOwMECBBoKiDQTTfGsggQICDQzgABAgSaCgh0042xLAIECAi0M0CAAIGmAgLddGMsiwABAgLtDBAgQKCpgEA33RjLIkCAgEA7AwQIEGgqINBNN8ayCBAgINDOAAECBJoKCHTTjbEsAgQICLQzQIAAgaYCAt10YyyLAAECAu0MECBAoKmAQDfdGMsiQICAQDsDBAgQaCog0E03xrIIECAg0M4AAQIEmgoIdNONsSwCBAgItDNAgACBpgIC3XRjLIsAAQIC7QwQIECgqYBAN90YyyJAgIBAOwMECBBoKiDQTTfGsggQICDQzgABAgSaCgh0042xLAIECAi0M0CAAIGmAgLddGMsiwABAgLtDBAgQKCpgEA33RjLIkCAgEA7AwQIEGgqINBNN8ayCBAgINDOAAECBJoKCHTTjbEsAgQICLQzQIAAgaYCAt10YyyLAAECAu0MECBAoKmAQDfdGMsiQICAQDsDBAgQaCog0E03xrIIECAg0M4AAQIEmgoIdNONsSwCBAgItDNAgACBpgIC3XRjLIsAAQIC7QwQIECgqYBAN90YyyJAgIBAOwMECBBoKiDQTTfGsggQICDQzgABAgSaCgh0042xLAIECAi0M0CAAIGmAgLddGMsiwABAgLtDBAgQKCpgEA33RjLIkCAgEA7AwQIEGgqINBNN8ayCBAgINDOAAECBJoKCHTTjbEsAgQICLQzQIAAgaYCAt10YyyLAAECAu0MECBAoKmAQDfdGMsiQICAQDsDBAgQaCog0E03xrIIECAg0M4AAQIEmgoIdNONsSwCBAgItDNAgACBpgIC3XRjLIsAAQIC7QwQIECgqYBAN90YyyJAgIBAOwMECBBoKiDQTTfGsggQICDQzgABAgSaCgh0042xLAIECAi0M0CAAIGm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";
                return _evento;
            }
            set
            {
                _evento = value;
            }
        }

        public IList<Rota> ListaRotas { get; set; }
        private IList<Evento> _listaEventos = new List<Evento>();
        public IList<Evento> ListaEventos
        {
            get
            {
                if (!_listaEventos.Any()) return _listaEventos;
                foreach (var t in _listaEventos.Where(t => string.IsNullOrWhiteSpace(t.UrlImagem)))
                {
                    t.UrlImagem = "data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAWgAAAEOCAYAAACkSI2SAAANmUlEQVR4Xu3cMW8USReG0TYIEAkhghARIhEixM8nIkKEEENsiQQSYFeDNFZvqXv69di+vuM9JJ++pTxVfar2cW97PGfn5+f/TP4QIECAQDuBM4FutycWRIAAgb8CAu0gECBAoKmAQDfdGMsiQICAQDsDBAgQaCog0E03xrIIECAg0M4AAQIEmgoIdNONsSwCBAgItDNAgACBpgIC3XRjLIsAAQIC7QwQIECgqYBAN90YyyJAgIBAOwMECBBoKiDQTTfGsggQICDQzgABAgSaCgh0042xLAIECAi0M0CAAIGmAgLddGMsiwABAgLtDBAgQKCpgEA33RjLIkCAgEA7AwQIEGgqINBNN8ayCBAgINDOAAECBJoKCHTTjbEsAgQICLQzQIAAgaYCAt10YyyLAAECAu0MECBAoKmAQDfdGMsiQICAQDsDBAgQaCog0E03xrIIECAg0M4AAQIEmgoIdNONsSwCBAgItDNAgACBpgIC3XRjLIsAAQIC7QwQIECgqYBAN90YyyJAgIBAOwMECBBoKiDQTTfGsggQICDQzgABAgSaCgh0042xLAIECAi0M0CAAIGmAgLddGMsiwABAgLtDBAgQKCpgEA33RjLIkCAgEA7AwQIEGgqINBNN8ayCBAgINDOAAECBJoKCHTTjbEsAgQICLQzQIAAgaYCAt10YyyLAAECAu0MECBAoKmAQDfdGMsiQICAQDsDBAgQaCog0E03xrIIECAg0M4AAQIEmgoIdNONsSwCBAgItDNAgACBpgIC3XRjLIsAAQIC7QwQIECgqYBAN90YyyJAgIBAOwMECBBoKiDQTTfGsggQICDQzgABAgSaCgh0042xLAIECAi0M0CAAIGmAgLddGMsiwABAgLtDBAgQKCpgEA33RjLIkCAgEA7AwQIEGgqINBNN8ayCBAgINDOAAECBJoKCHTTjbEsAgQICLQzQIAAgaYCAt10YyyLAAECAu0MECBAoKmAQDfdGMsiQICAQDsDBAgQaCog0E03xrIIECAg0M4AAQIEmgoIdNONsSwCBAgItDNAgACBpgIC3XRjLIsAAQIC7QwQIECgqYBAN90YyyJAgIBAOwMECBBoKiDQTTfGsggQICDQzgABAgSaCgh0042xLAIECAi0M0CAAIGm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";
                }
                return _listaEventos;
            }
            set
            {
                _listaEventos = value;
            }
        }

        public IList<Evento> ListaEventosQueSouDono { get; set; }
        public IList<ConviteEvento> ListaConviteEventos { get; set; }
        public IList<Resposta> RespostasPossiveis { get; set; }
        public IList<Usuario> ListaDeContatosDoUsuario { get; set; }

        public EventoModel()
        {
            ListaRotas = new List<Rota>();
            ListaEventos = new List<Evento>();
            ListaEventosQueSouDono = new List<Evento>();
            ListaConviteEventos = new List<ConviteEvento>();
            RespostasPossiveis = new List<Resposta>();
            ListaDeContatosDoUsuario = new List<Usuario>();
        }

        public bool SouDonoDoEvento(int idEvento)
        {
            return ListaEventosQueSouDono.Any(e => e.IdEvento == idEvento);
        }

        public bool IsCadastroEvento { get; set; }
        
    }
}
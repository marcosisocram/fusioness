using System.Collections.Generic;
using Fusioness.Entities;

namespace Fusioness.Business.ConvitesEventos
{
    public interface IConviteEventoBusiness
    {
        /// <summary>
        /// Obtém a lista de convites de ventos feitos para um determinado usuario
        /// </summary>
        /// <param name="convidado">Usuario convidado</param>
        IList<ConviteEvento> ObterConvitesFeitosAoUsuario(Usuario convidado);

        /// <summary>
        /// Obtém o convite feito ao usuario
        /// </summary>
        /// <param name="convidado">Usuario convidado</param>
        /// <param name="evento">Evento do convite</param>
        ConviteEvento ObterConviteFeitoAoUsuarioParaOEvento(Usuario convidado, Evento evento);

        /// <summary>
        /// Método responsável por atualizar o convite com a resposta informada.
        /// </summary>
        /// <param name="convite">Convite alvo.</param>
        /// <param name="resposta">Resposta dada.</param>
        ConviteEvento ResponderAoConvite(ConviteEvento convite, Resposta resposta);
    }
}

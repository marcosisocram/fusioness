using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Fusioness.Business.Util;
using Fusioness.Entities;

namespace Fusioness.Business.ConviteUsuarioEmails
{
    public interface IConviteUsuarioEmailBusiness
    {
        ConviteUsuarioEmail InserirConviteUsuarioEmail(ConviteUsuarioEmail convite);
        void InserirConviteUsuarioEmail(ConviteUsuarioEmail[] convites);
        List<ConviteUsuarioEmail> ListarConvites();
        List<ConviteUsuarioEmail> ListarConviteUsuarioEmailPorUsuario(Usuario usuario);
    }
}

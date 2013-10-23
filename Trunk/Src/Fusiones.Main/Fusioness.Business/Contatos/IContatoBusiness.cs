using System.Collections.Generic;
using Fusioness.Entities;

namespace Fusioness.Business.Contatos
{
    public interface IContatoBusiness
    {
        List<Contato> ListarContatos();
        List<Contato> ListarContatosDoUsuario(Usuario usuario);
        Contato InserirContato(Contato contato);
        Contato AlterarContato(Contato contato);
        bool ExcluirContato(Contato contato);
        List<Contato> ListarConvitesDoUsuario(Usuario usuario);
    }
}

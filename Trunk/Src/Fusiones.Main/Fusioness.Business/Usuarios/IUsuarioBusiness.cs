using System.Collections.Generic;
using System.Linq;
using Fusioness.Entities;

namespace Fusioness.Business.Usuarios
{
    public interface IUsuarioBusiness
    {
        void DoSomething(Usuario usuario);

        Usuario ValidarLogonUsuario(Usuario usuario);
        Usuario InsertUsuario(Usuario usuario);
        Usuario UpdateUsuario(Usuario usuario);

        Contato AdicionarUsuarioARede(Contato contato);

        List<Usuario> CarregarContatos(int idUsuario);
    }
}

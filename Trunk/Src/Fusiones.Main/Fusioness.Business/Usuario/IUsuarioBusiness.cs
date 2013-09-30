using System.Collections.Generic;
using System.Linq;
using Fusioness.Entities;

namespace Fusioness.Business.Usuarios
{
    public interface IUsuarioBusiness
    {
        void DoSomething(Usuario usuario);
        Usuario ValidarLogonUsuario(Usuario usuario);
        Usuario InserirUsuario(Usuario usuario);
        Usuario AlterarUsuario(Usuario usuario);
        void RemoverUsuario(Usuario usuario);
        Usuario ObterUsuarioPorId(Usuario usuario);
        List<Usuario> ListarUsuarios();
        Contato InserirContato(Contato contato);
        List<Usuario> ListarContatosPorUsuario(Usuario usuario);
    }
}

using System.Collections.Generic;
using System.IO;
using System.Linq;
using Fusioness.Entities;

namespace Fusioness.Business.Usuarios
{
    public interface IUsuarioBusiness
    {
        Usuario ValidarLogonUsuario(Usuario usuario);
        Usuario InserirUsuario(Usuario usuario);
        Usuario AlterarUsuario(Usuario usuario);
        void RemoverUsuario(Usuario usuario);
        Usuario ObterUsuarioPorId(Usuario usuario);
        List<Usuario> ListarUsuarios();
        string InserirFotoUsuario(Usuario usuario, byte[] bytes, string filename, string dirbase);
        List<Usuario> ObterUsuariosIds(List<int> idsUsuario);
        List<Usuario> ListarUsuariosPorNome(string nome);
    }
}

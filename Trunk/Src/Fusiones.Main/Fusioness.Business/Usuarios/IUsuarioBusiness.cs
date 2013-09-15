using System.Collections.Generic;
using System.Linq;
using Fusioness.Entities;

namespace Fusioness.Business.Usuarios
{
    public interface IUsuarioBusiness
    {
        void DoSomething(Usuario usuario);

        void InsertUsuario(Usuario usuario);
        void UpdateUsuario(Usuario usuario);

        void AdicionarUsuarioARede(Contato contato);
        void QualificarRota(int IdRota, int IdTipoRota, int IdUsuario);

        List<Usuario> CarregarContatos(int idUsuario);
    }
}

using Fusioness.Data.Contracts;
using Fusioness.Entities;

namespace Fusioness.Data.Repositories
{
    public class UsuarioTokenSenhaRepository : RepositoryBase<UsuarioTokenSenha>
    {
        public UsuarioTokenSenhaRepository(IUnityOfWork unityOfWork) : base(unityOfWork) { }
    }
}

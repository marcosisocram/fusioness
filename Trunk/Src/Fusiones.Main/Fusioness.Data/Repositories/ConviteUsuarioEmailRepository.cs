using Fusioness.Data.Contracts;
using Fusioness.Entities;


namespace Fusioness.Data.Repositories
{
    public class ConviteUsuarioEmailRepository : RepositoryBase<ConviteUsuarioEmail>
    {
        public ConviteUsuarioEmailRepository(IUnityOfWork unityOfWork) : base(unityOfWork) { }
    }
}

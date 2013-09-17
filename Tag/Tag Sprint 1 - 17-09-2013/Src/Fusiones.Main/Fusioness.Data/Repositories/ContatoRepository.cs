using Fusioness.Data.Contracts;
using Fusioness.Entities;

namespace Fusioness.Data.Repositories
{
    public class ContatoRepository : RepositoryBase<Contato>
    {
        public ContatoRepository(IUnityOfWork unityOfWork) : base(unityOfWork) { }
    }
}

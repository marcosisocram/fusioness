using Fusioness.Data.Contracts;
using Fusioness.Entities;

namespace Fusioness.Data.Repositories
{
    public class TipoPistaRepository : RepositoryBase<TipoPista>
    {
        public TipoPistaRepository(IUnityOfWork unityOfWork) : base(unityOfWork) { }
    }
}

using Fusioness.Data.Contracts;
using Fusioness.Entities;

namespace Fusioness.Data.Repositories
{
    public class TipoRotaRepository : RepositoryBase<TipoRota>
    {
        public TipoRotaRepository(IUnityOfWork unityOfWork) : base(unityOfWork) { }
    }
}

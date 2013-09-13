using Fusioness.Data.Contracts;
using Fusioness.Entities;

namespace Fusioness.Data.Repositories
{
    public class RotaRepository : RepositoryBase<Rota>
    {
        public RotaRepository(IUnityOfWork unityOfWork) : base(unityOfWork) { }
    }
}

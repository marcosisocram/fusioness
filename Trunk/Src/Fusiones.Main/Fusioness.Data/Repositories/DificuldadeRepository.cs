using Fusioness.Data.Contracts;
using Fusioness.Entities;

namespace Fusioness.Data.Repositories
{
    public class DificuldadeRepository : RepositoryBase<Dificuldade>
    {
        public DificuldadeRepository(IUnityOfWork unityOfWork) : base(unityOfWork) { }
    }
}

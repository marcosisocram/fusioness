using Fusioness.Data.Contracts;
using Fusioness.Entities;

namespace Fusioness.Data.Repositories
{
    public class RespostaRepository : RepositoryBase<Resposta>
    {
        public RespostaRepository(IUnityOfWork unityOfWork) : base(unityOfWork) { }
    }
}

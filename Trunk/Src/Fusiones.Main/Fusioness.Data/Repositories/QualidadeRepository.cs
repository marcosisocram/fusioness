using Fusioness.Data.Contracts;
using Fusioness.Entities;


namespace Fusioness.Data.Repositories
{
    public class QualidadeRotaRepository : RepositoryBase<QualidadeRota>
    {
        public QualidadeRotaRepository(IUnityOfWork unityOfWork) : base(unityOfWork) { }
    }
}

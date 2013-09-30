using Fusioness.Data.Contracts;
using Fusioness.Entities;


namespace Fusioness.Data.Repositories
{
    public class CoordenadaRepository : RepositoryBase<Coordenada>
    {
        public CoordenadaRepository(IUnityOfWork unityOfWork) : base(unityOfWork) { }
    }
}

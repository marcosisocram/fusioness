using Fusioness.Data.Contracts;
using Fusioness.Entities;


namespace Fusioness.Data.Repositories
{
    public class BicicletaRepository : RepositoryBase<Bicicleta>
    {
        public BicicletaRepository(IUnityOfWork unityOfWork) : base(unityOfWork) { }
    }
}

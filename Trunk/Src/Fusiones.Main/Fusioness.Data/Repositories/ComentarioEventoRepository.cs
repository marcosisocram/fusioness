using Fusioness.Data.Contracts;
using Fusioness.Entities;


namespace Fusioness.Data.Repositories
{
    public class ComentarioEventoRepository : RepositoryBase<ComentarioEvento>
    {
        public ComentarioEventoRepository(IUnityOfWork unityOfWork) : base(unityOfWork) { }
    }
}

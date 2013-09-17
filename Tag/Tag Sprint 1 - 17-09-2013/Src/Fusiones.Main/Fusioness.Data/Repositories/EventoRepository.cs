using Fusioness.Data.Contracts;
using Fusioness.Entities;

namespace Fusioness.Data.Repositories
{
    public class EventoRepository : RepositoryBase<Evento>
    {
        public EventoRepository(IUnityOfWork unityOfWork) : base(unityOfWork) { }
    }
}

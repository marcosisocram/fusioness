using Fusioness.Data.Contracts;
using Fusioness.Entities;

namespace Fusioness.Data.Repositories
{
    public class ConviteEventoRepository : RepositoryBase<ConviteEvento>
    {
        public ConviteEventoRepository(IUnityOfWork unityOfWork) : base(unityOfWork) { }
    }
}

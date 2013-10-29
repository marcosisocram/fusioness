using Fusioness.Data.Contracts;
using Fusioness.Entities;


namespace Fusioness.Data.Repositories
{
    public class EventoUsuarioRepository : RepositoryBase<EventoUsuario>
    {
        public EventoUsuarioRepository(IUnityOfWork unityOfWork) : base(unityOfWork) { }
    }
}

using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Fusioness.Data.Contracts;
using Fusioness.Entities;

namespace Fusioness.Data.Repositories
{
    public class UsuarioRepository : RepositoryBase<Usuario>
    {
        public UsuarioRepository(IUnityOfWork unityOfWork) : base(unityOfWork) { }
    }
}

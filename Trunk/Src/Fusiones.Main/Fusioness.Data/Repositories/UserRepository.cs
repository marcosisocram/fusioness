using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Fusioness.Data.Contracts;
using Fusioness.Entities;

namespace Fusioness.Data.Repositories
{
    public class UserRepository : RepositoryBase<User>
    {
        public UserRepository(IUnityOfWork unityOfWork) : base(unityOfWork) { }
    }
}
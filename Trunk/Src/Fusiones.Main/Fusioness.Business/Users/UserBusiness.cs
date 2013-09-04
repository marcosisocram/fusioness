using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Fusioness.Data;
using Fusioness.Data.Contracts;
using Fusioness.Data.Repositories;
using Fusioness.Entities;

namespace Fusioness.Business.Users
{
    public class UserBusiness
    {
        #region Properties
        private const string CONNECTION_STRING = "MY_CONNECTION";
        #endregion
        
        #region Constructor

        #endregion
        
        #region Methods
        #region Public
        public void DoSomething(User user)
        {
            using (IUnityOfWork uow = new EFUnityOfWork(CONNECTION_STRING))
            {
                IRepository<User> repo = new UserRepository(uow);
                //... IRepository<Type> repo2 = new TypeRepository(uow); //the same IUnityOfWork
                repo.Insert(user);
                //...
                uow.Commit();
            }
        }
        #endregion
        
        #region Private

        #endregion
        #endregion
    }
}

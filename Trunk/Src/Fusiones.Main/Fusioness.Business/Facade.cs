using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Fusioness.Business.Users;
using Fusioness.Entities;

namespace Fusioness.Business
{
    public class Facade
    {
        #region Properties
        private UserBusiness User;
        #endregion

        #region Constructor
        private static Facade _Instance;
        public static Facade Instance
        {
            get {
                return _Instance ?? (_Instance = new Facade());
            }
        }
        
        private Facade()
        {
            User = new UserBusiness();
        }
        #endregion

        #region Methods
        #region Public
        public void DoSomething(User user)
        {
            User.DoSomething(user);
        }
        #endregion

        #region Private

        #endregion
        #endregion
    }
}

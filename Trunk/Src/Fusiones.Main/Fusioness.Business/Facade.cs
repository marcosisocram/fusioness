using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Fusioness.Business.Usuarios;
using Fusioness.Entities;

namespace Fusioness.Business
{
    public class Facade
    {
        #region Properties
        private UsuariosBusiness User;
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
            User = new UsuariosBusiness();
        }
        #endregion

        #region Methods
        #region Public
        public void DoSomething(Usuario usuario)
        {
            User.DoSomething(usuario);
        }
        #endregion

        #region Private

        #endregion
        #endregion
    }
}

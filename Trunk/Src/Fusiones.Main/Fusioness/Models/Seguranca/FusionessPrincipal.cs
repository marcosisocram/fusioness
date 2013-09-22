using System.Security.Principal;

namespace Fusioness.Models.Seguranca
{
    public class FusionessPrincipal : IPrincipal 
    {
        public FusionessPrincipal(FusionessIdentity identity)
        {
            Identity = identity;
        }

        public IIdentity Identity
        {
            get;
            private set;
        }

        public bool IsInRole(string role)
        {
            return false;//o Fusioness não possui nivel de acesso.
        }
    }
}
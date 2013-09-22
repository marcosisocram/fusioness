using System.Security.Principal;
using System.Web;
using Fusioness.Controllers;

namespace Fusioness.Models.Seguranca
{
    public class FusionessIdentity : IIdentity
    {
        public FusionessIdentity(HttpContextBase httpContextBase)
        {
            HttpContext = httpContextBase;
        }
        
        public HttpContextBase HttpContext
        {
            get;
            private set;
        }

        public string AuthenticationType
        {
            get { return "Autenticação Fusioness Personalizada."; }
        }

        public bool IsAuthenticated
        {
            get { return BaseController.ObterUsuarioLogado(HttpContext) != null; }
        }

        public string Name
        {
            get
            {
                var usuarioLogado = BaseController.ObterUsuarioLogado(HttpContext);
                return usuarioLogado == null ? string.Empty : usuarioLogado.Login;
            }
        }
    }
}
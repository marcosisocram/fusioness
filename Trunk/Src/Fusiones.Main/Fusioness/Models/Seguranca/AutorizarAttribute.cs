using System;
using System.Web.Mvc;
using System.Web.Routing;

namespace Fusioness.Models.Seguranca
{
    [AttributeUsage(AttributeTargets.Class | AttributeTargets.Method, AllowMultiple = false, Inherited = true)]
    public class AutorizarAttribute : AuthorizeAttribute
    {
        public override void OnAuthorization(AuthorizationContext filterContext)
        {
            if (SkipAuthorization(filterContext)) { return; }

            filterContext.HttpContext.User = new FusionessPrincipal(new FusionessIdentity(filterContext.HttpContext));
            base.OnAuthorization(filterContext);
        }

        protected override void HandleUnauthorizedRequest(AuthorizationContext filterContext)
        {
            if (!filterContext.HttpContext.User.Identity.IsAuthenticated)
            {
                filterContext.Result = new RedirectToRouteResult(new RouteValueDictionary(new { controller = "Acesso", action = "Index" }));
            }
            else
            {
                base.HandleUnauthorizedRequest(filterContext);
            }
        }

        /// <summary>
        /// Método responsável por verificar ser o acesso anonimo é permitido
        /// </summary>
        /// <param name="filterContext">AuthorizationContext</param>
        /// <returns>true caso seja permitido</returns>
        private bool SkipAuthorization(AuthorizationContext filterContext)
        {
            return filterContext.ActionDescriptor.IsDefined(typeof(PermiteAnonimoAttribute), true) || filterContext.ActionDescriptor.ControllerDescriptor.IsDefined(typeof(PermiteAnonimoAttribute), true);
        }
    }
}
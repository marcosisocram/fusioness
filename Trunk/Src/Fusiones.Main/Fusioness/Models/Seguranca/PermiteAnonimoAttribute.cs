using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Fusioness.Models.Seguranca
{
    [AttributeUsage(AttributeTargets.Class | AttributeTargets.Method, AllowMultiple = false, Inherited = true)]
    public class PermiteAnonimoAttribute : Attribute { }
}
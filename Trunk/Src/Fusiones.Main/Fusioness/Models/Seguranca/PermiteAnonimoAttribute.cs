using System;

namespace Fusioness.Models.Seguranca
{
    [AttributeUsage(AttributeTargets.Class | AttributeTargets.Method, AllowMultiple = false, Inherited = true)]
    public class PermiteAnonimoAttribute : Attribute { }
}
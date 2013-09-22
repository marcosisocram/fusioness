using System.Collections.Generic;
using Fusioness.Entities;

namespace Fusioness.Business.TiposRota
{
    public interface ITipoRotaBusiness
    {
        IList<TipoRota> GetTipoRotas();
    }
}

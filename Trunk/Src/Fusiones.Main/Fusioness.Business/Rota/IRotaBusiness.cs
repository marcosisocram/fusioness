using System.Collections.Generic;
using System.Linq;
using Fusioness.Entities;

namespace Fusioness.Business.Rotas
{
    public interface IRotaBusiness
    {
        string CarregarRotas();

        void QualificarRota(int IdRota, int IdTipoRota, int IdUsuario);

        string GetRotas(int IdUsuario);
    }
}

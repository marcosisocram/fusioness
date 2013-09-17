using System.Collections.Generic;
using System.Linq;
using Fusioness.Entities;

namespace Fusioness.Business.Rotas
{
    public interface IRotaBusiness
    {
        List<Rota> CarregarRotas();

        List<Rota> CarregarRotasPorUsuario(int IdUsuario);
    }
}

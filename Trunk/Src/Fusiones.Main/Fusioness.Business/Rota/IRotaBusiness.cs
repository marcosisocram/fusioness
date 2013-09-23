using System.Collections.Generic;
using System.Linq;
using Fusioness.Entities;

namespace Fusioness.Business.Rotas
{
    public interface IRotaBusiness
    {
        Rota InsertRota(Rota rota);
        List<Rota> CarregarRotas();
        List<Rota> CarregarRotasPorUsuario(int IdUsuario);
    }
}

using System.Collections.Generic;
using System.Linq;
using Fusioness.Entities;

namespace Fusioness.Business.Rotas
{
    public interface IRotaBusiness
    {
        void InsertRota(Rota rota);
        List<Rota> CarregarRotas();
    }
}

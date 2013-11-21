using System.Collections.Generic;
using System.Linq;
using Fusioness.Entities;

namespace Fusioness.Business.Rotas
{
    public interface IRotaBusiness
    {
        Rota InserirRota(Rota rota);
        Rota AlterarRota(Rota rota);
        void RemoverRota(Rota rota);
        Rota ObterRotaPorId(Rota rota);
        List<Rota> ListarRotas();
        List<Rota> ListarRotasPorUsuario(Usuario usuario);
        List<Rota> ListarRotasRealizadasPorUsuario(Usuario usuario);
        List<Rota> ListarRotasRealizadasPorRotaOriginal(Rota rota);
    }
}

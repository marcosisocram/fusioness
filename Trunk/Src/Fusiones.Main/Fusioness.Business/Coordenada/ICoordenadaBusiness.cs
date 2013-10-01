using Fusioness.Entities;
using System.Collections.Generic;

namespace Fusioness.Business.Coordenadas
{
    public interface ICoordenadaBusiness
    {
        Coordenada InserirCoordenada(Coordenada coordenada);
        Coordenada AlterarCoordenada(Coordenada coordenada);
        void RemoverCoordenada(Coordenada coordenada);
        Coordenada ObterCoordenadaPorId(Coordenada coordenada);
        List<Coordenada> ListarCoordenadas();
        List<Coordenada> ListarCoordenadasPorRota(Rota rota);
    }
}

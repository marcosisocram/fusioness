﻿using Fusioness.Entities;
using System.Collections.Generic;

namespace Fusioness.Business.Coordenadas
{
    public interface ICoordenadaBusiness
    {
        Coordenada InserirCoordenada(Coordenada coordenada);
        List<Coordenada> InserirListaCoordenadas(List<Coordenada> listaCoordenadas, string dirBase);
        Coordenada AlterarCoordenada(Coordenada coordenada);
        void RemoverCoordenada(Coordenada coordenada);
        Coordenada ObterCoordenadaPorId(Coordenada coordenada);
        List<Coordenada> ListarCoordenadas();
        List<Coordenada> ListarCoordenadasPorRota(Rota rota);
        List<Coordenada> ListarPontosReferenciaPorRota(Rota rota);
        double ConsultarDuracaoRota(int idRota);
    }
}

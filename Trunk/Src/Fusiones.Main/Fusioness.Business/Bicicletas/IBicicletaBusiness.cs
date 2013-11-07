using Fusioness.Entities;
using System.Collections.Generic;

namespace Fusioness.Business.Bicicletas
{
    public interface IBicicletaBusiness
    {
        Bicicleta InserirBicicleta(Bicicleta bicicleta);
        Bicicleta AlterarBicicleta(Bicicleta bicicleta);
        void RemoverBicicleta(Bicicleta bicicleta);
        Bicicleta ObterBicicletaPorId(Bicicleta bicicleta);
        List<Bicicleta> ListarBicicletasPorUsuario(Usuario usuario);
        Bicicleta InserirFotoBicicleta(Bicicleta bicicleta, byte[] bytes, string filename, string dirBase);
    }
}

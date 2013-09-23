using Fusioness.Entities;

namespace Fusioness.Business.Bicicletas
{
    public interface IBicicletaBusiness
    {
        /// <summary>
        /// Método responsável cadastrar uma bicicleta.
        /// </summary>
        /// <param name="bicicleta">bicicleta</param>
        Bicicleta InsertBicicleta(Bicicleta bicicleta);
    }
}

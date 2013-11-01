using System;
using System.Collections.Generic;
using System.Device.Location;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Fusioness.Mobile.Util
{
    static public class Global
    {
        public static FusionessWS.Usuario usuarioLogado;
        public static IList<FusionessWS.Coordenada> fusCoordenadas;

        public enum Acao
        {
            Criar = 0,
            Visualizar = 1
        }
    }
}

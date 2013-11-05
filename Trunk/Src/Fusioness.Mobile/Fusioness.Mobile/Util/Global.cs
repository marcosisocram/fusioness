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
        public static string linkImagem = "http://fusionessapi.apphb.com/images/";
        public static string imgUsuarioDefault = "avatar.png";
        public static string imgEventoDefault = "Assets/ApplicationIcon.png";
        public const double coordenadaRange = 0.9;

        public enum Acao
        {
            Criar = 0,
            Visualizar = 1
        }
    }
}

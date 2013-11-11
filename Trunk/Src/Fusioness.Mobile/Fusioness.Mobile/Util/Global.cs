using System;
using System.Collections.Generic;
using System.Device.Location;
using System.IO;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Media.Imaging;

namespace Fusioness.Mobile.Util
{
    static public class Global
    {
        public static FusionessWS.Usuario usuarioLogado;
        public static IList<FusionessWS.Coordenada> fusCoordenadas;
        public static string linkImagem = "http://fusionessapi.apphb.com/images/";
        //public static string linkImagem = "http://10.1.2.4/images/";        
        //public static string linkImagem = "http://192.168.25.4/Fusioness.Services";
        public static string imgUsuarioDefault = "avatar.png";
        public static string imgEventoDefault = "Assets/ApplicationIcon.png";
        public const double coordenadaRange = 0.9;

        public enum Acao
        {
            Criar = 0,
            Visualizar = 1
        }

        public static byte[] ConvertToBytes(this BitmapImage bitmapImage)
        {
            byte[] data = null;
            using (MemoryStream stream = new MemoryStream())
            {
                WriteableBitmap wBitmap = new WriteableBitmap(bitmapImage);
                wBitmap.SaveJpeg(stream, wBitmap.PixelWidth, wBitmap.PixelHeight, 0, 100);
                stream.Seek(0, SeekOrigin.Begin);
                data = stream.GetBuffer();
            }

            return data;
        }
    }
}

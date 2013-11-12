using Fusioness.FusionessWS;
using System.Linq;
using System.Collections;
using System.Collections.Generic;

namespace Fusioness.Models.Home
{
    public class IndexModel
    {
        public Usuario User { get; set; }
        public List<Usuario> ConvitesNaoConfirmados { get; set; }
        public List<Evento> EventosNaoConfirmados { get; set; }
    }
}
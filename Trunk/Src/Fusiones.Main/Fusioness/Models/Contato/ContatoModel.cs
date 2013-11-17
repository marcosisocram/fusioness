using System.Collections.Generic;
using Fusioness.FusionessWS;

namespace Fusioness.Models.Contatos
{
    public class ContatoModel
    {
        public string Mensagem { get; set; }
        public Usuario UsuarioSelecionado { get; set; }
        public IList<Usuario> ListaDeUsuarios { get; set; }
        public IList<Usuario> ListaDeAmigos{ get; set; }
    }
}
using System.Collections.Generic;
using Fusioness.Entities;

namespace Fusioness.Models.Contatos
{
    public class ContatoModel
    {
        public string Mensagem { get; set; }
        public Usuario UsuarioSelecionado { get; set; }
        public IList<Usuario> ListaDeUsuarios { get; set; }
    }
}
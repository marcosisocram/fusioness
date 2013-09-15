using System.Collections.Generic;

namespace Fusioness.Entities
{
    public class Usuario : EntityBase
    {
        public Usuario()
        {
            Bicicletas = new List<Bicicleta>();
            Contatos = new List<Contato>();
            Contatos1 = new List<Contato>();
            Eventoes = new List<Evento>();
            EventoUsuarios = new List<EventoUsuario>();
            Rotas = new List<Rota>();
        }

        public int IdUsuario { get; set; }
        public string Nome { get; set; }
        public string Login { get; set; }
        public string Senha { get; set; }
        public string Email { get; set; }
        public int? Idade { get; set; }
        public string Sexo { get; set; }
        public string UrlImagem { get; set; }
        public virtual ICollection<Bicicleta> Bicicletas { get; set; }
        public virtual ICollection<Contato> Contatos { get; set; }
        public virtual ICollection<Contato> Contatos1 { get; set; }
        public virtual ICollection<Evento> Eventoes { get; set; }
        public virtual ICollection<EventoUsuario> EventoUsuarios { get; set; }
        public virtual ICollection<Rota> Rotas { get; set; }
    }
}

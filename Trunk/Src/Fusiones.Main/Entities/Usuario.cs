using System;
using System.Collections.Generic;

namespace Fusioness.Entities
{
    public class Usuario : EntityBase
    {
        public Usuario()
        {
            this.Bicicletas = new List<Bicicleta>();
            this.Contatos = new List<Contato>();
            this.Contatos1 = new List<Contato>();
            this.Eventos = new List<Evento>();
            this.Rotas = new List<Rota>();
            this.Eventos1 = new List<Evento>();
        }

        public int IdUsuario { get; set; }
        public string Nome { get; set; }
        public string Login { get; set; }
        public string Senha { get; set; }
        public string Email { get; set; }
        public Nullable<int> Idade { get; set; }
        public string Sexo { get; set; }
        public string UrlImagem { get; set; }
        public virtual ICollection<Bicicleta> Bicicletas { get; set; }
        public virtual ICollection<Contato> Contatos { get; set; }
        public virtual ICollection<Contato> Contatos1 { get; set; }
        public virtual ICollection<Evento> Eventos { get; set; }
        public virtual ICollection<Rota> Rotas { get; set; }
        public virtual ICollection<Evento> Eventos1 { get; set; }
    }
}

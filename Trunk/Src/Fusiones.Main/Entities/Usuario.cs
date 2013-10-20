using System;
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
            Eventos = new List<Evento>();
            EventoUsuarios = new List<EventoUsuario>();
            Rotas = new List<Rota>();
        }

        public int IdUsuario { get; set; }
        public string Nome { get; set; }
        public string Login { get; set; }
        public string Senha { get; set; }
        public string Email { get; set; }
        //public int? Idade { get; set; }
        public DateTime DataDeNascimento { get; set; }
        public string Sexo { get; set; }
        public string UrlImagem { get; set; }
        public virtual List<Bicicleta> Bicicletas { get; set; }
        public virtual List<Contato> Contatos { get; set; }
        public virtual List<Contato> Contatos1 { get; set; }
        public virtual List<Evento> Eventos { get; set; }
        public virtual List<EventoUsuario> EventoUsuarios { get; set; }
        public virtual List<Rota> Rotas { get; set; }
        public virtual List<ComentarioEvento> ComentariosEventos { get; set; }
    }
}

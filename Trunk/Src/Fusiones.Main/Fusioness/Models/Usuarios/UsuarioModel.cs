using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Fusioness.Entities;

namespace Fusioness.Models.Usuarios
{
    public class UsuarioModel
    {
        public string Mensagem { get; set; }
        public Usuario Usuario { get; set; }
    }
}
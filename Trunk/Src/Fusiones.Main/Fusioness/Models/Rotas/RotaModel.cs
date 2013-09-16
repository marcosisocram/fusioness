using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Fusioness.Entities;

namespace Fusioness.Models.Rotas
{
    public class RotaModel
    {
        public System.Collections.IEnumerable rotasUsuario
        {
            get
            {
                var rota1 = new Rota
                {
                    IdRota=10
                };
                var rota2 = new Rota
                {
                    IdRota = 11
                };
                var rotas = new Rota[] { rota1, rota2 };
                return rotas.ToList();
            }
        }

        public System.Collections.IEnumerable tiposRota
        {
            get
            {
                var rota1 = new TipoRota
                {
                    IdTipoRota = 1,
                    Descricao = "Desc1"
                };
                var rota2 = new TipoRota
                {
                    IdTipoRota = 2,
                    Descricao = "Desc2"
                };
                var rotas = new TipoRota[] { rota1, rota2 };
                return rotas.ToList();
            }
        }

        public Rota rota { get; set; }
    }
}
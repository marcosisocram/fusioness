using Fusioness.Entities;
using System.Collections.Generic;

namespace Fusioness.Business.ComentariosEvento
{
    public interface IComentarioEventoBusiness
    {
        ComentarioEvento InserirComentarioEvento(ComentarioEvento comentario);
        ComentarioEvento AlterarComentarioEvento(ComentarioEvento comentario);
        void RemoverComentarioEvento(ComentarioEvento comentario);
        ComentarioEvento ObterComentarioEventoPorId(ComentarioEvento comentario);
        List<ComentarioEvento> ListarComentariosPorEvento(Evento evento);
        List<ComentarioEvento> ListarComentariosPorUsuario(Usuario usuario);
    }
}

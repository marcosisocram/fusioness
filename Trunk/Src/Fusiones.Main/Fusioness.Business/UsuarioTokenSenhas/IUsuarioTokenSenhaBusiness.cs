using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Fusioness.Business.Util;
using Fusioness.Entities;

namespace Fusioness.Business.UsuarioTokenSenhas
{
    public interface IUsuarioTokenSenhaBusiness
    {
        List<UsuarioTokenSenha> ListarUsuarioTokenSenha();
        UsuarioTokenSenha ObterUsuarioTokenSenhaPeloToken(string token);
        UsuarioTokenSenha InserirUsuarioTokenSenha(UsuarioTokenSenha usuariotokensenha);
        UsuarioTokenSenha AlterarUsuarioTokenSenha(UsuarioTokenSenha usuariotokensenha);
    }
}

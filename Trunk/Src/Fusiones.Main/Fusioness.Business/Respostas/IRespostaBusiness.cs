using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Fusioness.Entities;

namespace Fusioness.Business.Respostas
{
    public interface IRespostaBusiness
    {
        Resposta ObterRespostaPorId(Resposta resposta);
    }
}

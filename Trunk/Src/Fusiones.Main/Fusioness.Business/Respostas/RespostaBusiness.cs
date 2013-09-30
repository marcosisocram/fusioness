using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Fusioness.Business.Util;
using Fusioness.Data;
using Fusioness.Data.Contracts;
using Fusioness.Data.Repositories;
using Fusioness.Entities;

namespace Fusioness.Business.Respostas
{
    public class RespostaBusiness : IRespostaBusiness
    {
        #region Properties

        private readonly string _ConnectionString;

        #endregion

        #region Constructor

        public RespostaBusiness()
        {
            _ConnectionString = ConnectionBuilder.GetConnection();
        }

        public RespostaBusiness(string connectionString)
        {
            _ConnectionString = connectionString;
        }
        #endregion

        #region Methods
        
        #region Public
        public Resposta ObterRespostaPorId(Resposta resposta)
        {
            using (IUnityOfWork uow = new EFUnityOfWork(_ConnectionString))
            {
                return new RespostaRepository(uow).GetByKey(new Resposta{ IdResposta = resposta.IdResposta});
            }
        }
        #endregion

        #region Private
        #endregion

        #endregion
    }
}

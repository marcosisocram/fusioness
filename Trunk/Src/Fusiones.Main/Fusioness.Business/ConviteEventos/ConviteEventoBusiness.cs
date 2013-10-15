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

namespace Fusioness.Business.ConvitesEventos
{
    public class ConviteEventoBusiness : IConviteEventoBusiness
    {
        #region Properties

        private readonly string _ConnectionString;

        #endregion

        #region Constructor

        public ConviteEventoBusiness()
        {
            _ConnectionString = ConnectionBuilder.GetConnection();
        }

        public ConviteEventoBusiness(string connectionString)
        {
            _ConnectionString = connectionString;
        }

        #endregion

        #region Methods

        #region Public

        public IList<ConviteEvento> ObterConvitesFeitosAoUsuario(Usuario convidado)
        {
            using (IUnityOfWork uow = new EFUnityOfWork(_ConnectionString))
            {
                return new ConviteEventoRepository(uow).GetWhere(c => c.IdContato == convidado.IdUsuario).ToList();
            }
        }

        public ConviteEvento ObterConviteFeitoAoUsuarioParaOEvento(Usuario convidado, Evento evento)
        {
            using (IUnityOfWork uow = new EFUnityOfWork(_ConnectionString))
            {
                return new ConviteEventoRepository(uow).GetWhere(c => c.IdContato == convidado.IdUsuario && c.IdEvento == evento.IdEvento).FirstOrDefault();
            }
        }

        public ConviteEvento ResponderAoConvite(ConviteEvento convite, Resposta resposta)
        {
            try
            {
                using (IUnityOfWork uow = new EFUnityOfWork(_ConnectionString))
                {
                    uow.OpenTransaction();

                    var conviteEventoRepo = new ConviteEventoRepository(uow);
                    var respostaRepo = new RespostaRepository(uow);
                    var respostaTemp = respostaRepo.GetByKey(resposta);
                    var conviteTemp = conviteEventoRepo.GetWhere(c => c.IdEvento == convite.IdEvento);

                    if (respostaTemp == null) throw new Exception("Resposta inválida.");
                    if (conviteTemp == null) throw new Exception("Convite inexistente.");

                    foreach (var conviteEvento in conviteTemp) conviteEvento.IdResposta = respostaTemp.IdResposta;

                    conviteEventoRepo.Update(conviteTemp);
                    uow.Commit();

                    return new ConviteEvento();
                }
            }
            catch (Exception ex)
            {
                //TODO: CREATE LOG
                throw;
            }
        }

        public IList<ConviteEvento> ListarConvitesEventos()
        {
            using (IUnityOfWork uow = new EFUnityOfWork(_ConnectionString))
            {
                return new ConviteEventoRepository(uow).GetAll().ToList();
            }
        }

        #endregion

        #region Private

        #endregion

        #endregion
    }
}

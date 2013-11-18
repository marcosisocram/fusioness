﻿using System;
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
                IRepository<ConviteEvento> repo = new ConviteEventoRepository(uow);
                IQueryable<ConviteEvento> convites = repo.GetWhere(c => c.IdContato == convidado.IdUsuario);
                if (convites.Any())
                {
                    preencherUsuarioConvite(convites);
                    preencherEventoConvite(convites);
                    return convites.ToList().Where(c => c.Evento.Data.Date.CompareTo(DateTime.Now.Date) >= 0).ToList();
                }

                return new List<ConviteEvento>();
            }
        }

        private void preencherUsuarioConvite(IQueryable<ConviteEvento> listaConvites)
        {
            using (IUnityOfWork uow = new EFUnityOfWork(_ConnectionString))
            {
                IRepository<Usuario> repo = new UsuarioRepository(uow);

                foreach (var convites in listaConvites)
                {
                    convites.Usuario = repo.GetByKey(new Usuario { IdUsuario = convites.IdUsuario });
                }
            }
        }

        private void preencherEventoConvite(IQueryable<ConviteEvento> listaConvites)
        {
            using (IUnityOfWork uow = new EFUnityOfWork(_ConnectionString))
            {
                IRepository<Evento> repo = new EventoRepository(uow);

                foreach (var convites in listaConvites)
                {
                    convites.Evento = repo.GetByKey(new Evento { IdEvento = convites.IdEvento });
                }
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
                    var conviteTemp = conviteEventoRepo.GetWhere(c => c.IdEvento == convite.IdEvento && c.IdContato == convite.IdContato);

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

        public List<ConviteEvento> ConvidarUsuarios(Usuario usuario, Evento evento, List<int> idsamigos)
        {
            if (idsamigos == null || !idsamigos.Any(id => id > 0) || usuario == null || usuario.IdUsuario <= 0) return new List<ConviteEvento>();

            using (IUnityOfWork uow = new EFUnityOfWork(_ConnectionString))
            {
                var repo = new ConviteEventoRepository(uow);
                var novosConvites = idsamigos.Select(id => new ConviteEvento { IdUsuario = usuario.IdUsuario, IdContato = id, IdEvento = evento.IdEvento}).ToList();
                var convitesExistentes = repo.GetWhere( c => c.IdEvento == evento.IdEvento && c.IdUsuario == usuario.IdUsuario && idsamigos.Any(idAmigo => idAmigo == c.IdContato)).ToList();
                if (convitesExistentes.Any())
                {
                    //Elimina convites já feitos
                    novosConvites = novosConvites.Where(cn => 
                        !convitesExistentes.Any(ce => ce.IdEvento == cn.IdEvento && ce.IdUsuario == cn.IdUsuario && ce.IdContato == cn.IdContato)
                    ).ToList();
                }
                var convites = repo.Insert(novosConvites).ToList();
                uow.Commit();
                return convites;
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

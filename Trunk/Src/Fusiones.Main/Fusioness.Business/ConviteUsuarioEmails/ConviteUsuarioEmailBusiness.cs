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

namespace Fusioness.Business.ConviteUsuarioEmails
{
    public class ConviteUsuarioEmailBusiness : IConviteUsuarioEmailBusiness
    {
        #region Properties

        private readonly string _ConnectionString;

        #endregion

        #region Constructor

        public ConviteUsuarioEmailBusiness()
        {
            _ConnectionString = ConnectionBuilder.GetConnection();
        }

        public ConviteUsuarioEmailBusiness(string connectionString)
        {
            _ConnectionString = connectionString;
        }

        #endregion

        #region Methods

        public ConviteUsuarioEmail InserirConviteUsuarioEmail(ConviteUsuarioEmail convite) 
        {
            try
            {
                using (IUnityOfWork uow = new EFUnityOfWork(_ConnectionString))
                {
                    IRepository<ConviteUsuarioEmail> repo = new ConviteUsuarioEmailRepository(uow);
                    convite = repo.Insert(convite);
                    uow.Commit();
                }
                return convite;
            }
            catch (Exception)
            {
                throw;
            }
        }
        public void InserirConviteUsuarioEmail(ConviteUsuarioEmail[] convites)
        {
            try
            {
                using (IUnityOfWork uow = new EFUnityOfWork(_ConnectionString))
                {
                    IRepository<ConviteUsuarioEmail> repo = new ConviteUsuarioEmailRepository(uow);
                    foreach (var convite in convites)
                    {
                        repo.Insert(convite);
                    }
                    uow.Commit();
                }
            }
            catch (Exception)
            {
                throw;
            }
        }
        public List<ConviteUsuarioEmail> ListarConvites()
        {
            try
            {
                using (IUnityOfWork uow = new EFUnityOfWork(_ConnectionString))
                {
                    IRepository<ConviteUsuarioEmail> repo = new ConviteUsuarioEmailRepository(uow);
                    return repo.GetAll().ToList();
                }
            }
            catch (Exception)
            {
                throw;
            }
        }
        public List<ConviteUsuarioEmail> ListarConviteUsuarioEmailPorUsuario(Usuario usuario)
        {
            try
            {
                using (IUnityOfWork uow = new EFUnityOfWork(_ConnectionString))
                {
                    IRepository<ConviteUsuarioEmail> repo = new ConviteUsuarioEmailRepository(uow);
                    return repo.GetWhere(c=>c.IdUsuarioConvidou==usuario.IdUsuario).ToList();
                }
            }
            catch (Exception)
            {
                throw;
            }
        }

        #endregion
    }
}

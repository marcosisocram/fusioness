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

namespace Fusioness.Business.UsuarioTokenSenhas
{
    public class UsuarioTokenSenhaBusiness : IUsuarioTokenSenhaBusiness
    {
        #region Properties

        private readonly string _ConnectionString;

        #endregion

        #region Constructor

        public UsuarioTokenSenhaBusiness()
        {
            _ConnectionString = ConnectionBuilder.GetConnection();
        }

        public UsuarioTokenSenhaBusiness(string connectionString)
        {
            _ConnectionString = connectionString;
        }

        #endregion

        #region Methods
        public List<UsuarioTokenSenha> ListarUsuarioTokenSenha()
        {
            try
            {
                using (IUnityOfWork uow = new EFUnityOfWork(_ConnectionString))
                {
                    IRepository<UsuarioTokenSenha> repo = new UsuarioTokenSenhaRepository(uow);
                    return repo.GetAll().ToList();
                }
            }
            catch (Exception)
            {
                throw;
            }
        }
        public UsuarioTokenSenha ObterUsuarioTokenSenhaPeloToken(string token)
        {
            try
            {
                using (IUnityOfWork uow = new EFUnityOfWork(_ConnectionString))
                {
                    IRepository<UsuarioTokenSenha> repo = new UsuarioTokenSenhaRepository(uow);
                    var DtLimite = DateTime.Now.AddDays(-7);
                    return repo.GetWhere(c => c.Token.Equals(token, StringComparison.InvariantCultureIgnoreCase) && c.DataDeGeracao >= DtLimite && !c.JaUsado).FirstOrDefault();
                }
            }
            catch (Exception)
            {
                throw;
            }
        }
        public UsuarioTokenSenha InserirUsuarioTokenSenha(UsuarioTokenSenha usuariotokensenha)
        {
            try
            {
                using (IUnityOfWork uow = new EFUnityOfWork(_ConnectionString))
                {
                    IRepository<UsuarioTokenSenha> repo = new UsuarioTokenSenhaRepository(uow);
                    usuariotokensenha = repo.Insert(usuariotokensenha);
                    uow.Commit();
                    return usuariotokensenha;
                }
            }
            catch (Exception)
            {
                throw;
            }
        }
        public UsuarioTokenSenha AlterarUsuarioTokenSenha(UsuarioTokenSenha usuariotokensenha)
        {
            try
            {
                using (IUnityOfWork uow = new EFUnityOfWork(_ConnectionString))
                {
                    IRepository<UsuarioTokenSenha> repo = new UsuarioTokenSenhaRepository(uow);
                    usuariotokensenha = repo.Update(usuariotokensenha);
                    uow.Commit();
                    return usuariotokensenha;
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

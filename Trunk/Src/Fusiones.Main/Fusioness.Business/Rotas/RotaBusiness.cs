using System;
using System.Collections.Generic;
using System.Linq;
using Fusioness.Business.Util;
using Fusioness.Data;
using Fusioness.Data.Contracts;
using Fusioness.Data.Repositories;
using Fusioness.Entities;

namespace Fusioness.Business.Rotas
{
    public class RotaBusiness : IRotaBusiness
    {
        #region Properties

        private readonly string _ConnectionString;

        #endregion

        #region Constructor

        public RotaBusiness()
        {
            _ConnectionString = ConnectionBuilder.GetConnection();
        }

        public RotaBusiness(string connectionString)
        {
            _ConnectionString = connectionString;
        }

        #endregion

        #region Methods
        public Rota InserirRota(Rota rota)
        {
            try
            {
                using (IUnityOfWork uow = new EFUnityOfWork(_ConnectionString))
                {
                    IRepository<Rota> repo = new RotaRepository(uow);
                    rota = repo.Insert(rota);
                    uow.Commit();
                }
                return rota;
            }
            catch (Exception)
            {
                return default(Rota);
            }
        }
        public Rota AlterarRota(Rota rota)
        {
            try
            {
                using (IUnityOfWork uow = new EFUnityOfWork(_ConnectionString))
                {
                    IRepository<Rota> repo = new RotaRepository(uow);
                    rota = repo.Update(rota);
                    uow.Commit();
                }
                return rota;
            }
            catch (Exception)
            {
                return default(Rota);
            }
        }
        public void RemoverRota(Rota rota)
        {
            try
            {
                using (IUnityOfWork uow = new EFUnityOfWork(_ConnectionString))
                {
                    IRepository<Rota> repo = new RotaRepository(uow);
                    repo.Delete(rota);
                    uow.Commit();
                }
            }
            catch (Exception)
            {
                throw;
            }
        }
        public Rota ObterRotaPorId(Rota rota)
        {
            using (IUnityOfWork uow = new EFUnityOfWork(_ConnectionString))
            {
                return new RotaRepository(uow).GetByKey(new Rota { IdRota = rota.IdRota });
            }
        }
        public List<Rota> ListarRotas()
        {
            using (IUnityOfWork uow = new EFUnityOfWork(_ConnectionString))
            {
                IRepository<Rota> repo = new RotaRepository(uow);
                var rotas = repo.GetAll();
                return rotas.ToList();
            }
        }
        public List<Rota> ListarRotasPorUsuario(Usuario usuario)
        {
            using (IUnityOfWork uow = new EFUnityOfWork(_ConnectionString))
            {
                IRepository<Rota> repo = new RotaRepository(uow);
                var rotas = repo.GetWhere(c => c.IdUsuario == usuario.IdUsuario && c.IdRotaOrigem == null).OrderBy(c => c.IdRota);
                return rotas.ToList();
            }
        }

        public List<Rota> ListarRotasRealizadasPorUsuario(Usuario usuario)
        {
            using (IUnityOfWork uow = new EFUnityOfWork(_ConnectionString))
            {
                IRepository<Rota> repo = new RotaRepository(uow);
                var rotas = repo.GetWhere(c => c.IdUsuario == usuario.IdUsuario && c.IdRotaOrigem != null).OrderByDescending(o => o.IdRota);
                return rotas.ToList();
            }
        }
        #endregion
    }
}
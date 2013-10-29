using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using Fusioness.Business.Util;
using Fusioness.Data;
using Fusioness.Data.Contracts;
using Fusioness.Data.Repositories;
using Fusioness.Entities;

namespace Fusioness.Business.Bicicletas
{
    class BicicletaBusiness : IBicicletaBusiness
    {
        #region Properties

        private readonly string _ConnectionString;

        #endregion

        #region Constructor

        public BicicletaBusiness()
        {
            _ConnectionString = ConnectionBuilder.GetConnection();
        }

        public BicicletaBusiness(string connectionString)
        {
            _ConnectionString = connectionString;
        }

        #endregion

        #region Methods

        public Bicicleta InserirBicicleta(Bicicleta bicicleta)
        {
            try
            {
                using (IUnityOfWork uow = new EFUnityOfWork(_ConnectionString))
                {
                    IRepository<Bicicleta> repo = new BicicletaRepository(uow);                    
                    bicicleta = repo.Insert(bicicleta);
                    uow.Commit();
                }
                return bicicleta;
            }
            catch (Exception)
            {
                throw;
            }
        }

        public Bicicleta AlterarBicicleta(Bicicleta bicicleta)
        {
            try
            {
                using (IUnityOfWork uow = new EFUnityOfWork(_ConnectionString))
                {
                    IRepository<Bicicleta> repo = new BicicletaRepository(uow);
                    bicicleta = repo.Update(bicicleta);
                    uow.Commit();
                }
                return bicicleta;
            }
            catch (Exception)
            {
                return default(Bicicleta);
            }
        }
        public void RemoverBicicleta(Bicicleta bicicleta)
        {
            try
            {
                using (IUnityOfWork uow = new EFUnityOfWork(_ConnectionString))
                {
                    IRepository<Bicicleta> repo = new BicicletaRepository(uow);
                    repo.Delete(bicicleta);
                    uow.Commit();
                }
            }
            catch (Exception)
            {
                throw;
            }
        }
        public Bicicleta ObterBicicletaPorId(Bicicleta bicicleta)
        {
            using (IUnityOfWork uow = new EFUnityOfWork(_ConnectionString))
            {
                return new BicicletaRepository(uow).GetByKey(new Bicicleta { IdBicicleta = bicicleta.IdBicicleta});
            }
        }
        public List<Bicicleta> ListarBicicletasPorUsuario(Usuario usuario)
        {
            try
            {
                using (IUnityOfWork uow = new EFUnityOfWork(_ConnectionString))
                {
                    IRepository<Bicicleta> repo = new BicicletaRepository(uow);
                    var bicicletas = repo.GetWhere(c => c.IdUsuario == usuario.IdUsuario);
                    return bicicletas.ToList();
                }
            }
            catch (Exception)
            {
                throw;
            }
        }
        public string InserirFotoBicicleta(Bicicleta bicicleta, byte[] bytes, string filename, string dirbase)
        {
            try
            {
                string retorno = string.Empty;
                var directory = Path.Combine(dirbase, "images");
                var fname = String.Format("{0}/{1}{2}", directory, Path.GetFileNameWithoutExtension(Path.GetTempFileName()), Path.GetExtension(filename));
                if (!Directory.Exists(directory))
                {
                    Directory.CreateDirectory(directory);
                }
                var fs = File.OpenWrite(fname);
                fs.Write(bytes, 0, bytes.Count());
                fs.Close();
                retorno = Path.GetFileName(fname);
                bicicleta.UrlImagem = retorno;
                bicicleta = AlterarBicicleta(bicicleta);
                return retorno;
            }
            catch (Exception)
            {
                return string.Empty;
            }

        }
        #endregion
    }
}

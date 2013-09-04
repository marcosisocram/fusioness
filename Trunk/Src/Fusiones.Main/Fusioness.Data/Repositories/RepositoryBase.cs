using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Linq.Expressions;
using System.Text;
using System.Threading.Tasks;
using Fusioness.Data.Contracts;
using Fusioness.Entities;

namespace Fusioness.Data.Repositories
{
    public abstract class RepositoryBase<T> : IRepository<T> where T : EntityBase
    {
        #region Properties
        public IUnityOfWork UnityOfWork { get; private set; }
        private FusionessContext _Context { get; set; }
        private DbSet<T> _DbSet { get; set; }
        #endregion
        
        #region Constructor
        public RepositoryBase(IUnityOfWork unityOfWork)
        {
            UnityOfWork = unityOfWork;
            _Context = (FusionessContext)UnityOfWork.Context;
            _DbSet = _Context.Set<T>();
        }
        #endregion
        
        #region Methods
        #region Public
        public T GetByID(int id)
        {
            return _DbSet.Find(id);
        }

        public IList<T> List(Expression<Func<T, bool>> where, int totalRows)
        {
            if (where != null) return _DbSet.Where(where).Take(totalRows).ToList();
            else return _DbSet.Take(totalRows).ToList();
        }

        public T Insert(T entity)
        {
            var result = _DbSet.Add(entity);
            UnityOfWork.Commit(false);
            return result;
        }

        public T Update(T entity)
        {
            _Context.Entry<T>(entity).State = EntityState.Modified;
            UnityOfWork.Commit(false);
            return entity;
        }

        public void Delete(int id)
        {
            var entity = GetByID(id);
            if (entity != null)
            {
                _DbSet.Remove(entity);
                UnityOfWork.Commit(false);
            }
        }

        public IEnumerable<T> ExecuteProcedure(string procedureName, params object[] parameters)
        {
            return _Context.Database.SqlQuery<T>(procedureName, parameters);
        }
        #endregion
        
        #region Private

        #endregion
        #endregion
    }
}

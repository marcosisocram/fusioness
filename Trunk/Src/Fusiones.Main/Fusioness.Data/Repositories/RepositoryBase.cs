using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Data.Entity.Infrastructure;
using System.Linq;
using System.Linq.Expressions;
using System.Runtime.Remoting.Contexts;
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
        private string[] _KeyNames { get; set; }
        #endregion
        
        #region Constructor
        public RepositoryBase(IUnityOfWork unityOfWork)
        {
            UnityOfWork = unityOfWork;
            _Context = (FusionessContext)UnityOfWork.Context;
            _DbSet = _Context.Set<T>();
            _KeyNames = GetKeyNames();
        }

        #endregion
        
        #region Methods
        #region Public
        public IQueryable<T> GetAll()
        {
            return _DbSet;
        }
        
        public IQueryable<T> GetWhere(Expression<Func<T, bool>> predicate)
        {
            return _DbSet.Where(predicate);
        }

        public T GetByKey(T entity)
        {
            return _DbSet.Find(GetKeysValues(entity));
        }

        public T Insert(T entity)
        {
            var newEntity = _DbSet.Add(entity);
            UnityOfWork.Commit(false);
            return newEntity;
        }

        public IEnumerable<T> Insert(IEnumerable<T> entities)
        {
            return entities.Select(Insert).Where(e => e != null);
        }

        public T Update(T entity)
        {
            var entityOnDataBase = GetByKey(entity);
            if (entityOnDataBase == null) return null;
            _Context.Entry(entityOnDataBase).CurrentValues.SetValues(entity);
            UnityOfWork.Commit(false);
            return entity;
        }

        public IEnumerable<T> Update(IEnumerable<T> entities)
        {
            return entities.Select(Update).Where(e => e != null);
        }

        public void Delete(T entity)
        {
            var entityToDelete = GetByKey(entity);
            if (entityToDelete == null) return;
            _DbSet.Remove(entityToDelete);
            UnityOfWork.Commit(false);
        }

        public void Delete(IEnumerable<T> entities)
        {
            entities.ToList().ForEach(Delete);
        }
        /*
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
        */
        public IEnumerable<T> ExecuteProcedure(string procedureName, params object[] parameters)
        {
            return _Context.Database.SqlQuery<T>(procedureName, parameters);
        }
        #endregion
        
        #region Private

        private string[] GetKeyNames()
        {
            var objectSet = ((IObjectContextAdapter)_Context).ObjectContext.CreateObjectSet<T>();
            return objectSet.EntitySet.ElementType.KeyMembers.Select(k => k.Name).ToArray();
        }

        private object[] GetKeysValues(T entity)
        {
            var type = typeof(T);
            var keysValues = new object[_KeyNames.Length];
            for (var i = 0; i < _KeyNames.Length; i++)
            {
                keysValues[i] = type.GetProperty(_KeyNames[i]).GetValue(entity, null);
            }
            return keysValues;
        }
        
        #endregion

        #endregion
    }
}

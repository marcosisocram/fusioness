using System;
using System.Collections.Generic;
using System.Linq;
using System.Linq.Expressions;
using Fusioness.Entities;

namespace Fusioness.Data.Contracts
{
    public interface IRepository<T> where T : EntityBase
    {
        /// <summary>
        /// 
        /// </summary>
        IUnityOfWork UnityOfWork { get;}
        IQueryable<T> GetAll();
        IQueryable<T> GetWhere(Expression<Func<T, bool>> predicate);
        T GetByKey(T entity);
        T Insert(T entity);
        IEnumerable<T> Insert(IEnumerable<T> entities);
        T Update(T entity);
        IEnumerable<T> Update(IEnumerable<T> entities);
        void Delete(T entity);
        void Delete(IEnumerable<T> entities);
        /*
        /// <summary>
        /// 
        /// </summary>
        /// <param name="id"></param>
        T GetByID(int id);
        /// <summary>
        /// 
        /// </summary>
        /// <param name="where"></param>
        IList<T> List(Expression<Func<T, bool>> where, int totalRows);
        /// <summary>
        /// 
        /// </summary>
        /// <param name="entity"></param>
        T Insert(T entity);
        /// <summary>
        /// 
        /// </summary>
        /// <param name="entity"></param>
        T Update(T entity);
        /// <summary>
        /// 
        /// </summary>
        /// <param name="id"></param>
        void Delete(int id);
        */
        /// <summary>
        /// 
        /// </summary>
        /// <param name="procedureName"></param>
        /// <param name="parameters"></param>
        IEnumerable<T> ExecuteProcedure(string procedureName, params object[] parameters);
        
    }
}

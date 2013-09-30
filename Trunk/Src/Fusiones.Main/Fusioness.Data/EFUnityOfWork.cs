using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Transactions;
using Fusioness.Data.Contracts;

namespace Fusioness.Data
{
    public class EFUnityOfWork : IUnityOfWork
    {
        #region Properties
        public DbContext Context { get; private set; }
        private TransactionScope _Transaction { get; set; }
        private bool _isTransactionDisposed { get; set; }
        #endregion

        #region Constructor
        public EFUnityOfWork(string connectionString)
        {
            Context = new FusionessContext(connectionString);
        }
        #endregion

        #region Method
        #region Public
        public void OpenTransaction()
        {
            if(_Transaction != null && !_isTransactionDisposed) return;

            _Transaction = new TransactionScope();
            _isTransactionDisposed = false;
        }
        public void Commit(bool commitTransaction = true)
        {
            if (commitTransaction)
            {
                Context.SaveChanges();

                if (_Transaction == null || _isTransactionDisposed) return;

                _Transaction.Complete();
                _Transaction.Dispose();
                _isTransactionDisposed = true;
            } else {
                if (_Transaction == null || _isTransactionDisposed) return;
                Context.SaveChanges();
            }
        }

        public void Dispose()
        {
            try
            {
                if(Context != null) Context.Dispose();
                if(_Transaction != null) _Transaction.Dispose();
            } finally
            {
                GC.SuppressFinalize(this);   
            }
        }
        #endregion

        #region Private
        #endregion
        #endregion
    }
}

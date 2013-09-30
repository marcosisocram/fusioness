using System;
using System.Data.Entity;

namespace Fusioness.Data.Contracts
{
    public interface IUnityOfWork : IDisposable
    {
        DbContext Context { get; }

        void OpenTransaction();
        /// <summary>
        /// Efetua o commit.
        /// </summary>
        /// <param name="commitTransaction">
        /// Caso o valor seja true: Além de salvar as mudanças do context, efetua o commit da transação caso possua escopo transacional.
        /// Do contrário: Salva apenas as mudanças do context se, e somente se, o escopo for transacional, porém não efetua o commit da transação.
        /// </param>
        void Commit(bool commitTransaction = true);
    }
}

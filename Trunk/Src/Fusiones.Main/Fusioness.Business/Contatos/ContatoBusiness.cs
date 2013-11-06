using System;
using System.Collections.Generic;
using System.Linq;
using Fusioness.Business.Util;
using Fusioness.Data;
using Fusioness.Data.Contracts;
using Fusioness.Data.Repositories;
using Fusioness.Entities;

namespace Fusioness.Business.Contatos
{
    public class ContatoBusiness : IContatoBusiness
    {
        #region Properties

        private readonly string _ConnectionString;

        #endregion

        #region Constructor

        public ContatoBusiness()
        {
            _ConnectionString = ConnectionBuilder.GetConnection();
        }

        public ContatoBusiness(string connectionString)
        {
            _ConnectionString = connectionString;
        }

        #endregion

        #region Methods

        #region Public

        public List<Contato> ListarContatos()
        {
            using (IUnityOfWork uow = new EFUnityOfWork(_ConnectionString))
            {
                return new ContatoRepository(uow).GetAll().ToList();
            }
        }

        public List<Contato> ListarContatosDoUsuario(Usuario usuario)
        {
            if(usuario == null || usuario.IdUsuario <= 0) return new List<Contato>();

            using (IUnityOfWork uow = new EFUnityOfWork(_ConnectionString))
            {
                var repo = new ContatoRepository(uow);
                var meusContatos = repo.GetWhere(c => c.IdUsuario == usuario.IdUsuario).ToList();
                var meusContatosAceitos = repo.GetWhere(c => c.IdContato == usuario.IdUsuario).ToList();

                return meusContatos.Where(meu => meusContatosAceitos.Any(dele => meu.IdContato == dele.IdUsuario)).ToList();
            }
        }

        public Contato InserirContato(Contato contato)
        {
            if (contato == null || (contato.IdUsuario <= 0 || contato.IdContato <= 0)) return new Contato();

            try
            {
                using (IUnityOfWork uow = new EFUnityOfWork(_ConnectionString))
                {
                    IRepository<Contato> repo = new ContatoRepository(uow);
                    var contatos = new List<Contato> {contato};
                    contatos = repo.Insert(contatos).ToList();
                    uow.Commit();
                    return contatos.First();
                }
            }
            catch (Exception)
            {
                return new Contato();
            }
        }

        public Contato AlterarContato(Contato contato)
        {
            using (IUnityOfWork uow = new EFUnityOfWork(_ConnectionString))
            {
                var repo = new ContatoRepository(uow);
                contato = repo.Update(contato);
                uow.Commit();
            }
            return contato;
        }

        public bool ExcluirContato(Contato contato)
        {
            if (contato == null || (contato.IdUsuario <= 0 || contato.IdContato <= 0)) return false;
            try
            {
                using (var uow = new EFUnityOfWork(_ConnectionString))
                {
                    var repo = new ContatoRepository(uow);
                    var aDeletar = repo.GetWhere(c => 
                        (c.IdUsuario == contato.IdUsuario && c.IdContato == contato.IdContato)
                        ||
                        (c.IdContato == contato.IdUsuario && c.IdUsuario == contato.IdContato)
                    );
                    if (aDeletar != null && aDeletar.Any()) repo.Delete(aDeletar);
                    uow.Commit();
                    return true;
                }
            }
            catch
            {
                return false;
            }
        }

        public List<Contato> ListarConvitesDoUsuario(Usuario usuario)
        {
            /* Convites tem UsuarioId e ContatoId.
             * Se existe um registro onde usuario.Id é ContatoId
             * e não existe o registro onde usuario.Id é UsuarioId
             * então o convite está aberto.
            */
            var allContatos = ListarContatos();
            var meusContatos = ListarContatosDoUsuario(usuario).Select(c=>c.IdContato);
            var convites = allContatos.Where(c => c.IdContato == usuario.IdUsuario && !meusContatos.Contains(c.IdUsuario));
            return convites.ToList();
        }
        #endregion

        #region Private

        #endregion

        #endregion
    }
}

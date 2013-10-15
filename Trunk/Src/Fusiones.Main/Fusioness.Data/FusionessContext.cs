using System.Data.Entity;
using Fusioness.Data.Mapping;
using Fusioness.Entities;

namespace Fusioness.Data
{
    public class FusionessContext : DbContext
    {
        #region Properties
        public DbSet<Bicicleta> Bicicletas { get; set; }
        public DbSet<Contato> Contatoes { get; set; }
        public DbSet<ConviteEvento> ConviteEventoes { get; set; }
        public DbSet<Coordenada> Coordenadas { get; set; }
        public DbSet<Dificuldade> Dificuldades { get; set; }
        public DbSet<Evento> Eventoes { get; set; }
        public DbSet<EventoUsuario> EventoUsuarios { get; set; }
        public DbSet<QualidadeRota> QualidadeRotas { get; set; }
        public DbSet<Resposta> Respostas { get; set; }
        public DbSet<Rota> Rotas { get; set; }
        public DbSet<ComentarioEvento> ComentariosEventos { get; set; }
        public DbSet<TipoCoordenada> TipoCoordenadas { get; set; }
        public DbSet<TipoPista> TipoPistas { get; set; }
        public DbSet<TipoRota> TipoRotas { get; set; }
        public DbSet<Usuario> Usuarios { get; set; }
        #endregion

        #region Constructor
        public FusionessContext() : base("name=ConnectionString") { }
        public FusionessContext(string connectionString) : base(connectionString) { }
        #endregion
        
        #region Methods
        #region Public

        #endregion
        
        #region Private
        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            modelBuilder.Configurations.Add(new BicicletaMap());
            modelBuilder.Configurations.Add(new ContatoMap());
            modelBuilder.Configurations.Add(new ConviteEventoMap());
            modelBuilder.Configurations.Add(new CoordenadaMap());
            modelBuilder.Configurations.Add(new DificuldadeMap());
            modelBuilder.Configurations.Add(new EventoMap());
            modelBuilder.Configurations.Add(new EventoUsuarioMap());
            modelBuilder.Configurations.Add(new QualidadeRotaMap());
            modelBuilder.Configurations.Add(new RespostaMap());
            modelBuilder.Configurations.Add(new RotaMap());
            modelBuilder.Configurations.Add(new ComentarioEventoMap());
            modelBuilder.Configurations.Add(new TipoCoordenadaMap());
            modelBuilder.Configurations.Add(new TipoPistaMap());
            modelBuilder.Configurations.Add(new TipoRotaMap());
            modelBuilder.Configurations.Add(new UsuarioMap());
        }
        #endregion
        #endregion
    }
}
using AutoMapper;
using Fusioness.Entities;

namespace Fusioness.App_Start
{
    public static class EntitiesMapping
    {
        public static void Map()
        {
            Mapper.CreateMap<EntityBase, FusionessWS.EntityBase>();
            Mapper.CreateMap<Bicicleta, FusionessWS.Bicicleta>();
            Mapper.CreateMap<Contato, FusionessWS.Contato>();
            Mapper.CreateMap<ConviteEvento, FusionessWS.ConviteEvento>();
            Mapper.CreateMap<Coordenada, FusionessWS.Coordenada>();
            Mapper.CreateMap<Dificuldade, FusionessWS.Dificuldade>();
            Mapper.CreateMap<Evento, FusionessWS.Evento>();
            Mapper.CreateMap<EventoUsuario, FusionessWS.EventoUsuario>();
            Mapper.CreateMap<QualidadeRota, FusionessWS.QualidadeRota>();
            Mapper.CreateMap<Resposta, FusionessWS.Resposta>();
            Mapper.CreateMap<Rota, FusionessWS.Rota>();
            Mapper.CreateMap<StatusEvento, FusionessWS.StatusEvento>();
            Mapper.CreateMap<TipoCoordenada, FusionessWS.TipoCoordenada>();
            Mapper.CreateMap<TipoPista, FusionessWS.TipoPista>();
            Mapper.CreateMap<TipoRota, FusionessWS.TipoRota>();
            Mapper.CreateMap<Usuario, FusionessWS.Usuario>();

            Mapper.CreateMap<FusionessWS.EntityBase, EntityBase>();
            Mapper.CreateMap<FusionessWS.Bicicleta, Bicicleta>();
            Mapper.CreateMap<FusionessWS.Contato, Contato>();
            Mapper.CreateMap<FusionessWS.ConviteEvento, ConviteEvento>();
            Mapper.CreateMap<FusionessWS.Coordenada, Coordenada>();
            Mapper.CreateMap<FusionessWS.Dificuldade, Dificuldade>();
            Mapper.CreateMap<FusionessWS.Evento, Evento>();
            Mapper.CreateMap<FusionessWS.EventoUsuario, EventoUsuario>();
            Mapper.CreateMap<FusionessWS.QualidadeRota, QualidadeRota>();
            Mapper.CreateMap<FusionessWS.Resposta, Resposta>();
            Mapper.CreateMap<FusionessWS.Rota, Rota>();
            Mapper.CreateMap<FusionessWS.StatusEvento, StatusEvento>();
            Mapper.CreateMap<FusionessWS.TipoCoordenada, TipoCoordenada>();
            Mapper.CreateMap<FusionessWS.TipoPista, TipoPista>();
            Mapper.CreateMap<FusionessWS.TipoRota, TipoRota>();
            Mapper.CreateMap<FusionessWS.Usuario, Usuario>();

            Mapper.AssertConfigurationIsValid();
        }
    }
}
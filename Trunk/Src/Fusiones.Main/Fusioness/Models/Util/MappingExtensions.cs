using System.Collections.Generic;
using AutoMapper;
using Fusioness.Entities;

namespace Fusioness.Models.Util
{
    public static class EntityMappingExtensions
    {
        public static T GetEntity<TService, T>(this TService entity) where TService : FusionessWS.EntityBase where T : EntityBase
        {
            return Mapper.Map<TService, T>(entity);
        }

        public static IList<T> GetEntity<TService, T>(this IList<TService> entity) where TService : FusionessWS.EntityBase where T : EntityBase
        {
            return Mapper.Map <IList<TService>, IList<T>>(entity);
        }

        public static TService GetEntityService<T, TService>(this T entity) where TService : FusionessWS.EntityBase where T : EntityBase
        {
            return Mapper.Map<T, TService>(entity);
        }

        public static IList<TService> GetEntityService<T, TService>(this IList<T> entity) where TService : FusionessWS.EntityBase where T : EntityBase
        {
            return Mapper.Map<IList<T>, IList<TService>>(entity);
        }
    }
}
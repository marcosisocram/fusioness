using System;
using System.ComponentModel.DataAnnotations.Schema;

namespace Fusioness.Entities
{
    [Serializable]
    public class EntityBase
    {
        [NotMapped]
        public int StatusRetorno { get; set; }
        [NotMapped]
        public String DescricaoRetorno { get; set; }
    }
}

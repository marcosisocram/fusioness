using System;
namespace Fusioness.Entities
{
    public class ConviteUsuarioEmail : EntityBase
    {
        public int ID { get; set; }
        public int IdUsuarioConvidou { get; set; }
        public string EmailConvidado { get; set; }
        public DateTime DataDoConvite { get; set; }
    }
}

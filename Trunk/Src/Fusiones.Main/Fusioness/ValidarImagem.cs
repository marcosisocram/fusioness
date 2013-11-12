using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Fusioness
{
    public class ValidarImagem
    {
        public bool IsImagemValida { 
            get 
            {
                return String.IsNullOrWhiteSpace(Retorno);
            } 
        }
        public HttpPostedFileBase image { get; set; }
        public string Retorno { get; set; }

        public ValidarImagem() 
        {
        }

        public ValidarImagem(HttpPostedFileBase image) 
        {
            this.image = image;
            Validar();
        }

        private void Validar()
        {
            try
            {
                if (image == null || image.ContentLength <= 0)
                {
                    Retorno = "Não foi selecionado nenhum arquivo.";
                }
                else if (!image.ContentType.ToLower().Contains("image"))
                {
                    Retorno = "O arquivo selecionado não é uma imagem.";
                }
            }
            catch (Exception e)
            {
                Retorno = e.Message;
            }
        }
    }
}
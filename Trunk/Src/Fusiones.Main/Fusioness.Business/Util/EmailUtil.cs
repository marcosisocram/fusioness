﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Mail;
using System.Text;
using System.Threading.Tasks;

namespace Fusioness.Business.Util
{
    class EmailUtil
    {
        public static bool EnviaEmail(string to, string subject, string body)
        {
            try
            {
                const string fromAddress = "fusionessapp@gmail.com";
                const string fromPassword = "Unibratec";
                var smtp = new SmtpClient
                {
                    Host = "smtp.gmail.com",
                    Port = 587,
                    EnableSsl = true,
                    DeliveryMethod = SmtpDeliveryMethod.Network,
                    UseDefaultCredentials = false,
                    Credentials = new NetworkCredential(fromAddress, fromPassword)
                };
                smtp.Send(new MailMessage(fromAddress, to, subject, body));
                return true;
            }
            catch
            {
                return false;
            }
        }
    }
}

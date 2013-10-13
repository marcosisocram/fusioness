using System.Web.Mvc;
using Fusioness.Models.Usuarios;
using Fusioness.Models.Seguranca;

namespace Fusioness.Controllers
{
    public class UsuarioController : BaseController
    {
        [PermiteAnonimo]
        public ActionResult Index(UsuarioModel model)
        {
            return View(model);
        }
        
        [PermiteAnonimo]
        public ActionResult InsertUsuario(UsuarioModel model)
        {
            if (ValidarCamposUsuario(model))
            {
                if (model.Usuario.IdUsuario > 0)
                {
                    return UpdateUsuario(model);
                }
                model.Usuario = Servico.InserirUsuario(model.Usuario);
                return RedirectToAction("index", model);
            }
            return View("index", model);
        }

        public ActionResult UpdateUsuario(UsuarioModel model)
        {
            model.Usuario = Servico.AlterarUsuario(model.Usuario);
            
            return RedirectToAction("index", model);
        
        }

        private bool ValidarCamposUsuario(UsuarioModel model)
        {
            bool retorno = true;
            // confere required fields
            if (string.IsNullOrWhiteSpace(model.Usuario.Nome))
            {
                ModelState.AddModelError("Nome", "Preecha o nome");
                retorno = false;
            }
            if (string.IsNullOrWhiteSpace(model.Usuario.Login))
            {
                ModelState.AddModelError("Login", "Preecha o login");
                retorno = false;
            }
            if (string.IsNullOrWhiteSpace(model.Usuario.Senha))
            {
                ModelState.AddModelError("Senha", "Preecha a senha");
                retorno = false;
            }
            if (string.IsNullOrWhiteSpace(model.Usuario.Email))
            {
                ModelState.AddModelError("Email", "Preecha o e-mail");
                retorno = false;
            }
            else if (!System.Text.RegularExpressions.Regex.IsMatch(model.Usuario.Email, @"^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$"))
            {
                ModelState.AddModelError("Email", "e-mail inválido");
                retorno = false;
            }
            if (model.Usuario.Idade == null)
            {
                ModelState.AddModelError("Idade", "Preecha a idade");
                retorno = false;
            }
            else if (model.Usuario.Idade <= 0 || model.Usuario.Idade > 100)
            {
                ModelState.AddModelError("Idade", "idade inválida");
                retorno = false;
            }
            if (string.IsNullOrWhiteSpace(model.Usuario.Sexo))
            {
                ModelState.AddModelError("Sexo", "Preecha o sexo");
                retorno = false;
            }
            else if (!model.Usuario.Sexo.Equals("M",System.StringComparison.InvariantCultureIgnoreCase) && !model.Usuario.Sexo.Equals("F",System.StringComparison.InvariantCultureIgnoreCase))
            {
                ModelState.AddModelError("Sexo", "sexo inválido. M/F por favor.");
                retorno = false;
            }
            return retorno;
        }
    }
}

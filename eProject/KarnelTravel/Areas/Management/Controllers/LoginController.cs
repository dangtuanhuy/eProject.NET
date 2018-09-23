using CaptchaMvc.HtmlHelpers;
using KarnelTravel.Areas.Management.Models;
using KarnelTravel.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace KarnelTravel.Areas.Management.Controllers
{
    public class LoginController : Controller
    {
        // GET: Management/Login
        public ActionResult Login()
        {
            return View();
        }
        [HttpPost]
        public ActionResult Login(LoginModel model)
        {
            if (ModelState.IsValid && this.IsCaptchaValid("Capcha is not valid"))
            {
                var result = CheckRegister(model.Username, model.Password);
                if (result)
                {
                    Session["username"] = model.Username;
                    return RedirectToAction("Index", "Page");

                }
                else
                {
                    ModelState.AddModelError("", "Please check username  or Password!");
                }
            }
            return View("Login");
        }
        public static bool CheckRegister(string username, string password)
        {
            //var pass = Encrypt.MD5_Encode(password);


            var encrpytedPassword = Encrypt.MD5_Encode(password);
            using (KarnelTravelEntities db = new KarnelTravelEntities())
            {
                var singin = from p in db.Admins
                             where p.Username == username && p.Password == encrpytedPassword
                             select p;
                return singin.Any();
            }

        }
        public ActionResult LogOff()
        {
            Session["username"] = null;
            return RedirectToAction("Login", "Login");
        }
    }
}
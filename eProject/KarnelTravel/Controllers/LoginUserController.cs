using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using KarnelTravel.Models;

namespace KarnelTravel.Controllers
{
    public class LoginUserController : Controller
    {
        public static bool CheckRegisterU(string username, string password)
        {
            var encrpytedPassword = Encrypt.MD5_Encode(password);
            using (KarnelTravelEntities db = new KarnelTravelEntities())
            {
                var singin = from p in db.Customers
                             where p.Customer_Id == username && p.Customer_Password == encrpytedPassword
                             select p;
                return singin.Any();
            }
        }
        public ActionResult LoginU()
        {
            return View();
        }
        [HttpPost]
        public ActionResult LoginU(LoginU model)
        {
            if (ModelState.IsValid)
            {
                var result = CheckRegisterU(model.Customer_Id, model.Customer_Password);
                if (result)
                {
                    Session["username"] = model.Customer_Id;
                    return RedirectToAction("Index","Home"); 
                }
                else
                {
                    ModelState.AddModelError("", "Please check username  or Password!");
                }
            }
            return View("LoginU");
        }


        public ActionResult LoginCart()
        {
            return View();
        }
        [HttpPost]
        public ActionResult LoginCart(LoginU model)
        {
            if (ModelState.IsValid)
            {
                var result = CheckRegisterU(model.Customer_Id, model.Customer_Password);
                if (result)
                {
                    Session["username"] = model.Customer_Id;
                    return RedirectToAction("ConfirmCheckOut", "Cart");
                }
                else
                {
                    ModelState.AddModelError("", "Please check username  or Password!");
                }
            }
            return View("LoginCart");
        }

        public ActionResult LogOff()
        {
            Session["username"] = null;
            return RedirectToAction("Index", "Home");
        }
    }
}
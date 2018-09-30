using KarnelTravel.Models;
using System;
using System.Collections.Generic;
using System.Data.Entity.Validation;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace KarnelTravel.Controllers
{
    public class RegisterController : Controller
    {
        // GET: Register
        private KarnelTravelEntities db = new KarnelTravelEntities();
        public ActionResult Register()
        {
           
            return View();
        }
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Register([Bind(Include = "Customer_Id,Customer_Password,Customer_LastName,Customer_FirstName,Customer_Bithday,Customer_Gender,Customer_Phone,Customer_Address,Customer_Email,Customer_Possport")] Customer customer)
        {
            if (ModelState.IsValid)
            {
                try
                {
                    customer.Customer_Password = Encrypt.MD5_Encode(customer.Customer_Password);
                    db.Customers.Add(customer);
                    db.SaveChanges();
                }
                catch(DbEntityValidationException dbEx)
                {
                    foreach (var validationErrors in dbEx.EntityValidationErrors)
                    {
                        foreach (var validationError in validationErrors.ValidationErrors)
                        {
                            System.Console.WriteLine("Property: {0} Error: {1}", validationError.PropertyName, validationError.ErrorMessage);
                        }
                    }
                }
                return RedirectToAction("Home","Index");
            }

            return View(customer);
        }
        public JsonResult CheckCustomer(string Customer)
        {
            return Json(!db.Customers.Any(x => x.Customer_Id == Customer), JsonRequestBehavior.AllowGet);
        }
        public ActionResult Success()
        {
            return View();
        }
    }
}
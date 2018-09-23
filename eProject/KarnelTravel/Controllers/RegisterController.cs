using KarnelTravel.Models;
using System;
using System.Collections.Generic;
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
                db.Customers.Add(customer);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            return View(customer);
        }
    }
}
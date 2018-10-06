using KarnelTravel.Models;
using System;
using System.Collections.Generic;
using System.Data.Entity.Validation;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace KarnelTravel.Controllers
{
    public class ContactController : Controller
    {
        private KarnelTravelEntities db = new KarnelTravelEntities();
        // GET: Contact
        public ActionResult Contact()
        {
            return View();
        }
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Contact([Bind(Include = "FeedbackId,SenderName,SenderMail,FeedBackTitle,FeedBackContent")] Feedback feedback)
        {
            if (ModelState.IsValid)
            {
                try
                {
                    db.Feedbacks.Add(feedback);
                    db.SaveChanges();
                }
                catch (DbEntityValidationException dbEx)
                {
                    foreach (var validationErrors in dbEx.EntityValidationErrors)
                    {
                        foreach (var validationError in validationErrors.ValidationErrors)
                        {
                            System.Console.WriteLine("Property: {0} Error: {1}", validationError.PropertyName, validationError.ErrorMessage);
                        }
                    }
                }
                return RedirectToAction("Index","Home");
            }

            return View(feedback);
        }
    }
}
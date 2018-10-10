using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using KarnelTravel.Models;

namespace KarnelTravel.Areas.Management.Controllers
{
    public class TripsController : BaseController
    {
        private KarnelTravelEntities db = new KarnelTravelEntities();

        // GET: Management/Trips
        public ActionResult Index()
        {
            var trips = db.Trips.Include(t => t.Customer).Include(t => t.PaymentMethod);
            return View(trips.ToList());
        }

        // GET: Management/Trips/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Trip trip = db.Trips.Find(id);
            if (trip == null)
            {
                return HttpNotFound();
            }
            return View(trip);
        }

        // GET: Management/Trips/Create
        public ActionResult Create()
        {
            ViewBag.Customer_Id = new SelectList(db.Customers, "Customer_Id", "Customer_Password");
            ViewBag.PaymentId = new SelectList(db.PaymentMethods, "PaymentId", "PaymentName");
            return View();
        }

        // POST: Management/Trips/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "Trip_Id,Trip_Name,Trip_Details,Trip_Date,Trip_Address,Trip_Status,Customer_Id,PaymentId,MasterOnline")] Trip trip)
        {
            if (ModelState.IsValid)
            {
                db.Trips.Add(trip);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.Customer_Id = new SelectList(db.Customers, "Customer_Id", "Customer_Password", trip.Customer_Id);
            ViewBag.PaymentId = new SelectList(db.PaymentMethods, "PaymentId", "PaymentName", trip.PaymentId);
            return View(trip);
        }

        // GET: Management/Trips/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Trip trip = db.Trips.Find(id);
            if (trip == null)
            {
                return HttpNotFound();
            }
            ViewBag.Customer_Id = new SelectList(db.Customers, "Customer_Id", "Customer_Password", trip.Customer_Id);
            ViewBag.PaymentId = new SelectList(db.PaymentMethods, "PaymentId", "PaymentName", trip.PaymentId);
            return View(trip);
        }

        // POST: Management/Trips/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "Trip_Id,Trip_Name,Trip_Details,Trip_Date,Trip_Address,Trip_Status,Customer_Id,PaymentId,MasterOnline")] Trip trip)
        {
            if (ModelState.IsValid)
            {
                db.Entry(trip).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.Customer_Id = new SelectList(db.Customers, "Customer_Id", "Customer_Password", trip.Customer_Id);
            ViewBag.PaymentId = new SelectList(db.PaymentMethods, "PaymentId", "PaymentName", trip.PaymentId);
            return View(trip);
        }

        // GET: Management/Trips/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Trip trip = db.Trips.Find(id);
            if (trip == null)
            {
                return HttpNotFound();
            }
            return View(trip);
        }

        // POST: Management/Trips/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            Trip trip = db.Trips.Find(id);
            db.Trips.Remove(trip);
            db.SaveChanges();
            return RedirectToAction("Index");
        }

        public ActionResult UpdateStatus(int id)
        {
            Trip ab = db.Trips.Where(c => c.Trip_Id == id).SingleOrDefault();
            if (ab.Trip_Status == false)
            {
                ab.Trip_Status = true;
            }
            else
            {
                ab.Trip_Status = false;
            }
            db.SaveChanges();
            return RedirectToAction("Index", "Trips");

        }



        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }
    }
}

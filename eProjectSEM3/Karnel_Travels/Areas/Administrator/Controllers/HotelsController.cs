using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using Karnel_Travels.Models;

namespace Karnel_Travels.Areas.Administrator.Controllers
{
    public class HotelsController : Controller
    {
        private KarnelTravelEntities db = new KarnelTravelEntities();

        // GET: Administrator/Hotels
        public ActionResult Index()
        {
            var hotels = db.Hotels.Include(h => h.TouristSpot);
            return View(hotels.ToList());
        }

        // GET: Administrator/Hotels/Details/5
        public ActionResult Details(string id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Hotel hotel = db.Hotels.Find(id);
            if (hotel == null)
            {
                return HttpNotFound();
            }
            return View(hotel);
        }

        // GET: Administrator/Hotels/Create
        public ActionResult Create()
        {
            ViewBag.TouristSpot_Id = new SelectList(db.TouristSpots, "TouristSpot_Id", "TouristSpot_Name");
            return View();
        }

        // POST: Administrator/Hotels/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "Hotel_Id,Hotel_Name,Hotel_Address,Hotel_Details,TouristSpot_Id")] Hotel hotel)
        {
            if (ModelState.IsValid)
            {
                db.Hotels.Add(hotel);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.TouristSpot_Id = new SelectList(db.TouristSpots, "TouristSpot_Id", "TouristSpot_Name", hotel.TouristSpot_Id);
            return View(hotel);
        }

        // GET: Administrator/Hotels/Edit/5
        public ActionResult Edit(string id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Hotel hotel = db.Hotels.Find(id);
            if (hotel == null)
            {
                return HttpNotFound();
            }
            ViewBag.TouristSpot_Id = new SelectList(db.TouristSpots, "TouristSpot_Id", "TouristSpot_Name", hotel.TouristSpot_Id);
            return View(hotel);
        }

        // POST: Administrator/Hotels/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "Hotel_Id,Hotel_Name,Hotel_Address,Hotel_Details,TouristSpot_Id")] Hotel hotel)
        {
            if (ModelState.IsValid)
            {
                db.Entry(hotel).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.TouristSpot_Id = new SelectList(db.TouristSpots, "TouristSpot_Id", "TouristSpot_Name", hotel.TouristSpot_Id);
            return View(hotel);
        }

        // GET: Administrator/Hotels/Delete/5
        public ActionResult Delete(string id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Hotel hotel = db.Hotels.Find(id);
            if (hotel == null)
            {
                return HttpNotFound();
            }
            return View(hotel);
        }

        // POST: Administrator/Hotels/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(string id)
        {
            Hotel hotel = db.Hotels.Find(id);
            db.Hotels.Remove(hotel);
            db.SaveChanges();
            return RedirectToAction("Index");
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

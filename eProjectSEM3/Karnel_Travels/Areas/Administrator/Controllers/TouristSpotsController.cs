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
    public class TouristSpotsController : Controller
    {
        private KarnelTravelEntities db = new KarnelTravelEntities();

        // GET: Administrator/TouristSpots
        public ActionResult Index()
        {
            var touristSpots = db.TouristSpots.Include(t => t.Location);
            return View(touristSpots.ToList());
        }

        // GET: Administrator/TouristSpots/Details/5
        public ActionResult Details(string id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            TouristSpot touristSpot = db.TouristSpots.Find(id);
            if (touristSpot == null)
            {
                return HttpNotFound();
            }
            return View(touristSpot);
        }

        // GET: Administrator/TouristSpots/Create
        public ActionResult Create()
        {
            ViewBag.Location_Id = new SelectList(db.Locations, "Location_Id", "Location_Name");
            return View();
        }

        // POST: Administrator/TouristSpots/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "TouristSpot_Id,TouristSpot_Name,TouristSpot_Specific,TouristSpot_Img,Location_Id")] TouristSpot touristSpot)
        {
            if (ModelState.IsValid)
            {
                db.TouristSpots.Add(touristSpot);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.Location_Id = new SelectList(db.Locations, "Location_Id", "Location_Name", touristSpot.Location_Id);
            return View(touristSpot);
        }

        // GET: Administrator/TouristSpots/Edit/5
        public ActionResult Edit(string id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            TouristSpot touristSpot = db.TouristSpots.Find(id);
            if (touristSpot == null)
            {
                return HttpNotFound();
            }
            ViewBag.Location_Id = new SelectList(db.Locations, "Location_Id", "Location_Name", touristSpot.Location_Id);
            return View(touristSpot);
        }

        // POST: Administrator/TouristSpots/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "TouristSpot_Id,TouristSpot_Name,TouristSpot_Specific,TouristSpot_Img,Location_Id")] TouristSpot touristSpot)
        {
            if (ModelState.IsValid)
            {
                db.Entry(touristSpot).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.Location_Id = new SelectList(db.Locations, "Location_Id", "Location_Name", touristSpot.Location_Id);
            return View(touristSpot);
        }

        // GET: Administrator/TouristSpots/Delete/5
        public ActionResult Delete(string id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            TouristSpot touristSpot = db.TouristSpots.Find(id);
            if (touristSpot == null)
            {
                return HttpNotFound();
            }
            return View(touristSpot);
        }

        // POST: Administrator/TouristSpots/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(string id)
        {
            TouristSpot touristSpot = db.TouristSpots.Find(id);
            db.TouristSpots.Remove(touristSpot);
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

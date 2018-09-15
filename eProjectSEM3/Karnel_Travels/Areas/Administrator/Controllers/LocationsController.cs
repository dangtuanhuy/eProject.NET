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
    public class LocationsController : Controller
    {
        private KarnelTravelEntities db = new KarnelTravelEntities();

        // GET: Administrator/Locations
        public ActionResult Index()
        {
            return View(db.Locations.ToList());
        }

        // GET: Administrator/Locations/Details/5
        public ActionResult Details(string id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Location location = db.Locations.Find(id);
            if (location == null)
            {
                return HttpNotFound();
            }
            return View(location);
        }

        // GET: Administrator/Locations/Create
        public ActionResult Create()
        {
            return View();
        }

        // POST: Administrator/Locations/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "Location_Id,Location_Name,Location_Location")] Location location)
        {
            if (ModelState.IsValid)
            {
                db.Locations.Add(location);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            return View(location);
        }

        // GET: Administrator/Locations/Edit/5
        public ActionResult Edit(string id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Location location = db.Locations.Find(id);
            if (location == null)
            {
                return HttpNotFound();
            }
            return View(location);
        }

        // POST: Administrator/Locations/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "Location_Id,Location_Name,Location_Location")] Location location)
        {
            if (ModelState.IsValid)
            {
                db.Entry(location).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            return View(location);
        }

        // GET: Administrator/Locations/Delete/5
        public ActionResult Delete(string id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Location location = db.Locations.Find(id);
            if (location == null)
            {
                return HttpNotFound();
            }
            return View(location);
        }

        // POST: Administrator/Locations/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(string id)
        {
            Location location = db.Locations.Find(id);
            db.Locations.Remove(location);
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

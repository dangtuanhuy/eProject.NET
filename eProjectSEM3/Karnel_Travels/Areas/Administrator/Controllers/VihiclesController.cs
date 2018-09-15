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
    public class VihiclesController : Controller
    {
        private KarnelTravelEntities db = new KarnelTravelEntities();

        // GET: Administrator/Vihicles
        public ActionResult Index()
        {
            var vihicles = db.Vihicles.Include(v => v.Transportation);
            return View(vihicles.ToList());
        }

        // GET: Administrator/Vihicles/Details/5
        public ActionResult Details(string id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Vihicle vihicle = db.Vihicles.Find(id);
            if (vihicle == null)
            {
                return HttpNotFound();
            }
            return View(vihicle);
        }

        // GET: Administrator/Vihicles/Create
        public ActionResult Create()
        {
            ViewBag.Transportation_Id = new SelectList(db.Transportations, "Transportation_Id", "Transportation_Name");
            return View();
        }

        // POST: Administrator/Vihicles/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "Vihicle_Id,Vihicle_Name,Vihicle_Weight,Vihicle_Img,Transportation_Id")] Vihicle vihicle)
        {
            if (ModelState.IsValid)
            {
                db.Vihicles.Add(vihicle);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.Transportation_Id = new SelectList(db.Transportations, "Transportation_Id", "Transportation_Name", vihicle.Transportation_Id);
            return View(vihicle);
        }

        // GET: Administrator/Vihicles/Edit/5
        public ActionResult Edit(string id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Vihicle vihicle = db.Vihicles.Find(id);
            if (vihicle == null)
            {
                return HttpNotFound();
            }
            ViewBag.Transportation_Id = new SelectList(db.Transportations, "Transportation_Id", "Transportation_Name", vihicle.Transportation_Id);
            return View(vihicle);
        }

        // POST: Administrator/Vihicles/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "Vihicle_Id,Vihicle_Name,Vihicle_Weight,Vihicle_Img,Transportation_Id")] Vihicle vihicle)
        {
            if (ModelState.IsValid)
            {
                db.Entry(vihicle).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.Transportation_Id = new SelectList(db.Transportations, "Transportation_Id", "Transportation_Name", vihicle.Transportation_Id);
            return View(vihicle);
        }

        // GET: Administrator/Vihicles/Delete/5
        public ActionResult Delete(string id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Vihicle vihicle = db.Vihicles.Find(id);
            if (vihicle == null)
            {
                return HttpNotFound();
            }
            return View(vihicle);
        }

        // POST: Administrator/Vihicles/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(string id)
        {
            Vihicle vihicle = db.Vihicles.Find(id);
            db.Vihicles.Remove(vihicle);
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

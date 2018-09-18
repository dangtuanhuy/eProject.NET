using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.IO;
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
        public ActionResult UploadTouristSpot(string id)
        {
            return View();
        }
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult UploadTouristSpot(HttpPostedFileBase file, string id)
        {
            var defaultFolderToSaveFile = "~/myImg/TouristSpot/" + id + "/";

            // Kiểm tra nếu chưa tồn tại thư mục trên thì tạo mới. 
            if (Directory.Exists(Server.MapPath(defaultFolderToSaveFile)) == false)
            {
                Directory.CreateDirectory(Server.MapPath(defaultFolderToSaveFile));
            }

            if (ModelState.IsValid)
            {
                // Kiểm tra nếu người dùng có chọn file
                if (file != null && file.ContentLength > 0)
                {
                    // Lấy tên file
                    var fileName = Path.GetFileName(file.FileName);
                    if (fileName != null)
                    {
                        var path = Path.Combine(Server.MapPath(defaultFolderToSaveFile), fileName);

                        var i = 1;
                        while (System.IO.File.Exists(path))
                        {
                            path = Path.Combine(Server.MapPath(defaultFolderToSaveFile), i + "_" + fileName);
                            i++;
                        }

                        // Upload file lên Server ở thư mục ~/myImg/
                        file.SaveAs(path);


                        var imageUrl = defaultFolderToSaveFile + fileName;

                        // Lưu thông tin image url vào product
                        var Tour = db.TouristSpots.Find(id);
                        Tour.TouristSpot_Img = imageUrl;
                        db.SaveChanges();

                        return RedirectToAction("Index");
                    }
                }
            }
            return View();
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

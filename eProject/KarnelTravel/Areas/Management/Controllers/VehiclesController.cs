using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.IO;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using KarnelTravel.Models;

namespace KarnelTravel.Areas.Management.Controllers
{
    public class VehiclesController :BaseController
    {
        private KarnelTravelEntities db = new KarnelTravelEntities();

        // GET: Management/Vehicles
        public ActionResult Index()
        {
            var vehicles = db.Vehicles.Include(v => v.Transportation);
            return View(vehicles.ToList());
        }

        // GET: Management/Vehicles/Details/5
        public ActionResult Details(string id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Vehicle vehicle = db.Vehicles.Find(id);
            if (vehicle == null)
            {
                return HttpNotFound();
            }
            return View(vehicle);
        }

        // GET: Management/Vehicles/Create
        public ActionResult Create()
        {
            ViewBag.Transportation_Id = new SelectList(db.Transportations, "Transportation_Id", "Transportation_Name");
            return View();
        }

        // POST: Management/Vehicles/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "Vehicle_Id,Vehicle_Name,Vehicle_Price,Vehicle_Weight,Vehicle_Img,Transportation_Id")] Vehicle vehicle)
        {
            if (ModelState.IsValid)
            {
                db.Vehicles.Add(vehicle);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.Transportation_Id = new SelectList(db.Transportations, "Transportation_Id", "Transportation_Name", vehicle.Transportation_Id);
            return View(vehicle);
        }

        // GET: Management/Vehicles/Edit/5
        public ActionResult Edit(string id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Vehicle vehicle = db.Vehicles.Find(id);
            if (vehicle == null)
            {
                return HttpNotFound();
            }
            ViewBag.Transportation_Id = new SelectList(db.Transportations, "Transportation_Id", "Transportation_Name", vehicle.Transportation_Id);
            return View(vehicle);
        }

        // POST: Management/Vehicles/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "Vehicle_Id,Vehicle_Name,Vehicle_Price,Vehicle_Weight,Vehicle_Img,Transportation_Id")] Vehicle vehicle)
        {
            if (ModelState.IsValid)
            {
                db.Entry(vehicle).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.Transportation_Id = new SelectList(db.Transportations, "Transportation_Id", "Transportation_Name", vehicle.Transportation_Id);
            return View(vehicle);
        }

        // GET: Management/Vehicles/Delete/5
        public ActionResult Delete(string id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Vehicle vehicle = db.Vehicles.Find(id);
            if (vehicle == null)
            {
                return HttpNotFound();
            }
            return View(vehicle);
        }

        // POST: Management/Vehicles/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(string id)
        {
            Vehicle vehicle = db.Vehicles.Find(id);
            TempData["msg"] = "<script>alert('Can not Delete Vehicles');</script>";
            db.Vehicles.Remove(vehicle);
            db.SaveChanges();
            return RedirectToAction("Index");
        }
        public ActionResult UploadVihicles(string id)
        {
            return View();
        }
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult UploadVihicles(HttpPostedFileBase file, string id)
        {
            var defaultFolderToSaveFile = "~/myImg/Vehicle/" + id + "/";

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

                        // Lấy imageurl để lưu vào database, có định dạng "~/myImg/Vehicle/Id/ten_file.jpg"
                        var imageUrl = defaultFolderToSaveFile + fileName;

                        // Lưu thông tin image url vào product
                        var vehicle = db.Vehicles.Find(id);
                        vehicle.Vehicle_Img = imageUrl;
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

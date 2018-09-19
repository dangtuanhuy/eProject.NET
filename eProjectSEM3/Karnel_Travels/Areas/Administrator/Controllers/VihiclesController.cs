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
                        var vehicle = db.Vihicles.Find(id);
                        vehicle.Vihicle_Img = imageUrl;
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

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
    public class AboutsController : BaseController
    {
        private KarnelTravelEntities db = new KarnelTravelEntities();

        // GET: Management/Abouts
        public ActionResult Index()
        {
            return View(db.Abouts.ToList());
        }

        // GET: Management/Abouts/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            About about = db.Abouts.Find(id);
            if (about == null)
            {
                return HttpNotFound();
            }
            return View(about);
        }

        // GET: Management/Abouts/Create
        public ActionResult Create()
        {
            ViewBag.AboutGender = new List<SelectListItem>
            {
                new SelectListItem {Value = "0", Text = "Male"},
                new SelectListItem {Value = "1", Text = "Female"}
            };
            return View();
        }

        // POST: Management/Abouts/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "AboutId,AboutName,AboutBirth,AboutGender,AboutLike,AboutImg")] About about)
        {
            ViewBag.AboutGender = new List<SelectListItem>
            {
                new SelectListItem {Value = "0", Text = "Male"},
                new SelectListItem {Value = "1", Text = "Female"}
            };
            if (ModelState.IsValid)
            {
                db.Abouts.Add(about);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            return View(about);
        }

        // GET: Management/Abouts/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            About about = db.Abouts.Find(id);
            if (about == null)
            {
                return HttpNotFound();
            }
            var listTrangThai = new[]
            {
                new {TrangThai = 0, Ten = "Male"},
                new {TrangThai = 1, Ten = "Female"}
            };

            ViewBag.AboutGender = new SelectList(listTrangThai, "TrangThai", "Ten", about.AboutGender);
            return View(about);
        }

        // POST: Management/Abouts/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "AboutId,AboutName,AboutBirth,AboutGender,AboutLike,AboutImg")] About about)
        {

            if (ModelState.IsValid)
            {
                db.Entry(about).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            var listTrangThai = new[]
               {
                new {TrangThai = 0, Ten = "Male"},
                new {TrangThai = 1, Ten = "Female"}
            };

            ViewBag.AboutGender = new SelectList(listTrangThai, "TrangThai", "Ten", about.AboutGender);
            return View(about);
        }

        // GET: Management/Abouts/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            About about = db.Abouts.Find(id);
            if (about == null)
            {
                return HttpNotFound();
            }
            return View(about);
        }

        // POST: Management/Abouts/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            About about = db.Abouts.Find(id);
            db.Abouts.Remove(about);
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

        public ActionResult UploadAbout(string id)
        {
            return View();
        }
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult UploadAbout(HttpPostedFileBase file, int id)
        {
            var defaultFolderToSaveFile = "~/myImg/Abouts/" + id + "/";

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
                        var About = db.Abouts.Find(id);
                        About.AboutImg = imageUrl;
                        db.SaveChanges();

                        return RedirectToAction("Index");
                    }
                }
            }
            return View();
        }

        //public ActionResult UpdateStatus(int id)
        //{
        //    try
        //{
        //       About ab = db.Abouts.Where(c => c.AboutId == id).SingleOrDefault();

        //       if (ab.AboutGender == false)
        //        {

        //            ab.AboutGender = true;
        //        }
        //        else if (ab.AboutGender == true)
        //        {
        //            ab.AboutGender = false;
        //        }
        //        db.SaveChanges();

        //        return Json(ab, JsonRequestBehavior.AllowGet);
        //    }
        //    catch
        //    {
        //        return new HttpStatusCodeResult(HttpStatusCode.InternalServerError);
        //    }
        //}

        //public ActionResult IndexStatus()
        //{
        //    List<About> listAbout = new List<About>();
        //    try
        //    {
        //        listAbout = db.Abouts.Where(u => u.AboutGender == false).ToList();

        //    }
        //    catch
        //    {
        //        return new HttpStatusCodeResult(HttpStatusCode.InternalServerError);
        //    }
        //    return View(listAbout);
        //}
    }
}

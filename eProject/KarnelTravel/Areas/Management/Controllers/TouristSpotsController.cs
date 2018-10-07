using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Data.Entity.Validation;
using System.IO;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using KarnelTravel.Models;

namespace KarnelTravel.Areas.Management.Controllers
{
    public class TouristSpotsController : BaseController
    {
        private KarnelTravelEntities db = new KarnelTravelEntities();

        // GET: Management/TouristSpots
        public ActionResult Index()
        {
            var touristSpots = db.TouristSpots.Include(t => t.Location);
            return View(touristSpots.ToList());
        }


        

        // GET: Management/TouristSpots/Details/5
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

        // GET: Management/TouristSpots/Create
        public ActionResult Create()
        {
            ViewBag.Location_Id = new SelectList(db.Locations, "Location_Id", "Location_Name");
            return View();
        }

        // POST: Management/TouristSpots/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "TouristSpot_Id,TouristSpot_Name,TouristSpot_Limit,TouristSpot_Price,TouristSpot_Specific,TouristSpot_Status,Location_Id,TouristSpot_Create")] TouristSpot touristSpot)
        {
            if (ModelState.IsValid)
            {
                try
                {
                    touristSpot.TouristSpot_Create = DateTime.Now;
                    db.TouristSpots.Add(touristSpot);
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
                return RedirectToAction("Index");
            }

            ViewBag.Location_Id = new SelectList(db.Locations, "Location_Id", "Location_Name", touristSpot.Location_Id);
            return View(touristSpot);
        }

        // GET: Management/TouristSpots/Edit/5
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

        // POST: Management/TouristSpots/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "TouristSpot_Id,TouristSpot_Name,TouristSpot_Limit,TouristSpot_Price,TouristSpot_Specific,TouristSpot_Status,Location_Id,TouristSpot_Create")] TouristSpot touristSpot)
        {
            if (ModelState.IsValid)
            {
                try
                {
                    touristSpot.TouristSpot_Create = DateTime.Now;
                    db.Entry(touristSpot).State = EntityState.Modified;
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
                return RedirectToAction("Index");
            }
            ViewBag.Location_Id = new SelectList(db.Locations, "Location_Id", "Location_Name", touristSpot.Location_Id);
            return View(touristSpot);
        }

        // GET: Management/TouristSpots/Delete/5
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

        // POST: Management/TouristSpots/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(string id)
        {
            TouristSpot touristSpot = db.TouristSpots.Find(id);
            db.TouristSpots.Remove(touristSpot);
            db.SaveChanges();
            return RedirectToAction("Index");
        }
        //Upload Multi File
        public ActionResult UploadTouristSpots(string id)
        {
            if (id == null)
            {
                return RedirectToAction("Index");
            }
            var products = db.TouristSpots.Include(s => s.ImgTouristSpots).SingleOrDefault(p => p.TouristSpot_Id == id);
            if (products == null)
            {
                object Err = "Information not find";
                return View("Error", Err);
            }
            return View(products);
        }
        [HttpPost]
        public ActionResult UploadTouristSpots(string id, HttpPostedFileBase[] files)
        {
            byte max = 0;
            var listImg = db.ImgTouristSpots.Where(p => p.TouristSpot_Id == id).ToList();
            if (listImg.Count > 0)
                max = listImg.Max(p => p.Img_TouristSpot_Sort);
            var listFile = files.Where(p => p != null);
            foreach (var f in listFile)
            {
                //T?o m?t d?i tu?ng
                var img = new ImgTouristSpot();
                img.TouristSpot_Id = id;
                img.Img_TouristSpot = f.FileName;
                img.Img_TouristSpot_Sort = ++max;
                db.ImgTouristSpots.Add(img);
                var path = Server.MapPath("~/myImg/TouristSpot/" + f.FileName);
                f.SaveAs(path);
            }
            if (listFile.Any())
                db.SaveChanges();
            return RedirectToAction("UploadTouristSpots");
        }

        public ActionResult DeleteImg(int id, string Food_Code)
        {
            if (Food_Code == null)
            {
                try
                {
                    var img = db.ImgTouristSpots.Find(id);
                    if (img == null)
                        return RedirectToAction("Index");
                    db.ImgTouristSpots.Remove(img);
                    var fileName = img.Img_TouristSpot;
                    var path = Server.MapPath("~/myImg/TouristSpot/" + fileName);
                    var file = new FileInfo(path);

                    if (file.Exists)
                    {
                        file.Delete();
                    }

                    db.SaveChanges();
                    return RedirectToAction("UploadTouristSpots");
                }

                catch (Exception ex)
                {
                    object mess = "Can not Delete IMG " + ex.Message;
                    return View("Error", mess);
                }
            }

            TempData["Success_Mess"] = "<script>alert('Delete Success')</script>";
            return Redirect("~/TouristSpots/UploadTouristSpots/" + Food_Code);
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }

        public ActionResult UpdateStatus(string id)
        {
            try
            {
                TouristSpot ab = db.TouristSpots.Where(c => c.TouristSpot_Id == id).SingleOrDefault();

                if (ab.TouristSpot_Status == false)
                {

                    ab.TouristSpot_Status = true;
                }
                else if (ab.TouristSpot_Status == true)
                {
                    ab.TouristSpot_Status = false;
                }
                db.SaveChanges();

                return Json(ab, JsonRequestBehavior.AllowGet);
            }
            catch
            {
                return new HttpStatusCodeResult(HttpStatusCode.InternalServerError);
            }
        }

        public ActionResult IndexStatus()
        {
            List<TouristSpot> listTour = new List<TouristSpot>();
            try
            {
                listTour = db.TouristSpots.Where(u => u.TouristSpot_Status == false).ToList();

            }
            catch
            {
                return new HttpStatusCodeResult(HttpStatusCode.InternalServerError);
            }
            return View(listTour);
        }

       

    }
}

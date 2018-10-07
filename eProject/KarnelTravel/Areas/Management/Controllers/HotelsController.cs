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
    public class HotelsController : BaseController
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
        public ActionResult Create([Bind(Include = "Hotel_Id,Hotel_Name,Hotel_Address,Hotel_Status,Hotel_Details,TouristSpot_Id,Hotel_Create")] Hotel hotel)
        {
            if (ModelState.IsValid)
            {
                try
                {
                    hotel.Hotel_Status = true;
                    hotel.Hotel_Create = DateTime.Now;
                    db.Hotels.Add(hotel);
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
        public ActionResult Edit([Bind(Include = "Hotel_Id,Hotel_Name,Hotel_Address,Hotel_Status,Hotel_Details,TouristSpot_Id,Hotel_Create")] Hotel hotel)
        {
            if (ModelState.IsValid)
            {
                try
                {
                    hotel.Hotel_Status = true;
                    hotel.Hotel_Create = DateTime.Now;
                    db.Entry(hotel).State = EntityState.Modified;
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

        public ActionResult UploadHotels(string id)
        {
            if (id == null)
            {
                return RedirectToAction("Index");
            }
            var products = db.Hotels.Include(s => s.ImgHotels).SingleOrDefault(p => p.Hotel_Id == id);
            if (products == null)
            {
                object Err = "Information not find";
                return View("Error", Err);
            }
            return View(products);
        }
        [HttpPost]
        public ActionResult UploadHotels(string id, HttpPostedFileBase[] files)
        {
            byte max = 0;
            var listImg = db.ImgHotels.Where(p => p.Hotel_Id == id).ToList();
            if (listImg.Count > 0)
                max = listImg.Max(p => p.Img_Hotels_Sort);
            var listFile = files.Where(p => p != null);
            foreach (var f in listFile)
            {
                //T?o m?t d?i tu?ng
                var img = new ImgHotel();
                img.Hotel_Id = id;
                img.Img_Hotels = f.FileName;
                img.Img_Hotels_Sort = ++max;
                db.ImgHotels.Add(img);
                var path = Server.MapPath("~/myImg/Hotels/" + f.FileName);
                f.SaveAs(path);
            }
            if (listFile.Any())
                db.SaveChanges();
            return RedirectToAction("UploadHotels");
        }

        public ActionResult DeleteImg(int id, string Hotel_Id)
        {
            if (Hotel_Id == null)
            {
                try
                {
                    var img = db.ImgHotels.Find(id);
                    if (img == null)
                        return RedirectToAction("Index");
                    db.ImgHotels.Remove(img);
                    var fileName = img.Img_Hotels;
                    var path = Server.MapPath("~/myImg/Hotels/" + fileName);
                    var file = new FileInfo(path);

                    if (file.Exists)
                    {
                        file.Delete();
                    }

                    db.SaveChanges();
                    return RedirectToAction("UploadHotels");
                }

                catch (Exception ex)
                {
                    object mess = "Can not Delete IMG " + ex.Message;
                    return View("Error", mess);
                }
            }

            TempData["Success_Mess"] = "<script>alert('Delete Success')</script>";
            return Redirect("~/Hotels/UploadHotels/" + Hotel_Id);
        }
        [AllowAnonymous]
        [HttpGet]
        public JsonResult CheckHotel(string Hotel)
        {
            return Json(!db.Hotels.Any(x => x.Hotel_Id == Hotel), JsonRequestBehavior.AllowGet);
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

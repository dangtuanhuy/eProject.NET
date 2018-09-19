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
    public class RestaurantsController : Controller
    {
        private KarnelTravelEntities db = new KarnelTravelEntities();

        // GET: Administrator/Restaurants
        public ActionResult Index()
        {
            var restaurants = db.Restaurants.Include(r => r.TouristSpot);
            return View(restaurants.ToList());
        }

        // GET: Administrator/Restaurants/Details/5
        public ActionResult Details(string id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Restaurant restaurant = db.Restaurants.Find(id);
            if (restaurant == null)
            {
                return HttpNotFound();
            }
            return View(restaurant);
        }

        // GET: Administrator/Restaurants/Create
        public ActionResult Create()
        {
            ViewBag.TouristSpot_Id = new SelectList(db.TouristSpots, "TouristSpot_Id", "TouristSpot_Name");
            return View();
        }

        // POST: Administrator/Restaurants/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "Restaurant_Code,Restaurant_Name,Restaurant_Address,Restaurant_Description,TouristSpot_Id")] Restaurant restaurant)
        {
            if (ModelState.IsValid)
            {
                db.Restaurants.Add(restaurant);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.TouristSpot_Id = new SelectList(db.TouristSpots, "TouristSpot_Id", "TouristSpot_Name", restaurant.TouristSpot_Id);
            return View(restaurant);
        }

        // GET: Administrator/Restaurants/Edit/5
        public ActionResult Edit(string id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Restaurant restaurant = db.Restaurants.Find(id);
            if (restaurant == null)
            {
                return HttpNotFound();
            }
            ViewBag.TouristSpot_Id = new SelectList(db.TouristSpots, "TouristSpot_Id", "TouristSpot_Name", restaurant.TouristSpot_Id);
            return View(restaurant);
        }

        // POST: Administrator/Restaurants/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "Restaurant_Code,Restaurant_Name,Restaurant_Address,Restaurant_Description,TouristSpot_Id")] Restaurant restaurant)
        {
            if (ModelState.IsValid)
            {
                db.Entry(restaurant).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.TouristSpot_Id = new SelectList(db.TouristSpots, "TouristSpot_Id", "TouristSpot_Name", restaurant.TouristSpot_Id);
            return View(restaurant);
        }

        // GET: Administrator/Restaurants/Delete/5
        public ActionResult Delete(string id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Restaurant restaurant = db.Restaurants.Find(id);
            if (restaurant == null)
            {
                return HttpNotFound();
            }
            return View(restaurant);
        }

        // POST: Administrator/Restaurants/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(string id)
        {
            Restaurant restaurant = db.Restaurants.Find(id);
            db.Restaurants.Remove(restaurant);
            db.SaveChanges();
            return RedirectToAction("Index");
        }
        public ActionResult UploadRestaurants(string id)
        {
            if (id == null)
            {
                return RedirectToAction("Index");
            }
            var products = db.Restaurants.Include(s => s.ImgRestaurants).SingleOrDefault(p => p.Restaurant_Code == id);
            if (products == null)
            {
                object Err = "Information not find";
                return View("Error", Err);
            }
            return View(products);
        }
        [HttpPost]
        public ActionResult UploadRestaurants(string id, HttpPostedFileBase[] files)
        {
            byte max = 0;
            var listImg = db.ImgRestaurants.Where(p => p.Restaurant_Code == id).ToList();
            if (listImg.Count > 0)
                max = listImg.Max(p => p.Img_Restaurants_Sort);
            var listFile = files.Where(p => p != null);
            foreach (var f in listFile)
            {
                //Tạo một đối tượng
                var img = new ImgRestaurant();
                img.Restaurant_Code = id;
                img.Img_Restaurants = f.FileName;
                img.Img_Restaurants_Sort = ++max;
                db.ImgRestaurants.Add(img);
                var path = Server.MapPath("~/myImg/Restaurants/" + f.FileName);
                f.SaveAs(path);
            }
            if (listFile.Any())
                db.SaveChanges();
            return RedirectToAction("UploadRestaurants");
        }

        public ActionResult DeleteImg(int id, string Restaurant_Code)
        {
            if (Restaurant_Code == null)
            {
                try
                {
                    var img = db.ImgRestaurants.Find(id);
                    if (img == null)
                        return RedirectToAction("Index");
                    db.ImgRestaurants.Remove(img);
                    var fileName = img.Img_Restaurants;
                    var path = Server.MapPath("~/myImg/Restaurants/" + fileName);
                    var file = new FileInfo(path);

                    if (file.Exists)
                    {
                        file.Delete();
                    }

                    db.SaveChanges();
                    return RedirectToAction("UploadRestaurants");
                }

                catch (Exception ex)
                {
                    object mess = "Can not Delete IMG " + ex.Message;
                    return View("Error", mess);
                }
            }

            TempData["Success_Mess"] = "<script>alert('Delete Success')</script>";
            return Redirect("~/Restaurants/UploadRestaurants/" + Restaurant_Code);
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

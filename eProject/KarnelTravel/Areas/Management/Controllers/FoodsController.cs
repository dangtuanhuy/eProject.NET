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
    public class FoodsController :BaseController
    {
        private KarnelTravelEntities db = new KarnelTravelEntities();

        // GET: Administrator/Foods
        public ActionResult Index()
        {
            var foods = db.Foods.Include(f => f.Restaurant);
            return View(foods.ToList());
        }

        // GET: Administrator/Foods/Details/5
        public ActionResult Details(string id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Food food = db.Foods.Find(id);
            if (food == null)
            {
                return HttpNotFound();
            }
            return View(food);
        }

        // GET: Administrator/Foods/Create
        public ActionResult Create()
        {
            ViewBag.Restaurant_Code = new SelectList(db.Restaurants, "Restaurant_Code", "Restaurant_Name");
            return View();
        }

        // POST: Administrator/Foods/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "Food_Code,Food_Name,Food_Cost,Food_Specific,Restaurant_Code")] Food food)
        {
            if (ModelState.IsValid)
            {
                db.Foods.Add(food);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.Restaurant_Code = new SelectList(db.Restaurants, "Restaurant_Code", "Restaurant_Name", food.Restaurant_Code);
            return View(food);
        }

        // GET: Administrator/Foods/Edit/5
        public ActionResult Edit(string id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Food food = db.Foods.Find(id);
            if (food == null)
            {
                return HttpNotFound();
            }
            ViewBag.Restaurant_Code = new SelectList(db.Restaurants, "Restaurant_Code", "Restaurant_Name", food.Restaurant_Code);
            return View(food);
        }

        // POST: Administrator/Foods/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "Food_Code,Food_Name,Food_Cost,Food_Specific,Restaurant_Code")] Food food)
        {
            if (ModelState.IsValid)
            {
                db.Entry(food).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.Restaurant_Code = new SelectList(db.Restaurants, "Restaurant_Code", "Restaurant_Name", food.Restaurant_Code);
            return View(food);
        }

        // GET: Administrator/Foods/Delete/5
        public ActionResult Delete(string id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Food food = db.Foods.Find(id);
            if (food == null)
            {
                return HttpNotFound();
            }
            return View(food);
        }

        // POST: Administrator/Foods/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(string id)
        {
            Food food = db.Foods.Find(id);
            try
            {
                db.Foods.Remove(food);
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            catch(Exception e)
            {
                TempData["msg"] = "<script>alert('Can not Delete Record');</script>";
                e.ToString();

                return RedirectToAction("Index");
            }
        }

        public ActionResult UploadFoods(string id)
        {
            if (id == null)
            {
                return RedirectToAction("Index");
            }
            var products = db.Foods.Include(s => s.ImgFoods).SingleOrDefault(p => p.Food_Code == id);
            if (products == null)
            {
                object Err = "Information not find";
                return View("Error", Err);
            }
            return View(products);
        }
        [HttpPost]
        public ActionResult UploadFoods(string id, HttpPostedFileBase[] files)
        {
            byte max = 0;
            var listImg = db.ImgFoods.Where(p => p.Food_Code == id).ToList();
            if (listImg.Count > 0)
                max = listImg.Max(p => p.Img_Foods_Sort);
            var listFile = files.Where(p => p != null);
            foreach (var f in listFile)
            {

                var img = new ImgFood();
                img.Food_Code = id;
                img.Img_Foods = f.FileName;
                img.Img_Foods_Sort = ++max;
                db.ImgFoods.Add(img);
                var path = Server.MapPath("~/myImg/Foods/" + f.FileName);
                f.SaveAs(path);
            }
            if (listFile.Any())
                db.SaveChanges();
            return RedirectToAction("UploadFoods");
        }

        public ActionResult DeleteImg(int id, string Food_Code)
        {
            if (Food_Code == null)
            {
                try
                {
                    var img = db.ImgFoods.Find(id);
                    if (img == null)
                        return RedirectToAction("Index");
                    db.ImgFoods.Remove(img);
                    var fileName = img.Img_Foods;
                    var path = Server.MapPath("~/myImg/Foods/" + fileName);
                    var file = new FileInfo(path);

                    if (file.Exists)
                    {
                        file.Delete();
                    }

                    db.SaveChanges();
                    return RedirectToAction("UploadFoods");
                }

                catch (Exception ex)
                {
                    object mess = "Can not Delete IMG " + ex.Message;
                    return View("Error", mess);
                }
            }

            TempData["Success_Mess"] = "<script>alert('Delete Success')</script>";
            return Redirect("~/Foods/UploadFoods/" + Food_Code);
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

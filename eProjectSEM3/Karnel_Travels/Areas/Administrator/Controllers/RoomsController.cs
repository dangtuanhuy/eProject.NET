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
    public class RoomsController : Controller
    {
        private KarnelTravelEntities db = new KarnelTravelEntities();

        // GET: Administrator/Rooms
        public ActionResult Index()
        {
            var rooms = db.Rooms.Include(r => r.Hotel);
            return View(rooms.ToList());
        }

        // GET: Administrator/Rooms/Details/5
        public ActionResult Details(string id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Room room = db.Rooms.Find(id);
            if (room == null)
            {
                return HttpNotFound();
            }
            return View(room);
        }

        // GET: Administrator/Rooms/Create
        public ActionResult Create()
        {
            ViewBag.Hotel_Id = new SelectList(db.Hotels, "Hotel_Id", "Hotel_Name");
            return View();
        }

        // POST: Administrator/Rooms/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "Room_Id,Room_Type,Room_Name,Room_Start,Room_Stop,Room_Cost,Hotel_Id")] Room room)
        {
            if (ModelState.IsValid)
            {
                db.Rooms.Add(room);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.Hotel_Id = new SelectList(db.Hotels, "Hotel_Id", "Hotel_Name", room.Hotel_Id);
            return View(room);
        }

        // GET: Administrator/Rooms/Edit/5
        public ActionResult Edit(string id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Room room = db.Rooms.Find(id);
            if (room == null)
            {
                return HttpNotFound();
            }
            ViewBag.Hotel_Id = new SelectList(db.Hotels, "Hotel_Id", "Hotel_Name", room.Hotel_Id);
            return View(room);
        }

        // POST: Administrator/Rooms/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "Room_Id,Room_Type,Room_Name,Room_Start,Room_Stop,Room_Cost,Hotel_Id")] Room room)
        {
            if (ModelState.IsValid)
            {
                db.Entry(room).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.Hotel_Id = new SelectList(db.Hotels, "Hotel_Id", "Hotel_Name", room.Hotel_Id);
            return View(room);
        }

        // GET: Administrator/Rooms/Delete/5
        public ActionResult Delete(string id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Room room = db.Rooms.Find(id);
            if (room == null)
            {
                return HttpNotFound();
            }
            return View(room);
        }

        // POST: Administrator/Rooms/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(string id)
        {
            Room room = db.Rooms.Find(id);
            db.Rooms.Remove(room);
            db.SaveChanges();
            return RedirectToAction("Index");
        }

        public ActionResult UploadRooms(string id)
        {
            if (id == null)
            {
                return RedirectToAction("Index");
            }
            var products = db.Rooms.Include(s => s.ImgRooms).SingleOrDefault(p => p.Room_Id == id);
            if (products == null)
            {
                object Err = "Information not find";
                return View("Error", Err);
            }
            return View(products);
        }
        [HttpPost]
        public ActionResult UploadRooms(string id, HttpPostedFileBase[] files)
        {
            byte max = 0;
            var listImg = db.ImgRooms.Where(p => p.Room_Id == id).ToList();
            if (listImg.Count > 0)
                max = listImg.Max(p => p.Img_Rooms_Sort);
            var listFile = files.Where(p => p != null);
            foreach (var f in listFile)
            {
                //Tạo một đối tượng
                var img = new ImgRoom();
                img.Room_Id = id;
                img.Img_Rooms = f.FileName;
                img.Img_Rooms_Sort = ++max;
                db.ImgRooms.Add(img);
                var path = Server.MapPath("~/myImg/Rooms/" + f.FileName);
                f.SaveAs(path);
            }
            if (listFile.Any())
                db.SaveChanges();
            return RedirectToAction("UploadRooms");
        }

        public ActionResult DeleteImg(int id, string Room_Id)
        {
            if (Room_Id == null)
            {
                try
                {
                    var img = db.ImgRooms.Find(id);
                    if (img == null)
                        return RedirectToAction("Index");
                    db.ImgRooms.Remove(img);
                    var fileName = img.Img_Rooms;
                    var path = Server.MapPath("~/myImg/Rooms/" + fileName);
                    var file = new FileInfo(path);

                    if (file.Exists)
                    {
                        file.Delete();
                    }

                    db.SaveChanges();
                    return RedirectToAction("UploadRooms");
                }

                catch (Exception ex)
                {
                    object mess = "Can not Delete IMG " + ex.Message;
                    return View("Error", mess);
                }
            }

            TempData["Success_Mess"] = "<script>alert('Delete Success')</script>";
            return Redirect("~/Rooms/UploadRooms/" + Room_Id);
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

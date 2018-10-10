using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using KarnelTravel.Models;
namespace KarnelTravel.Controllers
{
    public class HomeController : Controller
    {
        KarnelTravelEntities db = new KarnelTravelEntities();
        public ActionResult Index()
        {
            var TouristSpots1 = db.TouristSpots.Where(u => u.TouristSpot_Status == true).OrderByDescending(u => u.TouristSpot_Create);
            ViewBag.TouristSpots1 = TouristSpots1;

            var Restaurant1 = db.Restaurants.Where(n => n.Restaurant_Status == true).OrderByDescending(n => n.Restaurant_Create);
            ViewBag.Restaurant1 = Restaurant1;

            var Hotel1 = db.Hotels.Where(u => u.Hotel_Status == true).OrderByDescending(u => u.Hotel_Create);
            ViewBag.Hotel1 = Hotel1;

            var Food1 = (from p in db.Foods select p).OrderByDescending(p => p.Food_Code);
            ViewBag.Food1 = Food1;

            return View();
        }
        public ActionResult _TourisSpot()
        {
            return PartialView();
        }
        public ActionResult _Food()
        {
            return PartialView();
        }
    }
}
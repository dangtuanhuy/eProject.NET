using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using KarnelTravel.Models;

namespace KarnelTravel.Controllers
{
    public class HotelController : Controller
    {
        KarnelTravelEntities db = new KarnelTravelEntities();
        public ActionResult Index()
        {
            var lstHotel1 = db.Hotels.Where(u => u.TouristSpot_Id == "TS1");
            ViewBag.lstHotel1 = lstHotel1;
            var lstHotel2 = db.Hotels.Where(u => u.TouristSpot_Id == "TS2");
            ViewBag.lstHotel2 = lstHotel2;
            return View();
        }
        public ActionResult _partiHotel1()
        {
            return PartialView();
        }
    }
}
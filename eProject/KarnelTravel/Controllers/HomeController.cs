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
            var TouristSpots1 = db.TouristSpots.Where(u => u.Location_Id == "LC1");
            ViewBag.TouristSpots1 = TouristSpots1;
            return View();
        }
        public ActionResult _TourisSpot()
        {
            return PartialView();
        }
    }
}
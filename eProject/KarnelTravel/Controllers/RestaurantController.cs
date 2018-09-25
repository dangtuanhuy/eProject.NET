using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using KarnelTravel.Models;
namespace KarnelTravel.Controllers
{
    public class RestaurantController : Controller
    {
        KarnelTravelEntities db = new KarnelTravelEntities();
        public ActionResult Index()
        {
            var lstRest1 = db.Restaurants.Where(u => u.TouristSpot_Id == "TS1");
            ViewBag.lstRest1 = lstRest1;
            return View();
        }
        public ActionResult _partiRest1()
        {
            return PartialView();
        }
    }
}
using KarnelTravel.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace KarnelTravel.Areas.Management.Controllers
{
    public class PageController : BaseController
    {
        private KarnelTravelEntities db = new KarnelTravelEntities();
        // GET: Management/Page
        public ActionResult Index()
        {
            return View();
        }
        public ActionResult _countRestaurant()
        {
            var List = db.Restaurants.Count();
            ViewBag.ListCount = List;
            return PartialView();
        }
        public ActionResult _countVehicle()
        {
            var List = db.Vehicles.Count();
            ViewBag.ListVehicle = List;
            return PartialView();
        }
        public ActionResult _countCustomer()
        {
            var ListCustomer =
                (from p in db.Customers select p).Count();
            ViewBag.ListCustomer = ListCustomer;

            return PartialView();
        }
        public ActionResult _statusFeedBack()
        {
            var statusFeedBack = (from p in db.Feedbacks where p.State == false select p).Count();
            ViewBag.statusFeedBack = statusFeedBack;
            return PartialView();
        }
        public ActionResult _countHotel()
        {
            var countHotels = db.Hotels.Count();
            ViewBag.countHotels = countHotels;
            return PartialView();
        }
        public ActionResult _countLocation()
        {
            var countLocation = db.Locations.Count();
            ViewBag.countLocation = countLocation;
            return PartialView();
        }
        public ActionResult _countFood()
        {
            var countFoods = db.Foods.Count();
            ViewBag.countFoods = countFoods;
            return PartialView();
        }
        public ActionResult _countTransportation()
        {
            var countTransportations = db.Transportations.Count();
            ViewBag.countTransportations = countTransportations;
            return PartialView();
        }
        public ActionResult _footerPage()
        {
            return PartialView("_FooterPage");
        }
    }
}
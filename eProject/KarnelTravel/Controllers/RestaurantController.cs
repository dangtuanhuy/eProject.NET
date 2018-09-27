using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using KarnelTravel.Models;
using PagedList;

namespace KarnelTravel.Controllers
{
    public class RestaurantController : Controller
    {
        KarnelTravelEntities db = new KarnelTravelEntities();
        public ActionResult Index(string sortOrder, string searchString, int? page, string currentFilter)
        {
            var lstRest1 = db.Restaurants.Where(u => u.TouristSpot_Id == "TS1");
            ViewBag.lstRest1 = lstRest1;

            ViewBag.CurrentSort = sortOrder;
            ViewBag.NameSortParm = String.IsNullOrEmpty(sortOrder) ? "name_desc" : "";
            ViewBag.DateSortParm = sortOrder == "Date" ? "date_desc" : "Date";
            if (searchString != null)
            {
                page = 1;
            }
            else
            {
                searchString = currentFilter;
            }
            ViewBag.CurrentFilter = searchString;
            var lstNew = from s in db.Restaurants
                         select s;
            if (!String.IsNullOrEmpty(searchString))
            {
                lstNew = lstNew.Where(s => s.Restaurant_Name.Contains(searchString)
                                       || s.Restaurant_Address.Contains(searchString));
            }

            lstNew = lstNew.OrderBy(s => s.Restaurant_Code);
            int pageSize = 3;
            int pageNumber = (page ?? 1);
            return View(lstNew.ToPagedList(pageNumber, pageSize));
        }
        public ActionResult _partiRest1()
        {
            return PartialView();
        }
    }
}
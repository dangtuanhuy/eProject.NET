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
            ViewBag.CurrentSort = sortOrder;
            ViewBag.NameSortParm = String.IsNullOrEmpty(sortOrder) ? "name_desc" : "";
            if (searchString != null)
            {
                page = 1;
            }
            else
            {
                searchString = currentFilter;
            }
            ViewBag.CurrentFilter = searchString;
            if (!String.IsNullOrEmpty(searchString))
            {
                lstRest1 = lstRest1.Where(s => s.Restaurant_Name.Contains(searchString)
                                       || s.Restaurant_Address.Contains(searchString));
            }   
            int PageSize = 6;
            int PageNumber = (page ?? 1);
            return View(lstRest1.OrderBy(n => n.Restaurant_Code).ToPagedList(PageNumber, PageSize));
        }
    }
}
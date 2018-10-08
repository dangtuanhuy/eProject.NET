using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
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
            var lstRest1 = db.Restaurants
                .Include("TouristSpot")
                .Where(u => u.Restaurant_Status == true);
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
            int PageSize = 9;
            int PageNumber = (page ?? 1);
            return View(lstRest1.OrderBy(n => n.Restaurant_Code).ToPagedList(PageNumber, PageSize));
        }
        public ActionResult DetaislRestaurant(string id)
        {

            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Restaurant restaurant = db.Restaurants.Include("ImgRestaurants").SingleOrDefault(item => item.Restaurant_Code == id);
            if (restaurant == null)
            {
                return HttpNotFound();
            }
            return View(restaurant);
        }
    }
}
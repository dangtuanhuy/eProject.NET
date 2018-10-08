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
    public class TourisSpotController : Controller
    {
        KarnelTravelEntities db = new KarnelTravelEntities();
        public ActionResult Index(string sortOrder, string searchString, int? page, string currentFilter)
        {
            var lstTouris = db.TouristSpots
                .Include("Location")
                .Where(u => u.TouristSpot_Status == true);
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
                lstTouris = lstTouris.Where(s => s.TouristSpot_Name.Contains(searchString)
                                       || s.TouristSpot_Specific.Contains(searchString) 
                                       || s.Location.Location_Name.Contains(searchString));
            }
            int PageSize = 9;
            int PageNumber = (page ?? 1);
            return View(lstTouris.OrderBy(n => n.TouristSpot_Id).ToPagedList(PageNumber, PageSize));
        }
        public ActionResult TourisSpotDetails(string id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            TouristSpot touristSpot = db.TouristSpots.Include("ImgTouristSpots").SingleOrDefault(item => item.TouristSpot_Id == id);
            
            if (touristSpot == null)
            {
                return HttpNotFound();
            }
            return View(touristSpot);
        }
    }
}
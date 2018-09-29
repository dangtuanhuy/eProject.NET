using System;
using System.Collections.Generic;
using System.Linq;
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
            var lstTouris = db.TouristSpots.Where(u => u.TouristSpot_Status == true);
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
                                       || s.TouristSpot_Specific.Contains(searchString));
            }
            int PageSize = 9;
            int PageNumber = (page ?? 1);
            return View(lstTouris.OrderBy(n => n.TouristSpot_Id).ToPagedList(PageNumber, PageSize));
        }
    }
}
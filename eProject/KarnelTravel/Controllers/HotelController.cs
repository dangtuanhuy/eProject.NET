using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using KarnelTravel.Models;
using PagedList;
using PagedList.Mvc;

namespace KarnelTravel.Controllers
{
    public class HotelController : Controller
    {
        KarnelTravelEntities db = new KarnelTravelEntities();
        public ActionResult Index(string sortOrder, string searchString, int? page, string currentFilter)
        {
            var lstHotel1 = db.Hotels.Where(u => u.TouristSpot_Id == "TS1");
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
                lstHotel1 = lstHotel1.Where(s => s.Hotel_Name.Contains(searchString)
                                       || s.Hotel_Address.Contains(searchString));
            }
            int PageSize = 6;
            int PageNumber = (page ?? 1);
            return View(lstHotel1.OrderBy(n => n.Hotel_Id).ToPagedList(PageNumber, PageSize));
        }
        public ActionResult _partiHotel1()
        {
            return PartialView();
        }

    }
}
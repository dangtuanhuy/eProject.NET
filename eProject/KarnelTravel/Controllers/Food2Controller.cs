using KarnelTravel.Models;
using PagedList;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace KarnelTravel.Controllers
{
    public class Food2Controller : Controller
    {
        KarnelTravelEntities db = new KarnelTravelEntities();
        // GET: Food2
        public ActionResult Index(string sortOrder, string searchString, int? page, string currentFilter)
        {
            {
                var food = (from p in db.Foods select p);
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
                    food = food.Where(s => s.Food_Name.Contains(searchString)
                                           || s.Food_Specific.Contains(searchString));
                }
                int PageSize = 9;
                int PageNumber = (page ?? 1);
                return View(food.OrderBy(n => n.Food_Code).ToPagedList(PageNumber, PageSize));
            }
        }
    }
}
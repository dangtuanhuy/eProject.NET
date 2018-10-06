using KarnelTravel.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace KarnelTravel.Controllers
{
    public class AboutController : Controller
    {
        KarnelTravelEntities db = new KarnelTravelEntities();
        // GET: About
        public ActionResult About()
        {
            var Persion = (from p in db.Abouts select p);
            
            return View(Persion.ToList());
        }
    }
}
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace KarnelTravel.Controllers
{
    public class TourisSpotController : Controller
    {
        // GET: TourisSpot
        public ActionResult Index()
        {
            return View();
        }
        public ActionResult _ImgTravel()
        {
            return PartialView();
        }
    }
}
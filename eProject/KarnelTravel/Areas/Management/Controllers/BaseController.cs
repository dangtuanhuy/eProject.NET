using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace KarnelTravel.Areas.Management.Controllers
{
    public class BaseController : Controller
    {
        // GET: Management/Base
        protected override void OnActionExecuted(ActionExecutedContext filterContext)
        {
            var session = Session["username"];
            if (session == null)
            {
                filterContext.Result = new RedirectToRouteResult(new System.Web.Routing.RouteValueDictionary(new
                {
                    Controller = "Login",
                    Action = "Login"
                }));
            }
            base.OnActionExecuted(filterContext);
        }
        protected void setAlert(string message, string type)
        {
            TempData["AlertMessage"] = message;
            if (type == "success")
            {
                TempData["AlertType"] = "alert-success";
            }
            else if (type == "waring")
            { TempData["AlertType"] = "alert-waring"; }
            else if (type == "erro")
            { TempData["AlertType"] = "alert-erro"; }
        }
    }
}
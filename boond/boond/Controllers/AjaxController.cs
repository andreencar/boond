using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace boond.Controllers
{
    public class AjaxController : Controller
    {
        [Authorize]
        [HttpPost]
        public ActionResult GetNextBattle(int categoryID ) {

            return Json(new { foo = "bar" });
        }

        public ActionResult GetNextOpponent(int categoryID, int winnerID){

            return Json(new { foo = "bar", baz = "Blech" });
        }
    }
}
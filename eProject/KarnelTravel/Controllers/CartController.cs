using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using KarnelTravel.Models;
using Microsoft.AspNet.Identity;
namespace KarnelTravel.Controllers
{
    public class CartController : Controller
    {
        KarnelTravelEntities db = new KarnelTravelEntities();
        public List<ItemGioHang> LayGioHang()
        {
            // Giỏ hàng đã tồn tại
            List<ItemGioHang> lstGioHang = Session["GioHang"] as List<ItemGioHang>;
            if (lstGioHang == null)
            {
                lstGioHang = new List<ItemGioHang>();
                Session["GioHang"] = lstGioHang;
            }
            return lstGioHang;
        }

        //Thêm giỏ hàng thông thường load lại trang

        public ActionResult ThemGioHang(String TouristSpotId, String strUrl)
        {
            // Kiểm tra sản phẩm có tồn tại trong CSLD hay không?
            TouristSpot sp = db.TouristSpots.SingleOrDefault(n => n.TouristSpot_Id == TouristSpotId);
            if (sp == null)
            {
                // Trang đường dẫn không hợp lệ
                Response.StatusCode = 404;
            }
            // Lấy giỏ hàng
            List<ItemGioHang> lstGioHang = LayGioHang();

            //TH1 sản phẩm đã tồn tại trong giỏ hàng
            ItemGioHang spCheck = lstGioHang.SingleOrDefault(n => n.TouristSpot_Id == TouristSpotId);
            if (spCheck != null)
            {
                if (sp.TouristSpot_Status == false)
                {
                    return View("ThongBao");
                }
                spCheck.TourisQty++;
                spCheck.ThanhTien = spCheck.TourisQty * spCheck.TouristSpot_Price;
                return Redirect(strUrl);
            }
            if (sp.TouristSpot_Status == false)
            {
                return View("ThongBao");
            }
            ItemGioHang itemGH = new ItemGioHang(TouristSpotId);
            lstGioHang.Add(itemGH);
            return Redirect(strUrl);

        }

        public double TinhTongSoLuong()
        {
            List<ItemGioHang> lstGioHang = Session["GioHang"] as List<ItemGioHang>;
            if (lstGioHang == null)
            {
                return 0;
            }
            return lstGioHang.Sum(n => n.TourisQty);
        }
        public decimal TinhTongTien()
        {
            List<ItemGioHang> lstGioHang = Session["GioHang"] as List<ItemGioHang>;
            if (lstGioHang == null)
            {
                return 0;
            }
            return lstGioHang.Sum(n => n.ThanhTien);

        }

        // GET: ShoppingCart
        public ActionResult XemGioHang()
        {
            List<ItemGioHang> giohang = Session["GioHang"] as List<ItemGioHang>;
            return View(giohang);
        }

        public ActionResult SuaSoLuong(String TouristSpotId, int soluongmoi)
        {
            // tìm carditem muon sua
            List<ItemGioHang> giohang = Session["GioHang"] as List<ItemGioHang>;
            ItemGioHang itemSua = giohang.FirstOrDefault(m => m.TouristSpot_Id == TouristSpotId);
            if (itemSua != null)
            {
                itemSua.TourisQty = soluongmoi;
                itemSua.ThanhTien = itemSua.TourisQty * itemSua.TouristSpot_Price;
            }
            return RedirectToAction("XemGioHang");

        }
        public RedirectToRouteResult XoaKhoiGio(String TouristSpotId)
        {
            List<ItemGioHang> giohang = Session["GioHang"] as List<ItemGioHang>;
            ItemGioHang itemXoa = giohang.FirstOrDefault(m => m.TouristSpot_Id == TouristSpotId);
            if (itemXoa != null)
            {
                giohang.Remove(itemXoa);
            }
            return RedirectToAction("XemGioHang");
        }
        public ActionResult ConfirmCheckOut()
        {
            return View();
        }
        [HttpPost]
        public ActionResult ConfirmCheckOut([Bind(Include = "Trip_Name,Trip_Address,Trip_Details")] Trip order)
        {
            if (ModelState.IsValid)
            {
                var userId = Session["username"];
                order.Trip_Date = DateTime.Now;
                order.Customer_Id = Convert.ToString(userId);
                //order.UserId = null;
                order.Trip_Status = false;
                db.Trips.Add(order);
                db.SaveChanges();
                // Them chi tiet
                List<ItemGioHang> lstGH = LayGioHang();
                foreach (var item in lstGH)
                {
                    var details = new TripDetail();
                    details.Trip_Id = order.Trip_Id;
                    details.TouristSpot_Id = item.TouristSpot_Id;
                    details.Trip_Quantity = item.TourisQty;
                    details.OrginalPrice = item.TouristSpot_Price;
                    db.TripDetails.Add(details);
                    
                }
                db.SaveChanges();
                foreach (var item in lstGH)
                {
                    var tour = db.TouristSpots.SingleOrDefault(u => u.TouristSpot_Id == item.TouristSpot_Id);
                    tour.TouristSpot_Limit = tour.TouristSpot_Limit - item.TourisQty;
                }
                db.SaveChanges();
                Session["GioHang"] = null;
                return RedirectToAction("Susses", "Cart");
            }
            return View();
        }
        public ActionResult Susses()
        {
            return View();
        }
    }
}
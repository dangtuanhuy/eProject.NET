using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using KarnelTravel.Models;

namespace KarnelTravel.Models
{
    public class ItemGioHang
    {
        public TouristSpot touristSpot { set; get; }
        public ImgTouristSpot ImgTouristSpot { set; get; }
        public int TourisQty { set; get; }
        public String TouristSpot_Id { set; get; }
        public decimal TouristSpot_Price { get; set; }
        public List<ImgTouristSpot> ImgTouris { get; set; }
        public String TouristSpot_Name { get; set; }
        public Decimal ThanhTien { get; set; }
        public ItemGioHang(String TouristSpotId)
        {
            using (KarnelTravelEntities db = new KarnelTravelEntities())
            {
                TouristSpot tour = db.TouristSpots.Include("ImgTouristSpots").Single(x => x.TouristSpot_Id == TouristSpotId);
                this.TouristSpot_Id = TouristSpotId;
                this.TourisQty = 1;
                this.TouristSpot_Name = tour.TouristSpot_Name;
                this.TouristSpot_Price = tour.TouristSpot_Price.Value;
                this.ThanhTien = tour.TouristSpot_Price.Value * this.TourisQty;
                this.ImgTouris = tour.ImgTouristSpots.ToList();

            }
        }
    }
}
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace Karnel_Travels.Models
{
    [MetadataTypeAttribute(typeof(Hotel.HotelMetaData))]
    public partial class Hotel
    {
        internal sealed class HotelMetaData
        {
            [Display(Name = "ID")]
            public string Hotel_Id { get; set; }

            [Display(Name = "Hotel")]
            public string Hotel_Name { get; set; }

            [Display(Name = "Address")]
            [DataType(DataType.MultilineText)]
            public string Hotel_Address { get; set; }

            [Display(Name = "Details")]
            [DataType(DataType.MultilineText)]
            public string Hotel_Details { get; set; }

            public string TouristSpot_Id { get; set; }
        }
    }
}